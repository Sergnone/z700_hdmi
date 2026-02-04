; ModuleID = '/home/serg/Documents/Xilinx/z700_hdmi/HDMI_FBWRRD/HSMI_FBWRRD.runs/top_design_v_frmbuf_rd_0_0_synth_1/prj/sol/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_uint<64>" = type { %"struct.ap_int_base<64, false>" }
%"struct.ap_int_base<64, false>" = type { %"struct.ssdm_int<64, false>" }
%"struct.ssdm_int<64, false>" = type { i64 }
%"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>" = type { %"struct.hls::axis<ap_uint<24>, 1, 1, 1>" }
%"struct.hls::axis<ap_uint<24>, 1, 1, 1>" = type { %"struct.ap_uint<24>", %"struct.ap_uint<3>", %"struct.ap_uint<3>", %"struct.ap_uint<1>", %"struct.ap_uint<1>", %"struct.ap_uint<1>", %"struct.ap_uint<1>" }
%"struct.ap_uint<24>" = type { %"struct.ap_int_base<24, false>" }
%"struct.ap_int_base<24, false>" = type { %"struct.ssdm_int<24, false>" }
%"struct.ssdm_int<24, false>" = type { i24 }
%"struct.ap_uint<3>" = type { %"struct.ap_int_base<3, false>" }
%"struct.ap_int_base<3, false>" = type { %"struct.ssdm_int<3, false>" }
%"struct.ssdm_int<3, false>" = type { i3 }
%"struct.ap_uint<1>" = type { %"struct.ap_int_base<1, false>" }
%"struct.ap_int_base<1, false>" = type { %"struct.ssdm_int<1, false>" }
%"struct.ssdm_int<1, false>" = type { i1 }

; Function Attrs: noinline
define void @apatb_v_frmbuf_rd_ir(i16 zeroext %width, i16 zeroext %height, i16 zeroext %stride, i16 zeroext %video_format, %"struct.ap_uint<64>"* noalias nonnull "maxi" %frm_buffer, %"struct.ap_uint<64>"* noalias nonnull "maxi" %frm_buffer2, %"struct.ap_uint<64>"* noalias nonnull "maxi" %frm_buffer3, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* noalias nonnull align 4 dereferenceable(12) %m_axis_video) local_unnamed_addr #0 {
entry:
  %0 = bitcast %"struct.ap_uint<64>"* %frm_buffer to [2073600 x %"struct.ap_uint<64>"]*
  %1 = call i8* @malloc(i64 16588800)
  %frm_buffer_copy = bitcast i8* %1 to [2073600 x i64]*
  %2 = bitcast %"struct.ap_uint<64>"* %frm_buffer2 to [2073600 x %"struct.ap_uint<64>"]*
  %3 = call i8* @malloc(i64 16588800)
  %frm_buffer2_copy = bitcast i8* %3 to [2073600 x i64]*
  %4 = getelementptr [2073600 x i64], [2073600 x i64]* %frm_buffer2_copy, i64 0, i64 0
  %5 = bitcast %"struct.ap_uint<64>"* %frm_buffer3 to [2073600 x %"struct.ap_uint<64>"]*
  %6 = call i8* @malloc(i64 16588800)
  %frm_buffer3_copy = bitcast i8* %6 to [2073600 x i64]*
  %7 = getelementptr [2073600 x i64], [2073600 x i64]* %frm_buffer3_copy, i64 0, i64 0
  %m_axis_video_copy.data = alloca i24, align 512
  %m_axis_video_copy.keep = alloca i3, align 512
  %m_axis_video_copy.strb = alloca i3, align 512
  %m_axis_video_copy.user = alloca i1, align 512
  %m_axis_video_copy.last = alloca i1, align 512
  %m_axis_video_copy.id = alloca i1, align 512
  %m_axis_video_copy.dest = alloca i1, align 512
  call fastcc void @copy_in([2073600 x %"struct.ap_uint<64>"]* nonnull %0, [2073600 x i64]* %frm_buffer_copy, [2073600 x %"struct.ap_uint<64>"]* nonnull %2, [2073600 x i64]* %frm_buffer2_copy, [2073600 x %"struct.ap_uint<64>"]* nonnull %5, [2073600 x i64]* %frm_buffer3_copy, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* nonnull %m_axis_video, i24* nonnull align 512 %m_axis_video_copy.data, i3* nonnull align 512 %m_axis_video_copy.keep, i3* nonnull align 512 %m_axis_video_copy.strb, i1* nonnull align 512 %m_axis_video_copy.user, i1* nonnull align 512 %m_axis_video_copy.last, i1* nonnull align 512 %m_axis_video_copy.id, i1* nonnull align 512 %m_axis_video_copy.dest)
  call void @apatb_v_frmbuf_rd_hw(i16 %width, i16 %height, i16 %stride, i16 %video_format, [2073600 x i64]* %frm_buffer_copy, i64* %4, i64* %7, i24* %m_axis_video_copy.data, i3* %m_axis_video_copy.keep, i3* %m_axis_video_copy.strb, i1* %m_axis_video_copy.user, i1* %m_axis_video_copy.last, i1* %m_axis_video_copy.id, i1* %m_axis_video_copy.dest)
  call void @copy_back([2073600 x %"struct.ap_uint<64>"]* %0, [2073600 x i64]* %frm_buffer_copy, [2073600 x %"struct.ap_uint<64>"]* %2, [2073600 x i64]* %frm_buffer2_copy, [2073600 x %"struct.ap_uint<64>"]* %5, [2073600 x i64]* %frm_buffer3_copy, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* %m_axis_video, i24* %m_axis_video_copy.data, i3* %m_axis_video_copy.keep, i3* %m_axis_video_copy.strb, i1* %m_axis_video_copy.user, i1* %m_axis_video_copy.last, i1* %m_axis_video_copy.id, i1* %m_axis_video_copy.dest)
  call void @free(i8* %1)
  call void @free(i8* %3)
  call void @free(i8* %6)
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @copy_in([2073600 x %"struct.ap_uint<64>"]* readonly "unpacked"="0", [2073600 x i64]* nocapture "unpacked"="1.0", [2073600 x %"struct.ap_uint<64>"]* readonly "unpacked"="2", [2073600 x i64]* nocapture "unpacked"="3.0", [2073600 x %"struct.ap_uint<64>"]* readonly "unpacked"="4", [2073600 x i64]* nocapture "unpacked"="5.0", %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* "unpacked"="6", i24* align 512 "unpacked"="7.0" %_V_data_V, i3* align 512 "unpacked"="7.1" %_V_keep_V, i3* align 512 "unpacked"="7.2" %_V_strb_V, i1* align 512 "unpacked"="7.3" %_V_user_V, i1* align 512 "unpacked"="7.4" %_V_last_V, i1* align 512 "unpacked"="7.5" %_V_id_V, i1* align 512 "unpacked"="7.6" %_V_dest_V) unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a2073600struct.ap_uint<64>"([2073600 x i64]* %1, [2073600 x %"struct.ap_uint<64>"]* %0)
  call fastcc void @"onebyonecpy_hls.p0a2073600struct.ap_uint<64>"([2073600 x i64]* %3, [2073600 x %"struct.ap_uint<64>"]* %2)
  call fastcc void @"onebyonecpy_hls.p0a2073600struct.ap_uint<64>"([2073600 x i64]* %5, [2073600 x %"struct.ap_uint<64>"]* %4)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>.55"(i24* align 512 %_V_data_V, i3* align 512 %_V_keep_V, i3* align 512 %_V_strb_V, i1* align 512 %_V_user_V, i1* align 512 %_V_last_V, i1* align 512 %_V_id_V, i1* align 512 %_V_dest_V, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* %6)
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* %dst, i24* align 512 "unpacked"="1.0" %src_V_data_V, i3* align 512 "unpacked"="1.1" %src_V_keep_V, i3* align 512 "unpacked"="1.2" %src_V_strb_V, i1* align 512 "unpacked"="1.3" %src_V_user_V, i1* align 512 "unpacked"="1.4" %src_V_last_V, i1* align 512 "unpacked"="1.5" %src_V_id_V, i1* align 512 "unpacked"="1.6" %src_V_dest_V) unnamed_addr #2 {
entry:
  %0 = icmp eq %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* nonnull %dst, i24* align 512 %src_V_data_V, i3* align 512 %src_V_keep_V, i3* align 512 %src_V_strb_V, i1* align 512 %src_V_user_V, i1* align 512 %src_V_last_V, i1* align 512 %src_V_id_V, i1* align 512 %src_V_dest_V)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* nocapture, i24* nocapture align 512 "unpacked"="1.0" %_V_data_V, i3* nocapture align 512 "unpacked"="1.1" %_V_keep_V, i3* nocapture align 512 "unpacked"="1.2" %_V_strb_V, i1* nocapture align 512 "unpacked"="1.3" %_V_user_V, i1* nocapture align 512 "unpacked"="1.4" %_V_last_V, i1* nocapture align 512 "unpacked"="1.5" %_V_id_V, i1* nocapture align 512 "unpacked"="1.6" %_V_dest_V) unnamed_addr #3 {
entry:
  %1 = alloca i24
  %2 = alloca i3
  %3 = alloca i3
  %4 = alloca i1
  %5 = alloca i1
  %6 = alloca i1
  %7 = alloca i1
  %8 = alloca %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %9 = bitcast i24* %_V_data_V to i8*
  %10 = call i1 @fpga_fifo_not_empty_4(i8* %9)
  br i1 %10, label %push, label %ret

push:                                             ; preds = %empty
  %11 = bitcast i24* %1 to i8*
  %12 = bitcast i24* %_V_data_V to i8*
  call void @fpga_fifo_pop_4(i8* %11, i8* %12)
  %13 = load volatile i24, i24* %1
  %14 = bitcast i3* %3 to i8*
  %15 = bitcast i3* %_V_keep_V to i8*
  call void @fpga_fifo_pop_1(i8* %14, i8* %15)
  %16 = bitcast i3* %3 to i8*
  %17 = load i8, i8* %16
  %18 = trunc i8 %17 to i3
  %19 = bitcast i3* %2 to i8*
  %20 = bitcast i3* %_V_strb_V to i8*
  call void @fpga_fifo_pop_1(i8* %19, i8* %20)
  %21 = bitcast i3* %2 to i8*
  %22 = load i8, i8* %21
  %23 = trunc i8 %22 to i3
  %24 = bitcast i1* %7 to i8*
  %25 = bitcast i1* %_V_user_V to i8*
  call void @fpga_fifo_pop_1(i8* %24, i8* %25)
  %26 = bitcast i1* %7 to i8*
  %27 = load i8, i8* %26
  %28 = trunc i8 %27 to i1
  %29 = bitcast i1* %6 to i8*
  %30 = bitcast i1* %_V_last_V to i8*
  call void @fpga_fifo_pop_1(i8* %29, i8* %30)
  %31 = bitcast i1* %6 to i8*
  %32 = load i8, i8* %31
  %33 = trunc i8 %32 to i1
  %34 = bitcast i1* %5 to i8*
  %35 = bitcast i1* %_V_id_V to i8*
  call void @fpga_fifo_pop_1(i8* %34, i8* %35)
  %36 = bitcast i1* %5 to i8*
  %37 = load i8, i8* %36
  %38 = trunc i8 %37 to i1
  %39 = bitcast i1* %4 to i8*
  %40 = bitcast i1* %_V_dest_V to i8*
  call void @fpga_fifo_pop_1(i8* %39, i8* %40)
  %41 = bitcast i1* %4 to i8*
  %42 = load i8, i8* %41
  %43 = trunc i8 %42 to i1
  %.fca.0.0.0.0.0.insert = insertvalue %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>" undef, i24 %13, 0, 0, 0, 0, 0
  %.fca.0.1.0.0.0.insert = insertvalue %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>" %.fca.0.0.0.0.0.insert, i3 %18, 0, 1, 0, 0, 0
  %.fca.0.2.0.0.0.insert = insertvalue %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>" %.fca.0.1.0.0.0.insert, i3 %23, 0, 2, 0, 0, 0
  %.fca.0.3.0.0.0.insert = insertvalue %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>" %.fca.0.2.0.0.0.insert, i1 %28, 0, 3, 0, 0, 0
  %.fca.0.4.0.0.0.insert = insertvalue %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>" %.fca.0.3.0.0.0.insert, i1 %33, 0, 4, 0, 0, 0
  %.fca.0.5.0.0.0.insert = insertvalue %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>" %.fca.0.4.0.0.0.insert, i1 %38, 0, 5, 0, 0, 0
  %.fca.0.6.0.0.0.insert = insertvalue %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>" %.fca.0.5.0.0.0.insert, i1 %43, 0, 6, 0, 0, 0
  store %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>" %.fca.0.6.0.0.0.insert, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* %8
  %44 = bitcast %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* %8 to i8*
  %45 = bitcast %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* %0 to i8*
  call void @fpga_fifo_push_12(i8* %44, i8* %45)
  br label %empty, !llvm.loop !6

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @copy_out([2073600 x %"struct.ap_uint<64>"]* "unpacked"="0", [2073600 x i64]* nocapture readonly "unpacked"="1.0", [2073600 x %"struct.ap_uint<64>"]* "unpacked"="2", [2073600 x i64]* nocapture readonly "unpacked"="3.0", [2073600 x %"struct.ap_uint<64>"]* "unpacked"="4", [2073600 x i64]* nocapture readonly "unpacked"="5.0", %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* "unpacked"="6", i24* align 512 "unpacked"="7.0" %_V_data_V, i3* align 512 "unpacked"="7.1" %_V_keep_V, i3* align 512 "unpacked"="7.2" %_V_strb_V, i1* align 512 "unpacked"="7.3" %_V_user_V, i1* align 512 "unpacked"="7.4" %_V_last_V, i1* align 512 "unpacked"="7.5" %_V_id_V, i1* align 512 "unpacked"="7.6" %_V_dest_V) unnamed_addr #4 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a2073600struct.ap_uint<64>.23"([2073600 x %"struct.ap_uint<64>"]* %0, [2073600 x i64]* %1)
  call fastcc void @"onebyonecpy_hls.p0a2073600struct.ap_uint<64>.23"([2073600 x %"struct.ap_uint<64>"]* %2, [2073600 x i64]* %3)
  call fastcc void @"onebyonecpy_hls.p0a2073600struct.ap_uint<64>.23"([2073600 x %"struct.ap_uint<64>"]* %4, [2073600 x i64]* %5)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* %6, i24* align 512 %_V_data_V, i3* align 512 %_V_keep_V, i3* align 512 %_V_strb_V, i1* align 512 %_V_user_V, i1* align 512 %_V_last_V, i1* align 512 %_V_id_V, i1* align 512 %_V_dest_V)
  ret void
}

declare i8* @malloc(i64) local_unnamed_addr

declare void @free(i8*) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a2073600struct.ap_uint<64>.23"([2073600 x %"struct.ap_uint<64>"]* "unpacked"="0" %dst, [2073600 x i64]* nocapture readonly "unpacked"="1.0" %src) unnamed_addr #5 {
entry:
  %0 = icmp eq [2073600 x %"struct.ap_uint<64>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a2073600struct.ap_uint<64>.26"([2073600 x %"struct.ap_uint<64>"]* nonnull %dst, [2073600 x i64]* %src, i64 2073600)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a2073600struct.ap_uint<64>.26"([2073600 x %"struct.ap_uint<64>"]* "unpacked"="0" %dst, [2073600 x i64]* nocapture readonly "unpacked"="1.0" %src, i64 "unpacked"="2" %num) local_unnamed_addr #6 {
entry:
  %0 = icmp eq [2073600 x %"struct.ap_uint<64>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [2073600 x i64], [2073600 x i64]* %src, i64 0, i64 %for.loop.idx2
  %dst.addr.0.0.06 = getelementptr [2073600 x %"struct.ap_uint<64>"], [2073600 x %"struct.ap_uint<64>"]* %dst, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %1 = load i64, i64* %src.addr.0.0.05, align 8
  store i64 %1, i64* %dst.addr.0.0.06, align 8
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a2073600struct.ap_uint<64>"([2073600 x i64]* nocapture "unpacked"="0.0" %dst, [2073600 x %"struct.ap_uint<64>"]* readonly "unpacked"="1" %src) unnamed_addr #5 {
entry:
  %0 = icmp eq [2073600 x %"struct.ap_uint<64>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a2073600struct.ap_uint<64>.33"([2073600 x i64]* %dst, [2073600 x %"struct.ap_uint<64>"]* nonnull %src, i64 2073600)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a2073600struct.ap_uint<64>.33"([2073600 x i64]* nocapture "unpacked"="0.0" %dst, [2073600 x %"struct.ap_uint<64>"]* readonly "unpacked"="1" %src, i64 "unpacked"="2" %num) local_unnamed_addr #6 {
entry:
  %0 = icmp eq [2073600 x %"struct.ap_uint<64>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [2073600 x %"struct.ap_uint<64>"], [2073600 x %"struct.ap_uint<64>"]* %src, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [2073600 x i64], [2073600 x i64]* %dst, i64 0, i64 %for.loop.idx2
  %1 = load i64, i64* %src.addr.0.0.05, align 8
  store i64 %1, i64* %dst.addr.0.0.06, align 8
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>.55"(i24* align 512 "unpacked"="0.0" %dst_V_data_V, i3* align 512 "unpacked"="0.1" %dst_V_keep_V, i3* align 512 "unpacked"="0.2" %dst_V_strb_V, i1* align 512 "unpacked"="0.3" %dst_V_user_V, i1* align 512 "unpacked"="0.4" %dst_V_last_V, i1* align 512 "unpacked"="0.5" %dst_V_id_V, i1* align 512 "unpacked"="0.6" %dst_V_dest_V, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* %src) unnamed_addr #2 {
entry:
  %0 = icmp eq %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>.58"(i24* align 512 %dst_V_data_V, i3* align 512 %dst_V_keep_V, i3* align 512 %dst_V_strb_V, i1* align 512 %dst_V_user_V, i1* align 512 %dst_V_last_V, i1* align 512 %dst_V_id_V, i1* align 512 %dst_V_dest_V, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* nonnull %src)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>.58"(i24* nocapture align 512 "unpacked"="0.0" %_V_data_V, i3* nocapture align 512 "unpacked"="0.1" %_V_keep_V, i3* nocapture align 512 "unpacked"="0.2" %_V_strb_V, i1* nocapture align 512 "unpacked"="0.3" %_V_user_V, i1* nocapture align 512 "unpacked"="0.4" %_V_last_V, i1* nocapture align 512 "unpacked"="0.5" %_V_id_V, i1* nocapture align 512 "unpacked"="0.6" %_V_dest_V, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* nocapture) unnamed_addr #3 {
entry:
  %1 = alloca %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"
  %2 = alloca i24
  %3 = alloca i3
  %4 = alloca i3
  %5 = alloca i1
  %6 = alloca i1
  %7 = alloca i1
  %8 = alloca i1
  br label %empty

empty:                                            ; preds = %push, %entry
  %9 = bitcast %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* %0 to i8*
  %10 = call i1 @fpga_fifo_not_empty_12(i8* %9)
  br i1 %10, label %push, label %ret

push:                                             ; preds = %empty
  %11 = bitcast %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* %1 to i8*
  %12 = bitcast %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* %0 to i8*
  call void @fpga_fifo_pop_12(i8* %11, i8* %12)
  %13 = load volatile %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>", %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* %1
  %.fca.0.0.0.0.0.extract = extractvalue %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>" %13, 0, 0, 0, 0, 0
  %.fca.0.1.0.0.0.extract = extractvalue %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>" %13, 0, 1, 0, 0, 0
  %.fca.0.2.0.0.0.extract = extractvalue %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>" %13, 0, 2, 0, 0, 0
  %.fca.0.3.0.0.0.extract = extractvalue %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>" %13, 0, 3, 0, 0, 0
  %.fca.0.4.0.0.0.extract = extractvalue %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>" %13, 0, 4, 0, 0, 0
  %.fca.0.5.0.0.0.extract = extractvalue %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>" %13, 0, 5, 0, 0, 0
  %.fca.0.6.0.0.0.extract = extractvalue %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>" %13, 0, 6, 0, 0, 0
  store i24 %.fca.0.0.0.0.0.extract, i24* %2
  %14 = bitcast i24* %2 to i8*
  %15 = bitcast i24* %_V_data_V to i8*
  call void @fpga_fifo_push_4(i8* %14, i8* %15)
  store i3 %.fca.0.1.0.0.0.extract, i3* %4
  %16 = bitcast i3* %4 to i8*
  %17 = bitcast i3* %_V_keep_V to i8*
  call void @fpga_fifo_push_1(i8* %16, i8* %17)
  store i3 %.fca.0.2.0.0.0.extract, i3* %3
  %18 = bitcast i3* %3 to i8*
  %19 = bitcast i3* %_V_strb_V to i8*
  call void @fpga_fifo_push_1(i8* %18, i8* %19)
  store i1 %.fca.0.3.0.0.0.extract, i1* %8
  %20 = bitcast i1* %8 to i8*
  %21 = bitcast i1* %_V_user_V to i8*
  call void @fpga_fifo_push_1(i8* %20, i8* %21)
  store i1 %.fca.0.4.0.0.0.extract, i1* %7
  %22 = bitcast i1* %7 to i8*
  %23 = bitcast i1* %_V_last_V to i8*
  call void @fpga_fifo_push_1(i8* %22, i8* %23)
  store i1 %.fca.0.5.0.0.0.extract, i1* %6
  %24 = bitcast i1* %6 to i8*
  %25 = bitcast i1* %_V_id_V to i8*
  call void @fpga_fifo_push_1(i8* %24, i8* %25)
  store i1 %.fca.0.6.0.0.0.extract, i1* %5
  %26 = bitcast i1* %5 to i8*
  %27 = bitcast i1* %_V_dest_V to i8*
  call void @fpga_fifo_push_1(i8* %26, i8* %27)
  br label %empty, !llvm.loop !6

ret:                                              ; preds = %empty
  ret void
}

declare void @apatb_v_frmbuf_rd_hw(i16, i16, i16, i16, [2073600 x i64]*, i64*, i64*, i24*, i3*, i3*, i1*, i1*, i1*, i1*)

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @copy_back([2073600 x %"struct.ap_uint<64>"]* "unpacked"="0", [2073600 x i64]* nocapture readonly "unpacked"="1.0", [2073600 x %"struct.ap_uint<64>"]* "unpacked"="2", [2073600 x i64]* nocapture readonly "unpacked"="3.0", [2073600 x %"struct.ap_uint<64>"]* "unpacked"="4", [2073600 x i64]* nocapture readonly "unpacked"="5.0", %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* "unpacked"="6", i24* align 512 "unpacked"="7.0" %_V_data_V, i3* align 512 "unpacked"="7.1" %_V_keep_V, i3* align 512 "unpacked"="7.2" %_V_strb_V, i1* align 512 "unpacked"="7.3" %_V_user_V, i1* align 512 "unpacked"="7.4" %_V_last_V, i1* align 512 "unpacked"="7.5" %_V_id_V, i1* align 512 "unpacked"="7.6" %_V_dest_V) unnamed_addr #4 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a2073600struct.ap_uint<64>.23"([2073600 x %"struct.ap_uint<64>"]* %0, [2073600 x i64]* %1)
  call fastcc void @"onebyonecpy_hls.p0a2073600struct.ap_uint<64>.23"([2073600 x %"struct.ap_uint<64>"]* %2, [2073600 x i64]* %3)
  call fastcc void @"onebyonecpy_hls.p0a2073600struct.ap_uint<64>.23"([2073600 x %"struct.ap_uint<64>"]* %4, [2073600 x i64]* %5)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* %6, i24* align 512 %_V_data_V, i3* align 512 %_V_keep_V, i3* align 512 %_V_strb_V, i1* align 512 %_V_user_V, i1* align 512 %_V_last_V, i1* align 512 %_V_id_V, i1* align 512 %_V_dest_V)
  ret void
}

declare void @v_frmbuf_rd_hw_stub(i16 zeroext, i16 zeroext, i16 zeroext, i16 zeroext, %"struct.ap_uint<64>"* noalias nonnull, %"struct.ap_uint<64>"* noalias nonnull, %"struct.ap_uint<64>"* noalias nonnull, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* noalias nonnull)

define void @v_frmbuf_rd_hw_stub_wrapper(i16, i16, i16, i16, [2073600 x i64]*, i64*, i64*, i24*, i3*, i3*, i1*, i1*, i1*, i1*) #7 {
entry:
  %14 = call i8* @malloc(i64 16588800)
  %15 = bitcast i8* %14 to [2073600 x %"struct.ap_uint<64>"]*
  %16 = call i8* @malloc(i64 16588800)
  %17 = bitcast i8* %16 to [2073600 x %"struct.ap_uint<64>"]*
  %18 = bitcast i64* %5 to [2073600 x i64]*
  %19 = call i8* @malloc(i64 16588800)
  %20 = bitcast i8* %19 to [2073600 x %"struct.ap_uint<64>"]*
  %21 = bitcast i64* %6 to [2073600 x i64]*
  %22 = call i8* @malloc(i64 12)
  %23 = bitcast i8* %22 to %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"*
  call void @copy_out([2073600 x %"struct.ap_uint<64>"]* %15, [2073600 x i64]* %4, [2073600 x %"struct.ap_uint<64>"]* %17, [2073600 x i64]* %18, [2073600 x %"struct.ap_uint<64>"]* %20, [2073600 x i64]* %21, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* %23, i24* %7, i3* %8, i3* %9, i1* %10, i1* %11, i1* %12, i1* %13)
  %24 = bitcast [2073600 x %"struct.ap_uint<64>"]* %15 to %"struct.ap_uint<64>"*
  %25 = bitcast [2073600 x %"struct.ap_uint<64>"]* %17 to %"struct.ap_uint<64>"*
  %26 = bitcast [2073600 x %"struct.ap_uint<64>"]* %20 to %"struct.ap_uint<64>"*
  call void @v_frmbuf_rd_hw_stub(i16 %0, i16 %1, i16 %2, i16 %3, %"struct.ap_uint<64>"* %24, %"struct.ap_uint<64>"* %25, %"struct.ap_uint<64>"* %26, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* %23)
  call void @copy_in([2073600 x %"struct.ap_uint<64>"]* %15, [2073600 x i64]* %4, [2073600 x %"struct.ap_uint<64>"]* %17, [2073600 x i64]* %18, [2073600 x %"struct.ap_uint<64>"]* %20, [2073600 x i64]* %21, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* %23, i24* %7, i3* %8, i3* %9, i1* %10, i1* %11, i1* %12, i1* %13)
  call void @free(i8* %14)
  call void @free(i8* %16)
  call void @free(i8* %19)
  call void @free(i8* %22)
  ret void
}

declare i1 @fpga_fifo_not_empty_12(i8*)

declare i1 @fpga_fifo_not_empty_4(i8*)

declare void @fpga_fifo_pop_12(i8*, i8*)

declare void @fpga_fifo_pop_4(i8*, i8*)

declare void @fpga_fifo_pop_1(i8*, i8*)

declare void @fpga_fifo_push_12(i8*, i8*)

declare void @fpga_fifo_push_4(i8*, i8*)

declare void @fpga_fifo_push_1(i8*, i8*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline willreturn "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline willreturn "fpga.wrapper.func"="streamcpy_hls" }
attributes #4 = { argmemonly noinline willreturn "fpga.wrapper.func"="copyout" }
attributes #5 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #6 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="arraycpy_hls" }
attributes #7 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1}
!llvm.module.flags = !{!2, !3, !4}
!blackbox_cfg = !{!5}

!0 = !{!"AMD/Xilinx clang version 16.0.6"}
!1 = !{!"clang version 7.0.0 "}
!2 = !{i32 2, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.rotate.disable"}
