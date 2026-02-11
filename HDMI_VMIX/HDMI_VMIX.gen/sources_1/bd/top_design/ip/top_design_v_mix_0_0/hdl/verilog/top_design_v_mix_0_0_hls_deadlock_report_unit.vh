   
    parameter PROC_NUM = 15;
    parameter ST_IDLE = 3'b000;
    parameter ST_FILTER_FAKE = 3'b001;
    parameter ST_DL_DETECTED = 3'b010;
    parameter ST_DL_REPORT = 3'b100;
   

    reg [2:0] CS_fsm;
    reg [2:0] NS_fsm;
    reg [PROC_NUM - 1:0] dl_detect_reg;
    reg [PROC_NUM - 1:0] dl_done_reg;
    reg [PROC_NUM - 1:0] origin_reg;
    reg [PROC_NUM - 1:0] dl_in_vec_reg;
    reg [31:0] dl_keep_cnt;
    reg stop_report_path;
    reg [PROC_NUM - 1:0] reported_proc;
    integer i;
    integer fp;

    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            reported_proc <= 'b0;
        end
        else if (CS_fsm == ST_DL_REPORT) begin
            reported_proc <= reported_proc | dl_in_vec;
        end
        else if (CS_fsm == ST_DL_DETECTED) begin
            reported_proc <= 'b0;
        end
    end

    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            stop_report_path <= 1'b0;
        end
        else if (CS_fsm == ST_DL_REPORT && (|(dl_in_vec & reported_proc))) begin
            stop_report_path <= 1'b1;
        end
        else if (CS_fsm == ST_IDLE) begin
            stop_report_path <= 1'b0;
        end
    end

    // FSM State machine
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            CS_fsm <= ST_IDLE;
        end
        else begin
            CS_fsm <= NS_fsm;
        end
    end

    always @ (CS_fsm or dl_in_vec or dl_detect_reg or dl_done_reg or dl_in_vec or origin_reg or dl_keep_cnt) begin
        case (CS_fsm)
            ST_IDLE : begin
                if (|dl_in_vec) begin
                    NS_fsm = ST_FILTER_FAKE;
                end
                else begin
                    NS_fsm = ST_IDLE;
                end
            end
            ST_FILTER_FAKE: begin
                if (dl_keep_cnt >= 32'd1000) begin
                    NS_fsm = ST_DL_DETECTED;
                end
                else if (dl_detect_reg != (dl_detect_reg & dl_in_vec)) begin
                    NS_fsm = ST_IDLE;
                end
                else begin
                    NS_fsm = ST_FILTER_FAKE;
                end
            end
            ST_DL_DETECTED: begin
                // has unreported deadlock cycle
                if ((dl_detect_reg != dl_done_reg) && stop_report_path == 1'b0) begin
                    NS_fsm = ST_DL_REPORT;
                end
                else begin
                    NS_fsm = ST_DL_DETECTED;
                end
            end
            ST_DL_REPORT: begin
                if (|(dl_in_vec & origin_reg)) begin
                    NS_fsm = ST_DL_DETECTED;
                end
                // avoid report deadlock ring.
                else if (|(dl_in_vec & reported_proc)) begin
                    NS_fsm = ST_DL_DETECTED;
                end
                else begin
                    NS_fsm = ST_DL_REPORT;
                end
            end
            default: NS_fsm = ST_IDLE;
        endcase
    end

    // dl_detect_reg record the procs that first detect deadlock
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            dl_detect_reg <= 'b0;
        end
        else begin
            if (CS_fsm == ST_IDLE) begin
                dl_detect_reg <= dl_in_vec;
            end
        end
    end

    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            dl_keep_cnt <= 32'h0;
        end
        else begin
            if (CS_fsm == ST_FILTER_FAKE && (dl_detect_reg == (dl_detect_reg & dl_in_vec))) begin
                dl_keep_cnt <= dl_keep_cnt + 32'h1;
            end
            else if (CS_fsm == ST_FILTER_FAKE && (dl_detect_reg != (dl_detect_reg & dl_in_vec))) begin
                dl_keep_cnt <= 32'h0;
            end
        end
    end

    // dl_detect_out keeps in high after deadlock detected
    assign dl_detect_out = (|dl_detect_reg) && (CS_fsm == ST_DL_DETECTED || CS_fsm == ST_DL_REPORT);

    // dl_done_reg record the cycles has been reported
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            dl_done_reg <= 'b0;
        end
        else begin
            if ((CS_fsm == ST_DL_REPORT) && (|(dl_in_vec & dl_detect_reg) == 'b1)) begin
                dl_done_reg <= dl_done_reg | dl_in_vec;
            end
        end
    end

    // clear token once a cycle is done
    assign token_clear = (CS_fsm == ST_DL_REPORT) ? ((|(dl_in_vec & origin_reg)) ? 'b1 : 'b0) : 'b0;

    // origin_reg record the current cycle start id
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            origin_reg <= 'b0;
        end
        else begin
            if (CS_fsm == ST_DL_DETECTED) begin
                origin_reg <= origin;
            end
        end
    end
   
    // origin will be valid for only one cycle
    wire [PROC_NUM*PROC_NUM - 1:0] origin_tmp;
    assign origin_tmp[PROC_NUM - 1:0] = (dl_detect_reg[0] & ~dl_done_reg[0]) ? 'b1 : 'b0;
    genvar j;
    generate
    for(j = 1;j < PROC_NUM;j = j + 1) begin: F1
        assign origin_tmp[j*PROC_NUM +: PROC_NUM] = (dl_detect_reg[j] & ~dl_done_reg[j]) ? ('b1 << j) : origin_tmp[(j - 1)*PROC_NUM +: PROC_NUM];
    end
    endgenerate
    always @ (CS_fsm or origin_tmp) begin
        if (CS_fsm == ST_DL_DETECTED) begin
            origin = origin_tmp[(PROC_NUM - 1)*PROC_NUM +: PROC_NUM];
        end
        else begin
            origin = 'b0;
        end
    end

    
    // dl_in_vec_reg record the current cycle dl_in_vec
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            dl_in_vec_reg <= 'b0;
        end
        else begin
            if (CS_fsm == ST_DL_DETECTED) begin
                dl_in_vec_reg <= origin;
            end
            else if (CS_fsm == ST_DL_REPORT) begin
                dl_in_vec_reg <= dl_in_vec;
            end
        end
    end
    
    // find_df_deadlock to report the deadlock
    always @ (negedge dl_reset or posedge dl_clock) begin
        if (~dl_reset) begin
            find_df_deadlock <= 1'b0;
        end
        else begin
            if (CS_fsm == ST_DL_DETECTED && ((dl_detect_reg == dl_done_reg) || (stop_report_path == 1'b1))) begin
                find_df_deadlock <= 1'b1;
            end
            else if (CS_fsm == ST_IDLE) begin
                find_df_deadlock <= 1'b0;
            end
        end
    end
    
    // get the first valid proc index in dl vector
    function integer proc_index(input [PROC_NUM - 1:0] dl_vec);
        begin
            proc_index = 0;
            for (i = 0; i < PROC_NUM; i = i + 1) begin
                if (dl_vec[i]) begin
                    proc_index = i;
                end
            end
        end
    endfunction

    // get the proc path based on dl vector
    function [784:0] proc_path(input [PROC_NUM - 1:0] dl_vec);
        integer index;
        begin
            index = proc_index(dl_vec);
            case (index)
                0 : begin
                    proc_path = "top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.AXIvideo2MultiPixStream_U0";
                end
                1 : begin
                    proc_path = "top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_1_U0";
                end
                2 : begin
                    proc_path = "top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_2_U0";
                end
                3 : begin
                    proc_path = "top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_3_U0";
                end
                4 : begin
                    proc_path = "top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.AXIMMvideo2Bytes_1_U0";
                end
                5 : begin
                    proc_path = "top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.Bytes2MultiPixStream_10_U0";
                end
                6 : begin
                    proc_path = "top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_U0";
                end
                7 : begin
                    proc_path = "top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_U0";
                end
                8 : begin
                    proc_path = "top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_U0";
                end
                9 : begin
                    proc_path = "top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_upsample_false_U0";
                end
                10 : begin
                    proc_path = "top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_core_alpha_false_false_U0";
                end
                11 : begin
                    proc_path = "top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_rgb2yuv_false_U0";
                end
                12 : begin
                    proc_path = "top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_444_to_422_false_U0";
                end
                13 : begin
                    proc_path = "top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_420_false_U0";
                end
                14 : begin
                    proc_path = "top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.MultiPixStream2AXIvideo_U0";
                end
                default : begin
                    proc_path = "unknown";
                end
            endcase
        end
    endfunction

    // print the headlines of deadlock detection
    task print_dl_head;
        begin
            $display("\n//////////////////////////////////////////////////////////////////////////////");
            $display("// ERROR!!! DEADLOCK DETECTED at %0t ns! SIMULATION WILL BE STOPPED! //", $time);
            $display("//////////////////////////////////////////////////////////////////////////////");
            fp = $fopen("deadlock_db.dat", "w");
        end
    endtask

    // print the start of a cycle
    task print_cycle_start(input reg [784:0] proc_path, input integer cycle_id);
        begin
            $display("/////////////////////////");
            $display("// Dependence cycle %0d:", cycle_id);
            $display("// (1): Process: %0s", proc_path);
            $fdisplay(fp, "Dependence_Cycle_ID %0d", cycle_id);
            $fdisplay(fp, "Dependence_Process_ID 1");
            $fdisplay(fp, "Dependence_Process_path %0s", proc_path);
        end
    endtask

    // print the end of deadlock detection
    task print_dl_end(input integer num, input integer record_time);
        begin
            $display("////////////////////////////////////////////////////////////////////////");
            $display("// Totally %0d cycles detected!", num);
            $display("////////////////////////////////////////////////////////////////////////");
            $display("// ERROR!!! DEADLOCK DETECTED at %0t ns! SIMULATION WILL BE STOPPED! //", record_time);
            $display("//////////////////////////////////////////////////////////////////////////////");
            $fdisplay(fp, "Dependence_Cycle_Number %0d", num);
            $fclose(fp);
        end
    endtask

    // print one proc component in the cycle
    task print_cycle_proc_comp(input reg [784:0] proc_path, input integer cycle_comp_id);
        begin
            $display("// (%0d): Process: %0s", cycle_comp_id, proc_path);
            $fdisplay(fp, "Dependence_Process_ID %0d", cycle_comp_id);
            $fdisplay(fp, "Dependence_Process_path %0s", proc_path);
        end
    endtask

    // print one channel component in the cycle
    task print_cycle_chan_comp(input [PROC_NUM - 1:0] dl_vec1, input [PROC_NUM - 1:0] dl_vec2);
        reg [880:0] chan_path;
        integer index1;
        integer index2;
        begin
            index1 = proc_index(dl_vec1);
            index2 = proc_index(dl_vec2);
            case (index1)
                0 : begin // for proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.AXIvideo2MultiPixStream_U0'
                    case(index2)
                    1: begin //  for dep proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_1_U0'
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer0_U' info is :
// blk sig is {~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.AXIvideo2MultiPixStream_U0.grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_162.srcLayer0_blk_n data_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.AXIvideo2MultiPixStream_U0.grp_AXIvideo2MultiPixStream_Pipeline_loop_width_fu_162.srcLayer0_blk_n)) begin
                            if (~grp_VMixHlsDataFlowFunction_fu_415.srcLayer0_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer0_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer0_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~grp_VMixHlsDataFlowFunction_fu_415.srcLayer0_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer0_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer0_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_420_to_422_false_1_U0_U' info is :
// blk sig is {{~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_420_to_422_false_1_U0_U.if_full_n & top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.AXIvideo2MultiPixStream_U0.ap_start & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.AXIvideo2MultiPixStream_U0.real_start & (trans_in_cnt_0 == trans_out_cnt_0) & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_420_to_422_false_1_U0_U.if_read} start_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_420_to_422_false_1_U0_U.if_full_n & grp_VMixHlsDataFlowFunction_fu_415.AXIvideo2MultiPixStream_U0.ap_start & ~grp_VMixHlsDataFlowFunction_fu_415.AXIvideo2MultiPixStream_U0.real_start & (trans_in_cnt_0 == trans_out_cnt_0) & ~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_420_to_422_false_1_U0_U.if_read)) begin
                            $display("//      Blocked by full output start propagation FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_420_to_422_false_1_U0_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_1_U0',");
                        end
                    end
                    4: begin //  for dep proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.AXIMMvideo2Bytes_1_U0'
// for dep channel '' info is :
// blk sig is {{top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.ap_sync_AXIvideo2MultiPixStream_U0_ap_ready & top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.AXIvideo2MultiPixStream_U0.ap_idle & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.ap_sync_AXIMMvideo2Bytes_1_U0_ap_ready} input_sync}
                        if ((grp_VMixHlsDataFlowFunction_fu_415.ap_sync_AXIvideo2MultiPixStream_U0_ap_ready & grp_VMixHlsDataFlowFunction_fu_415.AXIvideo2MultiPixStream_U0.ap_idle & ~grp_VMixHlsDataFlowFunction_fu_415.ap_sync_AXIMMvideo2Bytes_1_U0_ap_ready)) begin
                            $display("//      Blocked by input sync logic with process : 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.AXIMMvideo2Bytes_1_U0'");
                        end
                    end
                    endcase
                end
                1 : begin // for proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_1_U0'
                    case(index2)
                    0: begin //  for dep proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.AXIvideo2MultiPixStream_U0'
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer0_U' info is :
// blk sig is {~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_1_U0.grp_v_mix_420_to_422_false_1_Pipeline_VITIS_LOOP_76_2_fu_74.srcLayer0_blk_n data_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_1_U0.grp_v_mix_420_to_422_false_1_Pipeline_VITIS_LOOP_76_2_fu_74.srcLayer0_blk_n)) begin
                            if (~grp_VMixHlsDataFlowFunction_fu_415.srcLayer0_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer0_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.AXIvideo2MultiPixStream_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer0_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~grp_VMixHlsDataFlowFunction_fu_415.srcLayer0_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer0_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.AXIvideo2MultiPixStream_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer0_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_420_to_422_false_1_U0_U' info is :
// blk sig is {{~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_420_to_422_false_1_U0_U.if_empty_n & top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_1_U0.ap_idle & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_420_to_422_false_1_U0_U.if_write} start_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_420_to_422_false_1_U0_U.if_empty_n & grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_1_U0.ap_idle & ~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_420_to_422_false_1_U0_U.if_write)) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_420_to_422_false_1_U0_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.AXIvideo2MultiPixStream_U0',");
                        end
                    end
                    2: begin //  for dep proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_2_U0'
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer0Yuv422_U' info is :
// blk sig is {~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_1_U0.grp_v_mix_420_to_422_false_1_Pipeline_VITIS_LOOP_76_2_fu_74.srcLayer0Yuv422_blk_n data_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_1_U0.grp_v_mix_420_to_422_false_1_Pipeline_VITIS_LOOP_76_2_fu_74.srcLayer0Yuv422_blk_n)) begin
                            if (~grp_VMixHlsDataFlowFunction_fu_415.srcLayer0Yuv422_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer0Yuv422_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer0Yuv422_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~grp_VMixHlsDataFlowFunction_fu_415.srcLayer0Yuv422_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer0Yuv422_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer0Yuv422_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_422_to_444_false_2_U0_U' info is :
// blk sig is {{~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_422_to_444_false_2_U0_U.if_full_n & top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_1_U0.ap_start & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_1_U0.real_start & (trans_in_cnt_1 == trans_out_cnt_1) & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_422_to_444_false_2_U0_U.if_read} start_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_422_to_444_false_2_U0_U.if_full_n & grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_1_U0.ap_start & ~grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_1_U0.real_start & (trans_in_cnt_1 == trans_out_cnt_1) & ~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_422_to_444_false_2_U0_U.if_read)) begin
                            $display("//      Blocked by full output start propagation FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_422_to_444_false_2_U0_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_2_U0',");
                        end
                    end
                    endcase
                end
                2 : begin // for proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_2_U0'
                    case(index2)
                    1: begin //  for dep proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_1_U0'
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer0Yuv422_U' info is :
// blk sig is {~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_2_U0.grp_v_mix_422_to_444_false_2_Pipeline_VITIS_LOOP_105_2_fu_74.srcLayer0Yuv422_blk_n data_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_2_U0.grp_v_mix_422_to_444_false_2_Pipeline_VITIS_LOOP_105_2_fu_74.srcLayer0Yuv422_blk_n)) begin
                            if (~grp_VMixHlsDataFlowFunction_fu_415.srcLayer0Yuv422_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer0Yuv422_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer0Yuv422_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~grp_VMixHlsDataFlowFunction_fu_415.srcLayer0Yuv422_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer0Yuv422_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer0Yuv422_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_422_to_444_false_2_U0_U' info is :
// blk sig is {{~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_422_to_444_false_2_U0_U.if_empty_n & top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_2_U0.ap_idle & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_422_to_444_false_2_U0_U.if_write} start_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_422_to_444_false_2_U0_U.if_empty_n & grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_2_U0.ap_idle & ~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_422_to_444_false_2_U0_U.if_write)) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_422_to_444_false_2_U0_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_1_U0',");
                        end
                    end
                    3: begin //  for dep proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_3_U0'
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer0Yuv_U' info is :
// blk sig is {~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_2_U0.grp_v_mix_422_to_444_false_2_Pipeline_VITIS_LOOP_105_2_fu_74.srcLayer0Yuv_blk_n data_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_2_U0.grp_v_mix_422_to_444_false_2_Pipeline_VITIS_LOOP_105_2_fu_74.srcLayer0Yuv_blk_n)) begin
                            if (~grp_VMixHlsDataFlowFunction_fu_415.srcLayer0Yuv_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer0Yuv_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_3_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer0Yuv_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~grp_VMixHlsDataFlowFunction_fu_415.srcLayer0Yuv_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer0Yuv_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_3_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer0Yuv_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_yuv2rgb_false_3_U0_U' info is :
// blk sig is {{~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_yuv2rgb_false_3_U0_U.if_full_n & top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_2_U0.ap_start & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_2_U0.real_start & (trans_in_cnt_2 == trans_out_cnt_2) & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_yuv2rgb_false_3_U0_U.if_read} start_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_yuv2rgb_false_3_U0_U.if_full_n & grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_2_U0.ap_start & ~grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_2_U0.real_start & (trans_in_cnt_2 == trans_out_cnt_2) & ~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_yuv2rgb_false_3_U0_U.if_read)) begin
                            $display("//      Blocked by full output start propagation FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_yuv2rgb_false_3_U0_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_3_U0',");
                        end
                    end
                    endcase
                end
                3 : begin // for proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_3_U0'
                    case(index2)
                    2: begin //  for dep proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_2_U0'
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer0Yuv_U' info is :
// blk sig is {~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_3_U0.grp_v_mix_yuv2rgb_false_3_Pipeline_VITIS_LOOP_897_2_fu_74.srcLayer0Yuv_blk_n data_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_3_U0.grp_v_mix_yuv2rgb_false_3_Pipeline_VITIS_LOOP_897_2_fu_74.srcLayer0Yuv_blk_n)) begin
                            if (~grp_VMixHlsDataFlowFunction_fu_415.srcLayer0Yuv_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer0Yuv_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer0Yuv_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~grp_VMixHlsDataFlowFunction_fu_415.srcLayer0Yuv_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer0Yuv_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_2_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer0Yuv_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_yuv2rgb_false_3_U0_U' info is :
// blk sig is {{~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_yuv2rgb_false_3_U0_U.if_empty_n & top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_3_U0.ap_idle & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_yuv2rgb_false_3_U0_U.if_write} start_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_yuv2rgb_false_3_U0_U.if_empty_n & grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_3_U0.ap_idle & ~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_yuv2rgb_false_3_U0_U.if_write)) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_yuv2rgb_false_3_U0_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_2_U0',");
                        end
                    end
                    10: begin //  for dep proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_core_alpha_false_false_U0'
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.outLayer0_U' info is :
// blk sig is {~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_3_U0.grp_v_mix_yuv2rgb_false_3_Pipeline_VITIS_LOOP_897_2_fu_74.outLayer0_blk_n data_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_3_U0.grp_v_mix_yuv2rgb_false_3_Pipeline_VITIS_LOOP_897_2_fu_74.outLayer0_blk_n)) begin
                            if (~grp_VMixHlsDataFlowFunction_fu_415.outLayer0_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.outLayer0_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_core_alpha_false_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.outLayer0_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~grp_VMixHlsDataFlowFunction_fu_415.outLayer0_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.outLayer0_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_core_alpha_false_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.outLayer0_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_core_alpha_false_false_U0_U' info is :
// blk sig is {{~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_core_alpha_false_false_U0_U.if_full_n & top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_3_U0.ap_start & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_3_U0.real_start & (trans_in_cnt_8 == trans_out_cnt_8) & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_core_alpha_false_false_U0_U.if_read} start_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_core_alpha_false_false_U0_U.if_full_n & grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_3_U0.ap_start & ~grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_3_U0.real_start & (trans_in_cnt_8 == trans_out_cnt_8) & ~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_core_alpha_false_false_U0_U.if_read)) begin
                            $display("//      Blocked by full output start propagation FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_core_alpha_false_false_U0_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_core_alpha_false_false_U0',");
                        end
                    end
                    endcase
                end
                4 : begin // for proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.AXIMMvideo2Bytes_1_U0'
                    case(index2)
                    5: begin //  for dep proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.Bytes2MultiPixStream_10_U0'
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.bytesLayer1_plane0_U' info is :
// blk sig is {~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.AXIMMvideo2Bytes_1_U0.grp_AXIMMvideo2Bytes_1_Pipeline_VITIS_LOOP_203_2_fu_138.bytesLayer1_plane0_blk_n data_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.AXIMMvideo2Bytes_1_U0.grp_AXIMMvideo2Bytes_1_Pipeline_VITIS_LOOP_203_2_fu_138.bytesLayer1_plane0_blk_n)) begin
                            if (~grp_VMixHlsDataFlowFunction_fu_415.bytesLayer1_plane0_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.bytesLayer1_plane0_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.Bytes2MultiPixStream_10_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.bytesLayer1_plane0_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~grp_VMixHlsDataFlowFunction_fu_415.bytesLayer1_plane0_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.bytesLayer1_plane0_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.Bytes2MultiPixStream_10_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.bytesLayer1_plane0_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_Bytes2MultiPixStream_10_U0_U' info is :
// blk sig is {{~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_Bytes2MultiPixStream_10_U0_U.if_full_n & top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.AXIMMvideo2Bytes_1_U0.ap_start & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.AXIMMvideo2Bytes_1_U0.real_start & (trans_in_cnt_3 == trans_out_cnt_3) & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_Bytes2MultiPixStream_10_U0_U.if_read} start_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.start_for_Bytes2MultiPixStream_10_U0_U.if_full_n & grp_VMixHlsDataFlowFunction_fu_415.AXIMMvideo2Bytes_1_U0.ap_start & ~grp_VMixHlsDataFlowFunction_fu_415.AXIMMvideo2Bytes_1_U0.real_start & (trans_in_cnt_3 == trans_out_cnt_3) & ~grp_VMixHlsDataFlowFunction_fu_415.start_for_Bytes2MultiPixStream_10_U0_U.if_read)) begin
                            $display("//      Blocked by full output start propagation FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_Bytes2MultiPixStream_10_U0_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.Bytes2MultiPixStream_10_U0',");
                        end
                    end
                    0: begin //  for dep proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.AXIvideo2MultiPixStream_U0'
// for dep channel '' info is :
// blk sig is {{top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.ap_sync_AXIMMvideo2Bytes_1_U0_ap_ready & top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.AXIMMvideo2Bytes_1_U0.ap_idle & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.ap_sync_AXIvideo2MultiPixStream_U0_ap_ready} input_sync}
                        if ((grp_VMixHlsDataFlowFunction_fu_415.ap_sync_AXIMMvideo2Bytes_1_U0_ap_ready & grp_VMixHlsDataFlowFunction_fu_415.AXIMMvideo2Bytes_1_U0.ap_idle & ~grp_VMixHlsDataFlowFunction_fu_415.ap_sync_AXIvideo2MultiPixStream_U0_ap_ready)) begin
                            $display("//      Blocked by input sync logic with process : 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.AXIvideo2MultiPixStream_U0'");
                        end
                    end
                    endcase
                end
                5 : begin // for proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.Bytes2MultiPixStream_10_U0'
                    case(index2)
                    4: begin //  for dep proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.AXIMMvideo2Bytes_1_U0'
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.bytesLayer1_plane0_U' info is :
// blk sig is {~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.Bytes2MultiPixStream_10_U0.grp_Bytes2MultiPixStream_10_Pipeline_VITIS_LOOP_1104_2_fu_72.bytesLayer1_plane0_blk_n data_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.Bytes2MultiPixStream_10_U0.grp_Bytes2MultiPixStream_10_Pipeline_VITIS_LOOP_1104_2_fu_72.bytesLayer1_plane0_blk_n)) begin
                            if (~grp_VMixHlsDataFlowFunction_fu_415.bytesLayer1_plane0_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.bytesLayer1_plane0_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.AXIMMvideo2Bytes_1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.bytesLayer1_plane0_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~grp_VMixHlsDataFlowFunction_fu_415.bytesLayer1_plane0_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.bytesLayer1_plane0_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.AXIMMvideo2Bytes_1_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.bytesLayer1_plane0_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_Bytes2MultiPixStream_10_U0_U' info is :
// blk sig is {{~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_Bytes2MultiPixStream_10_U0_U.if_empty_n & top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.Bytes2MultiPixStream_10_U0.ap_idle & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_Bytes2MultiPixStream_10_U0_U.if_write} start_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.start_for_Bytes2MultiPixStream_10_U0_U.if_empty_n & grp_VMixHlsDataFlowFunction_fu_415.Bytes2MultiPixStream_10_U0.ap_idle & ~grp_VMixHlsDataFlowFunction_fu_415.start_for_Bytes2MultiPixStream_10_U0_U.if_write)) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_Bytes2MultiPixStream_10_U0_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.AXIMMvideo2Bytes_1_U0',");
                        end
                    end
                    6: begin //  for dep proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_U0'
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1_U' info is :
// blk sig is {~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.Bytes2MultiPixStream_10_U0.grp_Bytes2MultiPixStream_10_Pipeline_VITIS_LOOP_1104_2_fu_72.srcLayer1_blk_n data_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.Bytes2MultiPixStream_10_U0.grp_Bytes2MultiPixStream_10_Pipeline_VITIS_LOOP_1104_2_fu_72.srcLayer1_blk_n)) begin
                            if (~grp_VMixHlsDataFlowFunction_fu_415.srcLayer1_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~grp_VMixHlsDataFlowFunction_fu_415.srcLayer1_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_420_to_422_false_U0_U' info is :
// blk sig is {{~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_420_to_422_false_U0_U.if_full_n & top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.Bytes2MultiPixStream_10_U0.ap_start & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.Bytes2MultiPixStream_10_U0.real_start & (trans_in_cnt_4 == trans_out_cnt_4) & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_420_to_422_false_U0_U.if_read} start_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_420_to_422_false_U0_U.if_full_n & grp_VMixHlsDataFlowFunction_fu_415.Bytes2MultiPixStream_10_U0.ap_start & ~grp_VMixHlsDataFlowFunction_fu_415.Bytes2MultiPixStream_10_U0.real_start & (trans_in_cnt_4 == trans_out_cnt_4) & ~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_420_to_422_false_U0_U.if_read)) begin
                            $display("//      Blocked by full output start propagation FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_420_to_422_false_U0_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_U0',");
                        end
                    end
                    endcase
                end
                6 : begin // for proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_U0'
                    case(index2)
                    5: begin //  for dep proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.Bytes2MultiPixStream_10_U0'
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1_U' info is :
// blk sig is {~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_U0.grp_v_mix_420_to_422_false_Pipeline_VITIS_LOOP_76_2_fu_70.srcLayer1_blk_n data_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_U0.grp_v_mix_420_to_422_false_Pipeline_VITIS_LOOP_76_2_fu_70.srcLayer1_blk_n)) begin
                            if (~grp_VMixHlsDataFlowFunction_fu_415.srcLayer1_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.Bytes2MultiPixStream_10_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~grp_VMixHlsDataFlowFunction_fu_415.srcLayer1_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.Bytes2MultiPixStream_10_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_420_to_422_false_U0_U' info is :
// blk sig is {{~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_420_to_422_false_U0_U.if_empty_n & top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_U0.ap_idle & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_420_to_422_false_U0_U.if_write} start_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_420_to_422_false_U0_U.if_empty_n & grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_U0.ap_idle & ~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_420_to_422_false_U0_U.if_write)) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_420_to_422_false_U0_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.Bytes2MultiPixStream_10_U0',");
                        end
                    end
                    7: begin //  for dep proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_U0'
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Yuv422_U' info is :
// blk sig is {~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_U0.grp_v_mix_420_to_422_false_Pipeline_VITIS_LOOP_76_2_fu_70.srcLayer1Yuv422_blk_n data_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_U0.grp_v_mix_420_to_422_false_Pipeline_VITIS_LOOP_76_2_fu_70.srcLayer1Yuv422_blk_n)) begin
                            if (~grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Yuv422_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Yuv422_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Yuv422_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Yuv422_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Yuv422_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Yuv422_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_422_to_444_false_U0_U' info is :
// blk sig is {{~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_422_to_444_false_U0_U.if_full_n & top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_U0.ap_start & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_U0.real_start & (trans_in_cnt_5 == trans_out_cnt_5) & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_422_to_444_false_U0_U.if_read} start_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_422_to_444_false_U0_U.if_full_n & grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_U0.ap_start & ~grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_U0.real_start & (trans_in_cnt_5 == trans_out_cnt_5) & ~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_422_to_444_false_U0_U.if_read)) begin
                            $display("//      Blocked by full output start propagation FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_422_to_444_false_U0_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_U0',");
                        end
                    end
                    endcase
                end
                7 : begin // for proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_U0'
                    case(index2)
                    6: begin //  for dep proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_U0'
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Yuv422_U' info is :
// blk sig is {~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_U0.grp_v_mix_422_to_444_false_Pipeline_VITIS_LOOP_105_2_fu_70.srcLayer1Yuv422_blk_n data_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_U0.grp_v_mix_422_to_444_false_Pipeline_VITIS_LOOP_105_2_fu_70.srcLayer1Yuv422_blk_n)) begin
                            if (~grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Yuv422_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Yuv422_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Yuv422_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Yuv422_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Yuv422_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Yuv422_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_422_to_444_false_U0_U' info is :
// blk sig is {{~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_422_to_444_false_U0_U.if_empty_n & top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_U0.ap_idle & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_422_to_444_false_U0_U.if_write} start_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_422_to_444_false_U0_U.if_empty_n & grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_U0.ap_idle & ~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_422_to_444_false_U0_U.if_write)) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_422_to_444_false_U0_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_420_to_422_false_U0',");
                        end
                    end
                    8: begin //  for dep proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_U0'
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Yuv_U' info is :
// blk sig is {~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_U0.grp_v_mix_422_to_444_false_Pipeline_VITIS_LOOP_105_2_fu_70.srcLayer1Yuv_blk_n data_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_U0.grp_v_mix_422_to_444_false_Pipeline_VITIS_LOOP_105_2_fu_70.srcLayer1Yuv_blk_n)) begin
                            if (~grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Yuv_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Yuv_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Yuv_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Yuv_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Yuv_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Yuv_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_yuv2rgb_false_U0_U' info is :
// blk sig is {{~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_yuv2rgb_false_U0_U.if_full_n & top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_U0.ap_start & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_U0.real_start & (trans_in_cnt_6 == trans_out_cnt_6) & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_yuv2rgb_false_U0_U.if_read} start_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_yuv2rgb_false_U0_U.if_full_n & grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_U0.ap_start & ~grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_U0.real_start & (trans_in_cnt_6 == trans_out_cnt_6) & ~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_yuv2rgb_false_U0_U.if_read)) begin
                            $display("//      Blocked by full output start propagation FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_yuv2rgb_false_U0_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_U0',");
                        end
                    end
                    endcase
                end
                8 : begin // for proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_U0'
                    case(index2)
                    7: begin //  for dep proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_U0'
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Yuv_U' info is :
// blk sig is {~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_U0.grp_v_mix_yuv2rgb_false_Pipeline_VITIS_LOOP_897_2_fu_70.srcLayer1Yuv_blk_n data_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_U0.grp_v_mix_yuv2rgb_false_Pipeline_VITIS_LOOP_897_2_fu_70.srcLayer1Yuv_blk_n)) begin
                            if (~grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Yuv_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Yuv_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Yuv_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Yuv_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Yuv_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Yuv_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_yuv2rgb_false_U0_U' info is :
// blk sig is {{~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_yuv2rgb_false_U0_U.if_empty_n & top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_U0.ap_idle & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_yuv2rgb_false_U0_U.if_write} start_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_yuv2rgb_false_U0_U.if_empty_n & grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_U0.ap_idle & ~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_yuv2rgb_false_U0_U.if_write)) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_yuv2rgb_false_U0_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_444_false_U0',");
                        end
                    end
                    9: begin //  for dep proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_upsample_false_U0'
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Rgb_U' info is :
// blk sig is {~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_U0.grp_v_mix_yuv2rgb_false_Pipeline_VITIS_LOOP_897_2_fu_70.srcLayer1Rgb_blk_n data_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_U0.grp_v_mix_yuv2rgb_false_Pipeline_VITIS_LOOP_897_2_fu_70.srcLayer1Rgb_blk_n)) begin
                            if (~grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Rgb_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Rgb_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_upsample_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Rgb_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Rgb_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Rgb_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_upsample_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Rgb_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_upsample_false_U0_U' info is :
// blk sig is {{~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_upsample_false_U0_U.if_full_n & top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_U0.ap_start & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_U0.real_start & (trans_in_cnt_7 == trans_out_cnt_7) & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_upsample_false_U0_U.if_read} start_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_upsample_false_U0_U.if_full_n & grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_U0.ap_start & ~grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_U0.real_start & (trans_in_cnt_7 == trans_out_cnt_7) & ~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_upsample_false_U0_U.if_read)) begin
                            $display("//      Blocked by full output start propagation FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_upsample_false_U0_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_upsample_false_U0',");
                        end
                    end
                    endcase
                end
                9 : begin // for proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_upsample_false_U0'
                    case(index2)
                    8: begin //  for dep proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_U0'
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Rgb_U' info is :
// blk sig is {~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_upsample_false_U0.grp_v_mix_upsample_false_Pipeline_VITIS_LOOP_107_2_fu_70.srcLayer1Rgb_blk_n data_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.v_mix_upsample_false_U0.grp_v_mix_upsample_false_Pipeline_VITIS_LOOP_107_2_fu_70.srcLayer1Rgb_blk_n)) begin
                            if (~grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Rgb_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Rgb_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Rgb_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Rgb_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Rgb_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1Rgb_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_upsample_false_U0_U' info is :
// blk sig is {{~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_upsample_false_U0_U.if_empty_n & top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_upsample_false_U0.ap_idle & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_upsample_false_U0_U.if_write} start_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_upsample_false_U0_U.if_empty_n & grp_VMixHlsDataFlowFunction_fu_415.v_mix_upsample_false_U0.ap_idle & ~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_upsample_false_U0_U.if_write)) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_upsample_false_U0_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_U0',");
                        end
                    end
                    10: begin //  for dep proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_core_alpha_false_false_U0'
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1x_U' info is :
// blk sig is {~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_upsample_false_U0.grp_v_mix_upsample_false_Pipeline_VITIS_LOOP_107_2_fu_70.srcLayer1x_blk_n data_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.v_mix_upsample_false_U0.grp_v_mix_upsample_false_Pipeline_VITIS_LOOP_107_2_fu_70.srcLayer1x_blk_n)) begin
                            if (~grp_VMixHlsDataFlowFunction_fu_415.srcLayer1x_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1x_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_core_alpha_false_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1x_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~grp_VMixHlsDataFlowFunction_fu_415.srcLayer1x_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1x_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_core_alpha_false_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1x_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    endcase
                end
                10 : begin // for proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_core_alpha_false_false_U0'
                    case(index2)
                    3: begin //  for dep proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_3_U0'
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.outLayer0_U' info is :
// blk sig is {~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_core_alpha_false_false_U0.grp_v_mix_core_alpha_false_false_Pipeline_VITIS_LOOP_465_3_fu_146.outLayer0_blk_n data_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.v_mix_core_alpha_false_false_U0.grp_v_mix_core_alpha_false_false_Pipeline_VITIS_LOOP_465_3_fu_146.outLayer0_blk_n)) begin
                            if (~grp_VMixHlsDataFlowFunction_fu_415.outLayer0_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.outLayer0_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_3_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.outLayer0_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~grp_VMixHlsDataFlowFunction_fu_415.outLayer0_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.outLayer0_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_3_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.outLayer0_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_core_alpha_false_false_U0_U' info is :
// blk sig is {{~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_core_alpha_false_false_U0_U.if_empty_n & top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_core_alpha_false_false_U0.ap_idle & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_core_alpha_false_false_U0_U.if_write} start_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_core_alpha_false_false_U0_U.if_empty_n & grp_VMixHlsDataFlowFunction_fu_415.v_mix_core_alpha_false_false_U0.ap_idle & ~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_core_alpha_false_false_U0_U.if_write)) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_core_alpha_false_false_U0_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_yuv2rgb_false_3_U0',");
                        end
                    end
                    9: begin //  for dep proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_upsample_false_U0'
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1x_U' info is :
// blk sig is {~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_core_alpha_false_false_U0.grp_v_mix_core_alpha_false_false_Pipeline_VITIS_LOOP_465_3_fu_146.srcLayer1x_blk_n data_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.v_mix_core_alpha_false_false_U0.grp_v_mix_core_alpha_false_false_Pipeline_VITIS_LOOP_465_3_fu_146.srcLayer1x_blk_n)) begin
                            if (~grp_VMixHlsDataFlowFunction_fu_415.srcLayer1x_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1x_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_upsample_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1x_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~grp_VMixHlsDataFlowFunction_fu_415.srcLayer1x_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1x_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_upsample_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.srcLayer1x_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
                    end
                    11: begin //  for dep proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_rgb2yuv_false_U0'
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.outLayer1_U' info is :
// blk sig is {~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_core_alpha_false_false_U0.grp_v_mix_core_alpha_false_false_Pipeline_VITIS_LOOP_465_3_fu_146.outLayer1_blk_n data_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.v_mix_core_alpha_false_false_U0.grp_v_mix_core_alpha_false_false_Pipeline_VITIS_LOOP_465_3_fu_146.outLayer1_blk_n)) begin
                            if (~grp_VMixHlsDataFlowFunction_fu_415.outLayer1_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.outLayer1_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_rgb2yuv_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.outLayer1_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~grp_VMixHlsDataFlowFunction_fu_415.outLayer1_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.outLayer1_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_rgb2yuv_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.outLayer1_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_rgb2yuv_false_U0_U' info is :
// blk sig is {{~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_rgb2yuv_false_U0_U.if_full_n & top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_core_alpha_false_false_U0.ap_start & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_core_alpha_false_false_U0.real_start & (trans_in_cnt_9 == trans_out_cnt_9) & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_rgb2yuv_false_U0_U.if_read} start_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_rgb2yuv_false_U0_U.if_full_n & grp_VMixHlsDataFlowFunction_fu_415.v_mix_core_alpha_false_false_U0.ap_start & ~grp_VMixHlsDataFlowFunction_fu_415.v_mix_core_alpha_false_false_U0.real_start & (trans_in_cnt_9 == trans_out_cnt_9) & ~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_rgb2yuv_false_U0_U.if_read)) begin
                            $display("//      Blocked by full output start propagation FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_rgb2yuv_false_U0_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_rgb2yuv_false_U0',");
                        end
                    end
                    endcase
                end
                11 : begin // for proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_rgb2yuv_false_U0'
                    case(index2)
                    10: begin //  for dep proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_core_alpha_false_false_U0'
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.outLayer1_U' info is :
// blk sig is {~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_rgb2yuv_false_U0.grp_v_mix_rgb2yuv_false_Pipeline_VITIS_LOOP_1042_2_fu_62.outLayer1_blk_n data_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.v_mix_rgb2yuv_false_U0.grp_v_mix_rgb2yuv_false_Pipeline_VITIS_LOOP_1042_2_fu_62.outLayer1_blk_n)) begin
                            if (~grp_VMixHlsDataFlowFunction_fu_415.outLayer1_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.outLayer1_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_core_alpha_false_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.outLayer1_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~grp_VMixHlsDataFlowFunction_fu_415.outLayer1_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.outLayer1_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_core_alpha_false_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.outLayer1_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_rgb2yuv_false_U0_U' info is :
// blk sig is {{~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_rgb2yuv_false_U0_U.if_empty_n & top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_rgb2yuv_false_U0.ap_idle & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_rgb2yuv_false_U0_U.if_write} start_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_rgb2yuv_false_U0_U.if_empty_n & grp_VMixHlsDataFlowFunction_fu_415.v_mix_rgb2yuv_false_U0.ap_idle & ~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_rgb2yuv_false_U0_U.if_write)) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_rgb2yuv_false_U0_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_core_alpha_false_false_U0',");
                        end
                    end
                    12: begin //  for dep proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_444_to_422_false_U0'
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.outYuv_U' info is :
// blk sig is {~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_rgb2yuv_false_U0.grp_v_mix_rgb2yuv_false_Pipeline_VITIS_LOOP_1042_2_fu_62.outYuv_blk_n data_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.v_mix_rgb2yuv_false_U0.grp_v_mix_rgb2yuv_false_Pipeline_VITIS_LOOP_1042_2_fu_62.outYuv_blk_n)) begin
                            if (~grp_VMixHlsDataFlowFunction_fu_415.outYuv_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.outYuv_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_444_to_422_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.outYuv_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~grp_VMixHlsDataFlowFunction_fu_415.outYuv_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.outYuv_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_444_to_422_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.outYuv_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_444_to_422_false_U0_U' info is :
// blk sig is {{~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_444_to_422_false_U0_U.if_full_n & top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_rgb2yuv_false_U0.ap_start & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_rgb2yuv_false_U0.real_start & (trans_in_cnt_10 == trans_out_cnt_10) & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_444_to_422_false_U0_U.if_read} start_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_444_to_422_false_U0_U.if_full_n & grp_VMixHlsDataFlowFunction_fu_415.v_mix_rgb2yuv_false_U0.ap_start & ~grp_VMixHlsDataFlowFunction_fu_415.v_mix_rgb2yuv_false_U0.real_start & (trans_in_cnt_10 == trans_out_cnt_10) & ~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_444_to_422_false_U0_U.if_read)) begin
                            $display("//      Blocked by full output start propagation FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_444_to_422_false_U0_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_444_to_422_false_U0',");
                        end
                    end
                    endcase
                end
                12 : begin // for proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_444_to_422_false_U0'
                    case(index2)
                    11: begin //  for dep proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_rgb2yuv_false_U0'
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.outYuv_U' info is :
// blk sig is {~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_444_to_422_false_U0.grp_v_mix_444_to_422_false_Pipeline_VITIS_LOOP_718_2_fu_62.outYuv_blk_n data_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.v_mix_444_to_422_false_U0.grp_v_mix_444_to_422_false_Pipeline_VITIS_LOOP_718_2_fu_62.outYuv_blk_n)) begin
                            if (~grp_VMixHlsDataFlowFunction_fu_415.outYuv_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.outYuv_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_rgb2yuv_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.outYuv_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~grp_VMixHlsDataFlowFunction_fu_415.outYuv_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.outYuv_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_rgb2yuv_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.outYuv_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_444_to_422_false_U0_U' info is :
// blk sig is {{~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_444_to_422_false_U0_U.if_empty_n & top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_444_to_422_false_U0.ap_idle & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_444_to_422_false_U0_U.if_write} start_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_444_to_422_false_U0_U.if_empty_n & grp_VMixHlsDataFlowFunction_fu_415.v_mix_444_to_422_false_U0.ap_idle & ~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_444_to_422_false_U0_U.if_write)) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_444_to_422_false_U0_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_rgb2yuv_false_U0',");
                        end
                    end
                    13: begin //  for dep proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_420_false_U0'
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.out422_U' info is :
// blk sig is {~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_444_to_422_false_U0.grp_v_mix_444_to_422_false_Pipeline_VITIS_LOOP_718_2_fu_62.out422_blk_n data_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.v_mix_444_to_422_false_U0.grp_v_mix_444_to_422_false_Pipeline_VITIS_LOOP_718_2_fu_62.out422_blk_n)) begin
                            if (~grp_VMixHlsDataFlowFunction_fu_415.out422_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.out422_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_420_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.out422_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~grp_VMixHlsDataFlowFunction_fu_415.out422_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.out422_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_420_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.out422_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_422_to_420_false_U0_U' info is :
// blk sig is {{~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_422_to_420_false_U0_U.if_full_n & top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_444_to_422_false_U0.ap_start & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_444_to_422_false_U0.real_start & (trans_in_cnt_11 == trans_out_cnt_11) & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_422_to_420_false_U0_U.if_read} start_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_422_to_420_false_U0_U.if_full_n & grp_VMixHlsDataFlowFunction_fu_415.v_mix_444_to_422_false_U0.ap_start & ~grp_VMixHlsDataFlowFunction_fu_415.v_mix_444_to_422_false_U0.real_start & (trans_in_cnt_11 == trans_out_cnt_11) & ~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_422_to_420_false_U0_U.if_read)) begin
                            $display("//      Blocked by full output start propagation FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_422_to_420_false_U0_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_420_false_U0',");
                        end
                    end
                    endcase
                end
                13 : begin // for proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_420_false_U0'
                    case(index2)
                    12: begin //  for dep proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_444_to_422_false_U0'
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.out422_U' info is :
// blk sig is {~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_420_false_U0.grp_v_mix_422_to_420_false_Pipeline_VITIS_LOOP_508_2_fu_62.out422_blk_n data_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_420_false_U0.grp_v_mix_422_to_420_false_Pipeline_VITIS_LOOP_508_2_fu_62.out422_blk_n)) begin
                            if (~grp_VMixHlsDataFlowFunction_fu_415.out422_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.out422_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_444_to_422_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.out422_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~grp_VMixHlsDataFlowFunction_fu_415.out422_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.out422_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_444_to_422_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.out422_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_422_to_420_false_U0_U' info is :
// blk sig is {{~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_422_to_420_false_U0_U.if_empty_n & top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_420_false_U0.ap_idle & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_422_to_420_false_U0_U.if_write} start_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_422_to_420_false_U0_U.if_empty_n & grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_420_false_U0.ap_idle & ~grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_422_to_420_false_U0_U.if_write)) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_v_mix_422_to_420_false_U0_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_444_to_422_false_U0',");
                        end
                    end
                    14: begin //  for dep proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.MultiPixStream2AXIvideo_U0'
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.out420_U' info is :
// blk sig is {~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_420_false_U0.grp_v_mix_422_to_420_false_Pipeline_VITIS_LOOP_508_2_fu_62.out420_blk_n data_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_420_false_U0.grp_v_mix_422_to_420_false_Pipeline_VITIS_LOOP_508_2_fu_62.out420_blk_n)) begin
                            if (~grp_VMixHlsDataFlowFunction_fu_415.out420_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.out420_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.MultiPixStream2AXIvideo_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.out420_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~grp_VMixHlsDataFlowFunction_fu_415.out420_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.out420_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.MultiPixStream2AXIvideo_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.out420_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_MultiPixStream2AXIvideo_U0_U' info is :
// blk sig is {{~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_MultiPixStream2AXIvideo_U0_U.if_full_n & top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_420_false_U0.ap_start & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_420_false_U0.real_start & (trans_in_cnt_12 == trans_out_cnt_12) & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_MultiPixStream2AXIvideo_U0_U.if_read} start_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.start_for_MultiPixStream2AXIvideo_U0_U.if_full_n & grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_420_false_U0.ap_start & ~grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_420_false_U0.real_start & (trans_in_cnt_12 == trans_out_cnt_12) & ~grp_VMixHlsDataFlowFunction_fu_415.start_for_MultiPixStream2AXIvideo_U0_U.if_read)) begin
                            $display("//      Blocked by full output start propagation FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_MultiPixStream2AXIvideo_U0_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.MultiPixStream2AXIvideo_U0',");
                        end
                    end
                    endcase
                end
                14 : begin // for proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.MultiPixStream2AXIvideo_U0'
                    case(index2)
                    13: begin //  for dep proc 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_420_false_U0'
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.out420_U' info is :
// blk sig is {~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.MultiPixStream2AXIvideo_U0.grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_3903_3_fu_96.out420_blk_n data_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.MultiPixStream2AXIvideo_U0.grp_MultiPixStream2AXIvideo_Pipeline_VITIS_LOOP_3903_3_fu_96.out420_blk_n)) begin
                            if (~grp_VMixHlsDataFlowFunction_fu_415.out420_U.if_empty_n) begin
                                $display("//      Blocked by empty input FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.out420_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_420_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.out420_U");
                                $fdisplay(fp, "Dependence_Channel_status EMPTY");
                            end
                            else if (~grp_VMixHlsDataFlowFunction_fu_415.out420_U.if_full_n) begin
                                $display("//      Blocked by full output FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.out420_U' read by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_420_false_U0'");
                                $fdisplay(fp, "Dependence_Channel_path top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.out420_U");
                                $fdisplay(fp, "Dependence_Channel_status FULL");
                            end
                        end
// for dep channel 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_MultiPixStream2AXIvideo_U0_U' info is :
// blk sig is {{~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_MultiPixStream2AXIvideo_U0_U.if_empty_n & top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.MultiPixStream2AXIvideo_U0.ap_idle & ~top_design_v_mix_0_0_v_mix_inst.grp_VMixHlsDataFlowFunction_fu_415.start_for_MultiPixStream2AXIvideo_U0_U.if_write} start_FIFO}
                        if ((~grp_VMixHlsDataFlowFunction_fu_415.start_for_MultiPixStream2AXIvideo_U0_U.if_empty_n & grp_VMixHlsDataFlowFunction_fu_415.MultiPixStream2AXIvideo_U0.ap_idle & ~grp_VMixHlsDataFlowFunction_fu_415.start_for_MultiPixStream2AXIvideo_U0_U.if_write)) begin
                            $display("//      Blocked by missing 'ap_start' from start propagation FIFO 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.start_for_MultiPixStream2AXIvideo_U0_U' written by process 'top_design_v_mix_0_0_v_mix.grp_VMixHlsDataFlowFunction_fu_415.v_mix_422_to_420_false_U0',");
                        end
                    end
                    endcase
                end
            endcase
        end
    endtask

    // report
    initial begin : report_deadlock
        integer cycle_id;
        integer cycle_comp_id;
        integer record_time;
        wait (dl_reset == 1);
        cycle_id = 1;
        record_time = 0;
        while (1) begin
            @ (negedge dl_clock);
            case (CS_fsm)
                ST_DL_DETECTED: begin
                    cycle_comp_id = 2;
                    if (dl_detect_reg != dl_done_reg && stop_report_path == 1'b0) begin
                        if (dl_done_reg == 'b0) begin
                            print_dl_head;
                            record_time = $time;
                        end
                        print_cycle_start(proc_path(origin), cycle_id);
                        cycle_id = cycle_id + 1;
                    end
                    else begin
                        print_dl_end((cycle_id - 1),record_time);
                        @(negedge dl_clock);
                        @(negedge dl_clock);
                        $finish;
                    end
                end
                ST_DL_REPORT: begin
                    if ((|(dl_in_vec)) & ~(|(dl_in_vec & origin_reg)) & ~(|(reported_proc & dl_in_vec))) begin
                        print_cycle_chan_comp(dl_in_vec_reg, dl_in_vec);
                        print_cycle_proc_comp(proc_path(dl_in_vec), cycle_comp_id);
                        cycle_comp_id = cycle_comp_id + 1;
                    end
                    else begin
                        print_cycle_chan_comp(dl_in_vec_reg, dl_in_vec);
                    end
                end
            endcase
        end
    end
 
