; ModuleID = '/home/serg/Documents/Xilinx/z700_hdmi/ALINX_VIDEO/alinx_video.runs/top_design_v_mix_0_0_synth_1/prj/sol/.autopilot/db/a.g.ld.5.gdce.bc'
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
define void @apatb_v_mix_ir(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* noalias nonnull align 4 dereferenceable(12) %s_axis_video, i16 zeroext %width, i16 zeroext %height, i16 zeroext %video_format, i16 zeroext %background_Y_R, i16 zeroext %background_U_G, i16 zeroext %background_V_B, i32 %layerEnable, %"struct.ap_uint<64>"* noalias nonnull "maxi" %layer1_buf1, %"struct.ap_uint<64>"* noalias nonnull "maxi" %layer1_buf2, %"struct.ap_uint<64>"* noalias nonnull "maxi" %layer1_buf3, i16* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="2" "partition" %layerAlpha, i16* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="2" "partition" %layerStartX, i16* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="2" "partition" %layerStartY, i16* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="2" "partition" %layerWidth, i16* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="2" "partition" %layerHeight, i8* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="2" "partition" %layerScaleFactor, i8* noalias nocapture nonnull readnone "fpga.decayed.dim.hint"="2" %layerVideoFormat, i16* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="2" "partition" %layerStride, i16 zeroext %reserve, i32 %K11, i32 %K12, i32 %K13, i32 %K21, i32 %K22, i32 %K23, i32 %K31, i32 %K32, i32 %K33, i32 %ROffset, i32 %GOffset, i32 %BOffset, i32 %K11_2, i32 %K12_2, i32 %K13_2, i32 %K21_2, i32 %K22_2, i32 %K23_2, i32 %K31_2, i32 %K32_2, i32 %K33_2, i32 %YOffset, i32 %UOffset, i32 %VOffset, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* noalias nonnull align 4 dereferenceable(12) %m_axis_video) local_unnamed_addr #0 {
entry:
  %s_axis_video_copy.data = alloca i24, align 512
  %s_axis_video_copy.keep = alloca i3, align 512
  %s_axis_video_copy.strb = alloca i3, align 512
  %s_axis_video_copy.user = alloca i1, align 512
  %s_axis_video_copy.last = alloca i1, align 512
  %s_axis_video_copy.id = alloca i1, align 512
  %s_axis_video_copy.dest = alloca i1, align 512
  %0 = bitcast %"struct.ap_uint<64>"* %layer1_buf1 to [4096 x %"struct.ap_uint<64>"]*
  %1 = call i8* @malloc(i64 32768)
  %layer1_buf1_copy = bitcast i8* %1 to [4096 x i64]*
  %2 = bitcast %"struct.ap_uint<64>"* %layer1_buf2 to [4096 x %"struct.ap_uint<64>"]*
  %3 = call i8* @malloc(i64 32768)
  %layer1_buf2_copy = bitcast i8* %3 to [4096 x i64]*
  %4 = getelementptr [4096 x i64], [4096 x i64]* %layer1_buf2_copy, i64 0, i64 0
  %5 = bitcast %"struct.ap_uint<64>"* %layer1_buf3 to [4096 x %"struct.ap_uint<64>"]*
  %6 = call i8* @malloc(i64 32768)
  %layer1_buf3_copy = bitcast i8* %6 to [4096 x i64]*
  %7 = getelementptr [4096 x i64], [4096 x i64]* %layer1_buf3_copy, i64 0, i64 0
  %8 = bitcast i16* %layerAlpha to [2 x i16]*
  %layerAlpha_copy_0 = alloca i16, align 512
  %layerAlpha_copy_1 = alloca i16, align 512
  %9 = bitcast i16* %layerStartX to [2 x i16]*
  %layerStartX_copy_0 = alloca i16, align 512
  %layerStartX_copy_1 = alloca i16, align 512
  %10 = bitcast i16* %layerStartY to [2 x i16]*
  %layerStartY_copy_0 = alloca i16, align 512
  %layerStartY_copy_1 = alloca i16, align 512
  %11 = bitcast i16* %layerWidth to [2 x i16]*
  %layerWidth_copy_0 = alloca i16, align 512
  %layerWidth_copy_1 = alloca i16, align 512
  %12 = bitcast i16* %layerHeight to [2 x i16]*
  %layerHeight_copy_0 = alloca i16, align 512
  %layerHeight_copy_1 = alloca i16, align 512
  %13 = bitcast i8* %layerScaleFactor to [2 x i8]*
  %layerScaleFactor_copy_0 = alloca i8, align 512
  %layerScaleFactor_copy_1 = alloca i8, align 512
  %14 = bitcast i8* %layerVideoFormat to [2 x i8]*
  %layerVideoFormat_copy = alloca [2 x i8], align 512
  %15 = bitcast i16* %layerStride to [2 x i16]*
  %layerStride_copy_0 = alloca i16, align 512
  %layerStride_copy_1 = alloca i16, align 512
  %m_axis_video_copy.data = alloca i24, align 512
  %m_axis_video_copy.keep = alloca i3, align 512
  %m_axis_video_copy.strb = alloca i3, align 512
  %m_axis_video_copy.user = alloca i1, align 512
  %m_axis_video_copy.last = alloca i1, align 512
  %m_axis_video_copy.id = alloca i1, align 512
  %m_axis_video_copy.dest = alloca i1, align 512
  call void @copy_in(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* nonnull %s_axis_video, i24* nonnull align 512 %s_axis_video_copy.data, i3* nonnull align 512 %s_axis_video_copy.keep, i3* nonnull align 512 %s_axis_video_copy.strb, i1* nonnull align 512 %s_axis_video_copy.user, i1* nonnull align 512 %s_axis_video_copy.last, i1* nonnull align 512 %s_axis_video_copy.id, i1* nonnull align 512 %s_axis_video_copy.dest, [4096 x %"struct.ap_uint<64>"]* nonnull %0, [4096 x i64]* %layer1_buf1_copy, [4096 x %"struct.ap_uint<64>"]* nonnull %2, [4096 x i64]* %layer1_buf2_copy, [4096 x %"struct.ap_uint<64>"]* nonnull %5, [4096 x i64]* %layer1_buf3_copy, [2 x i16]* nonnull %8, i16* nonnull align 512 %layerAlpha_copy_0, i16* nonnull align 512 %layerAlpha_copy_1, [2 x i16]* nonnull %9, i16* nonnull align 512 %layerStartX_copy_0, i16* nonnull align 512 %layerStartX_copy_1, [2 x i16]* nonnull %10, i16* nonnull align 512 %layerStartY_copy_0, i16* nonnull align 512 %layerStartY_copy_1, [2 x i16]* nonnull %11, i16* nonnull align 512 %layerWidth_copy_0, i16* nonnull align 512 %layerWidth_copy_1, [2 x i16]* nonnull %12, i16* nonnull align 512 %layerHeight_copy_0, i16* nonnull align 512 %layerHeight_copy_1, [2 x i8]* nonnull %13, i8* nonnull align 512 %layerScaleFactor_copy_0, i8* nonnull align 512 %layerScaleFactor_copy_1, [2 x i8]* nonnull %14, [2 x i8]* nonnull align 512 %layerVideoFormat_copy, [2 x i16]* nonnull %15, i16* nonnull align 512 %layerStride_copy_0, i16* nonnull align 512 %layerStride_copy_1, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* nonnull %m_axis_video, i24* nonnull align 512 %m_axis_video_copy.data, i3* nonnull align 512 %m_axis_video_copy.keep, i3* nonnull align 512 %m_axis_video_copy.strb, i1* nonnull align 512 %m_axis_video_copy.user, i1* nonnull align 512 %m_axis_video_copy.last, i1* nonnull align 512 %m_axis_video_copy.id, i1* nonnull align 512 %m_axis_video_copy.dest)
  call void @apatb_v_mix_hw(i24* %s_axis_video_copy.data, i3* %s_axis_video_copy.keep, i3* %s_axis_video_copy.strb, i1* %s_axis_video_copy.user, i1* %s_axis_video_copy.last, i1* %s_axis_video_copy.id, i1* %s_axis_video_copy.dest, i16 %width, i16 %height, i16 %video_format, i16 %background_Y_R, i16 %background_U_G, i16 %background_V_B, i32 %layerEnable, [4096 x i64]* %layer1_buf1_copy, i64* %4, i64* %7, i16* %layerAlpha_copy_0, i16* %layerAlpha_copy_1, i16* %layerStartX_copy_0, i16* %layerStartX_copy_1, i16* %layerStartY_copy_0, i16* %layerStartY_copy_1, i16* %layerWidth_copy_0, i16* %layerWidth_copy_1, i16* %layerHeight_copy_0, i16* %layerHeight_copy_1, i8* %layerScaleFactor_copy_0, i8* %layerScaleFactor_copy_1, [2 x i8]* %layerVideoFormat_copy, i16* %layerStride_copy_0, i16* %layerStride_copy_1, i16 %reserve, i32 %K11, i32 %K12, i32 %K13, i32 %K21, i32 %K22, i32 %K23, i32 %K31, i32 %K32, i32 %K33, i32 %ROffset, i32 %GOffset, i32 %BOffset, i32 %K11_2, i32 %K12_2, i32 %K13_2, i32 %K21_2, i32 %K22_2, i32 %K23_2, i32 %K31_2, i32 %K32_2, i32 %K33_2, i32 %YOffset, i32 %UOffset, i32 %VOffset, i24* %m_axis_video_copy.data, i3* %m_axis_video_copy.keep, i3* %m_axis_video_copy.strb, i1* %m_axis_video_copy.user, i1* %m_axis_video_copy.last, i1* %m_axis_video_copy.id, i1* %m_axis_video_copy.dest)
  call void @copy_back(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* %s_axis_video, i24* %s_axis_video_copy.data, i3* %s_axis_video_copy.keep, i3* %s_axis_video_copy.strb, i1* %s_axis_video_copy.user, i1* %s_axis_video_copy.last, i1* %s_axis_video_copy.id, i1* %s_axis_video_copy.dest, [4096 x %"struct.ap_uint<64>"]* %0, [4096 x i64]* %layer1_buf1_copy, [4096 x %"struct.ap_uint<64>"]* %2, [4096 x i64]* %layer1_buf2_copy, [4096 x %"struct.ap_uint<64>"]* %5, [4096 x i64]* %layer1_buf3_copy, [2 x i16]* %8, i16* %layerAlpha_copy_0, i16* %layerAlpha_copy_1, [2 x i16]* %9, i16* %layerStartX_copy_0, i16* %layerStartX_copy_1, [2 x i16]* %10, i16* %layerStartY_copy_0, i16* %layerStartY_copy_1, [2 x i16]* %11, i16* %layerWidth_copy_0, i16* %layerWidth_copy_1, [2 x i16]* %12, i16* %layerHeight_copy_0, i16* %layerHeight_copy_1, [2 x i8]* %13, i8* %layerScaleFactor_copy_0, i8* %layerScaleFactor_copy_1, [2 x i8]* %14, [2 x i8]* %layerVideoFormat_copy, [2 x i16]* %15, i16* %layerStride_copy_0, i16* %layerStride_copy_1, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* %m_axis_video, i24* %m_axis_video_copy.data, i3* %m_axis_video_copy.keep, i3* %m_axis_video_copy.strb, i1* %m_axis_video_copy.user, i1* %m_axis_video_copy.last, i1* %m_axis_video_copy.id, i1* %m_axis_video_copy.dest)
  call void @free(i8* %1)
  call void @free(i8* %3)
  call void @free(i8* %6)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a2i16([2 x i16]* "orig.arg.no"="0" %dst, [2 x i16]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) local_unnamed_addr #1 {
entry:
  %0 = icmp eq [2 x i16]* %src, null
  %1 = icmp eq [2 x i16]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [2 x i16], [2 x i16]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [2 x i16], [2 x i16]* %src, i64 0, i64 %for.loop.idx2
  %3 = load i16, i16* %src.addr, align 2
  store i16 %3, i16* %dst.addr, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0a2i8([2 x i8]* align 512 "orig.arg.no"="0" %dst, [2 x i8]* readonly "orig.arg.no"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [2 x i8]* %dst, null
  %1 = icmp eq [2 x i8]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a2i8([2 x i8]* nonnull %dst, [2 x i8]* nonnull %src, i64 2)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a2i8([2 x i8]* "orig.arg.no"="0" %dst, [2 x i8]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) local_unnamed_addr #1 {
entry:
  %0 = icmp eq [2 x i8]* %src, null
  %1 = icmp eq [2 x i8]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [2 x i8], [2 x i8]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [2 x i8], [2 x i8]* %src, i64 0, i64 %for.loop.idx2
  %3 = load i8, i8* %src.addr, align 1
  store i8 %3, i8* %dst.addr, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

declare i8* @malloc(i64) local_unnamed_addr

declare void @free(i8*) local_unnamed_addr

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0a4096struct.ap_uint<64>.80"([4096 x %"struct.ap_uint<64>"]* "unpacked"="0" %dst, [4096 x i64]* nocapture readonly "unpacked"="1.0" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [4096 x %"struct.ap_uint<64>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a4096struct.ap_uint<64>.83"([4096 x %"struct.ap_uint<64>"]* nonnull %dst, [4096 x i64]* %src, i64 4096)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a4096struct.ap_uint<64>.83"([4096 x %"struct.ap_uint<64>"]* "unpacked"="0" %dst, [4096 x i64]* nocapture readonly "unpacked"="1.0" %src, i64 "unpacked"="2" %num) local_unnamed_addr #1 {
entry:
  %0 = icmp eq [4096 x %"struct.ap_uint<64>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [4096 x i64], [4096 x i64]* %src, i64 0, i64 %for.loop.idx2
  %dst.addr.0.0.06 = getelementptr [4096 x %"struct.ap_uint<64>"], [4096 x %"struct.ap_uint<64>"]* %dst, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
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
define internal fastcc void @"onebyonecpy_hls.p0a4096struct.ap_uint<64>"([4096 x i64]* nocapture "unpacked"="0.0" %dst, [4096 x %"struct.ap_uint<64>"]* readonly "unpacked"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq [4096 x %"struct.ap_uint<64>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a4096struct.ap_uint<64>.90"([4096 x i64]* %dst, [4096 x %"struct.ap_uint<64>"]* nonnull %src, i64 4096)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a4096struct.ap_uint<64>.90"([4096 x i64]* nocapture "unpacked"="0.0" %dst, [4096 x %"struct.ap_uint<64>"]* readonly "unpacked"="1" %src, i64 "unpacked"="2" %num) local_unnamed_addr #1 {
entry:
  %0 = icmp eq [4096 x %"struct.ap_uint<64>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [4096 x %"struct.ap_uint<64>"], [4096 x %"struct.ap_uint<64>"]* %src, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [4096 x i64], [4096 x i64]* %dst, i64 0, i64 %for.loop.idx2
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
define void @arraycpy_hls.p0a2i16.115.116(i16* "orig.arg.no"="0" "unpacked"="0.0" %dst_0, i16* "orig.arg.no"="0" "unpacked"="0.1" %dst_1, [2 x i16]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) #1 {
entry:
  %0 = icmp eq [2 x i16]* %src, null
  %1 = icmp eq i16* %dst_0, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.exit, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %dst.addr.exit ]
  %src.addr = getelementptr [2 x i16], [2 x i16]* %src, i64 0, i64 %for.loop.idx2
  %3 = load i16, i16* %src.addr, align 2
  switch i64 %for.loop.idx2, label %dst.addr.exit [
    i64 0, label %dst.addr.case.0
    i64 1, label %dst.addr.case.1
  ]

dst.addr.case.0:                                  ; preds = %for.loop
  store i16 %3, i16* %dst_0, align 2
  br label %dst.addr.exit

dst.addr.case.1:                                  ; preds = %for.loop
  store i16 %3, i16* %dst_1, align 2
  br label %dst.addr.exit

dst.addr.exit:                                    ; preds = %dst.addr.case.1, %dst.addr.case.0, %for.loop
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %dst.addr.exit, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @onebyonecpy_hls.p0a2i16.114.117(i16* align 512 "orig.arg.no"="0" "unpacked"="0.0" %dst_0, i16* align 512 "orig.arg.no"="0" "unpacked"="0.1" %dst_1, [2 x i16]* readonly "orig.arg.no"="1" %src) #2 {
entry:
  %0 = icmp eq i16* %dst_0, null
  %1 = icmp eq [2 x i16]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a2i16.115.116(i16* nonnull %dst_0, i16* %dst_1, [2 x i16]* nonnull %src, i64 2)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a2i8.119.120(i8* "orig.arg.no"="0" "unpacked"="0.0" %dst_0, i8* "orig.arg.no"="0" "unpacked"="0.1" %dst_1, [2 x i8]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) #1 {
entry:
  %0 = icmp eq [2 x i8]* %src, null
  %1 = icmp eq i8* %dst_0, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.exit, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %dst.addr.exit ]
  %src.addr = getelementptr [2 x i8], [2 x i8]* %src, i64 0, i64 %for.loop.idx2
  %3 = load i8, i8* %src.addr, align 1
  switch i64 %for.loop.idx2, label %dst.addr.exit [
    i64 0, label %dst.addr.case.0
    i64 1, label %dst.addr.case.1
  ]

dst.addr.case.0:                                  ; preds = %for.loop
  store i8 %3, i8* %dst_0, align 1
  br label %dst.addr.exit

dst.addr.case.1:                                  ; preds = %for.loop
  store i8 %3, i8* %dst_1, align 1
  br label %dst.addr.exit

dst.addr.exit:                                    ; preds = %dst.addr.case.1, %dst.addr.case.0, %for.loop
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %dst.addr.exit, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @onebyonecpy_hls.p0a2i8.118.121(i8* align 512 "orig.arg.no"="0" "unpacked"="0.0" %dst_0, i8* align 512 "orig.arg.no"="0" "unpacked"="0.1" %dst_1, [2 x i8]* readonly "orig.arg.no"="1" %src) #2 {
entry:
  %0 = icmp eq i8* %dst_0, null
  %1 = icmp eq [2 x i8]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a2i8.119.120(i8* nonnull %dst_0, i8* %dst_1, [2 x i8]* nonnull %src, i64 2)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal void @copy_in(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* "orig.arg.no"="0" "unpacked"="0", i24* align 512 "orig.arg.no"="1" "unpacked"="1.0" %_V_data_V, i3* align 512 "orig.arg.no"="1" "unpacked"="1.1" %_V_keep_V, i3* align 512 "orig.arg.no"="1" "unpacked"="1.2" %_V_strb_V, i1* align 512 "orig.arg.no"="1" "unpacked"="1.3" %_V_user_V, i1* align 512 "orig.arg.no"="1" "unpacked"="1.4" %_V_last_V, i1* align 512 "orig.arg.no"="1" "unpacked"="1.5" %_V_id_V, i1* align 512 "orig.arg.no"="1" "unpacked"="1.6" %_V_dest_V, [4096 x %"struct.ap_uint<64>"]* readonly "orig.arg.no"="2" "unpacked"="2", [4096 x i64]* nocapture "orig.arg.no"="3" "unpacked"="3.0", [4096 x %"struct.ap_uint<64>"]* readonly "orig.arg.no"="4" "unpacked"="4", [4096 x i64]* nocapture "orig.arg.no"="5" "unpacked"="5.0", [4096 x %"struct.ap_uint<64>"]* readonly "orig.arg.no"="6" "unpacked"="6", [4096 x i64]* nocapture "orig.arg.no"="7" "unpacked"="7.0", [2 x i16]* readonly "orig.arg.no"="8" "unpacked"="8", i16* align 512 "orig.arg.no"="9" "unpacked"="9.0" %_0, i16* align 512 "orig.arg.no"="9" "unpacked"="9.1" %_1, [2 x i16]* readonly "orig.arg.no"="10" "unpacked"="10", i16* align 512 "orig.arg.no"="11" "unpacked"="11.0" %_01, i16* align 512 "orig.arg.no"="11" "unpacked"="11.1" %_12, [2 x i16]* readonly "orig.arg.no"="12" "unpacked"="12", i16* align 512 "orig.arg.no"="13" "unpacked"="13.0" %_03, i16* align 512 "orig.arg.no"="13" "unpacked"="13.1" %_14, [2 x i16]* readonly "orig.arg.no"="14" "unpacked"="14", i16* align 512 "orig.arg.no"="15" "unpacked"="15.0" %_05, i16* align 512 "orig.arg.no"="15" "unpacked"="15.1" %_16, [2 x i16]* readonly "orig.arg.no"="16" "unpacked"="16", i16* align 512 "orig.arg.no"="17" "unpacked"="17.0" %_07, i16* align 512 "orig.arg.no"="17" "unpacked"="17.1" %_18, [2 x i8]* readonly "orig.arg.no"="18" "unpacked"="18", i8* align 512 "orig.arg.no"="19" "unpacked"="19.0" %_09, i8* align 512 "orig.arg.no"="19" "unpacked"="19.1" %_110, [2 x i8]* readonly "orig.arg.no"="20" "unpacked"="20", [2 x i8]* align 512 "orig.arg.no"="21" "unpacked"="21", [2 x i16]* readonly "orig.arg.no"="22" "unpacked"="22", i16* align 512 "orig.arg.no"="23" "unpacked"="23.0" %_011, i16* align 512 "orig.arg.no"="23" "unpacked"="23.1" %_112, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* "orig.arg.no"="24" "unpacked"="24", i24* align 512 "orig.arg.no"="25" "unpacked"="25.0" %_V_data_V1, i3* align 512 "orig.arg.no"="25" "unpacked"="25.1" %_V_keep_V2, i3* align 512 "orig.arg.no"="25" "unpacked"="25.2" %_V_strb_V3, i1* align 512 "orig.arg.no"="25" "unpacked"="25.3" %_V_user_V4, i1* align 512 "orig.arg.no"="25" "unpacked"="25.4" %_V_last_V5, i1* align 512 "orig.arg.no"="25" "unpacked"="25.5" %_V_id_V6, i1* align 512 "orig.arg.no"="25" "unpacked"="25.6" %_V_dest_V7) #3 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>.174"(i24* align 512 %_V_data_V, i3* align 512 %_V_keep_V, i3* align 512 %_V_strb_V, i1* align 512 %_V_user_V, i1* align 512 %_V_last_V, i1* align 512 %_V_id_V, i1* align 512 %_V_dest_V, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* %0)
  call fastcc void @"onebyonecpy_hls.p0a4096struct.ap_uint<64>"([4096 x i64]* %2, [4096 x %"struct.ap_uint<64>"]* %1)
  call fastcc void @"onebyonecpy_hls.p0a4096struct.ap_uint<64>"([4096 x i64]* %4, [4096 x %"struct.ap_uint<64>"]* %3)
  call fastcc void @"onebyonecpy_hls.p0a4096struct.ap_uint<64>"([4096 x i64]* %6, [4096 x %"struct.ap_uint<64>"]* %5)
  call void @onebyonecpy_hls.p0a2i16.114.117(i16* align 512 %_0, i16* align 512 %_1, [2 x i16]* %7)
  call void @onebyonecpy_hls.p0a2i16.114.117(i16* align 512 %_01, i16* align 512 %_12, [2 x i16]* %8)
  call void @onebyonecpy_hls.p0a2i16.114.117(i16* align 512 %_03, i16* align 512 %_14, [2 x i16]* %9)
  call void @onebyonecpy_hls.p0a2i16.114.117(i16* align 512 %_05, i16* align 512 %_16, [2 x i16]* %10)
  call void @onebyonecpy_hls.p0a2i16.114.117(i16* align 512 %_07, i16* align 512 %_18, [2 x i16]* %11)
  call void @onebyonecpy_hls.p0a2i8.118.121(i8* align 512 %_09, i8* align 512 %_110, [2 x i8]* %12)
  call fastcc void @onebyonecpy_hls.p0a2i8([2 x i8]* align 512 %14, [2 x i8]* %13)
  call void @onebyonecpy_hls.p0a2i16.114.117(i16* align 512 %_011, i16* align 512 %_112, [2 x i16]* %15)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>.174"(i24* align 512 %_V_data_V1, i3* align 512 %_V_keep_V2, i3* align 512 %_V_strb_V3, i1* align 512 %_V_user_V4, i1* align 512 %_V_last_V5, i1* align 512 %_V_id_V6, i1* align 512 %_V_dest_V7, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* %16)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a2i16.127.128([2 x i16]* "orig.arg.no"="0" %dst, i16* readonly "orig.arg.no"="1" "unpacked"="1.0" %src_0, i16* readonly "orig.arg.no"="1" "unpacked"="1.1" %src_1, i64 "orig.arg.no"="2" %num) #1 {
entry:
  %0 = icmp eq i16* %src_0, null
  %1 = icmp eq [2 x i16]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %src.addr.exit, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %src.addr.exit ]
  %dst.addr = getelementptr [2 x i16], [2 x i16]* %dst, i64 0, i64 %for.loop.idx2
  switch i64 %for.loop.idx2, label %src.addr.exit [
    i64 0, label %src.addr.case.0
    i64 1, label %src.addr.case.1
  ]

src.addr.case.0:                                  ; preds = %for.loop
  %_0 = load i16, i16* %src_0, align 2
  br label %src.addr.exit

src.addr.case.1:                                  ; preds = %for.loop
  %_1 = load i16, i16* %src_1, align 2
  br label %src.addr.exit

src.addr.exit:                                    ; preds = %src.addr.case.1, %src.addr.case.0, %for.loop
  %3 = phi i16 [ %_0, %src.addr.case.0 ], [ %_1, %src.addr.case.1 ], [ undef, %for.loop ]
  store i16 %3, i16* %dst.addr, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %src.addr.exit, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @onebyonecpy_hls.p0a2i16.126.129([2 x i16]* "orig.arg.no"="0" %dst, i16* readonly align 512 "orig.arg.no"="1" "unpacked"="1.0" %src_0, i16* readonly align 512 "orig.arg.no"="1" "unpacked"="1.1" %src_1) #2 {
entry:
  %0 = icmp eq [2 x i16]* %dst, null
  %1 = icmp eq i16* %src_0, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a2i16.127.128([2 x i16]* nonnull %dst, i16* nonnull %src_0, i16* %src_1, i64 2)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @arraycpy_hls.p0a2i8.131.132([2 x i8]* "orig.arg.no"="0" %dst, i8* readonly "orig.arg.no"="1" "unpacked"="1.0" %src_0, i8* readonly "orig.arg.no"="1" "unpacked"="1.1" %src_1, i64 "orig.arg.no"="2" %num) #1 {
entry:
  %0 = icmp eq i8* %src_0, null
  %1 = icmp eq [2 x i8]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %src.addr.exit, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %src.addr.exit ]
  %dst.addr = getelementptr [2 x i8], [2 x i8]* %dst, i64 0, i64 %for.loop.idx2
  switch i64 %for.loop.idx2, label %src.addr.exit [
    i64 0, label %src.addr.case.0
    i64 1, label %src.addr.case.1
  ]

src.addr.case.0:                                  ; preds = %for.loop
  %_0 = load i8, i8* %src_0, align 1
  br label %src.addr.exit

src.addr.case.1:                                  ; preds = %for.loop
  %_1 = load i8, i8* %src_1, align 1
  br label %src.addr.exit

src.addr.exit:                                    ; preds = %src.addr.case.1, %src.addr.case.0, %for.loop
  %3 = phi i8 [ %_0, %src.addr.case.0 ], [ %_1, %src.addr.case.1 ], [ undef, %for.loop ]
  store i8 %3, i8* %dst.addr, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %src.addr.exit, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @onebyonecpy_hls.p0a2i8.130.133([2 x i8]* "orig.arg.no"="0" %dst, i8* readonly align 512 "orig.arg.no"="1" "unpacked"="1.0" %src_0, i8* readonly align 512 "orig.arg.no"="1" "unpacked"="1.1" %src_1) #2 {
entry:
  %0 = icmp eq [2 x i8]* %dst, null
  %1 = icmp eq i8* %src_0, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a2i8.131.132([2 x i8]* nonnull %dst, i8* nonnull %src_0, i8* %src_1, i64 2)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal void @copy_out(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* "orig.arg.no"="0" "unpacked"="0", i24* align 512 "orig.arg.no"="1" "unpacked"="1.0" %_V_data_V, i3* align 512 "orig.arg.no"="1" "unpacked"="1.1" %_V_keep_V, i3* align 512 "orig.arg.no"="1" "unpacked"="1.2" %_V_strb_V, i1* align 512 "orig.arg.no"="1" "unpacked"="1.3" %_V_user_V, i1* align 512 "orig.arg.no"="1" "unpacked"="1.4" %_V_last_V, i1* align 512 "orig.arg.no"="1" "unpacked"="1.5" %_V_id_V, i1* align 512 "orig.arg.no"="1" "unpacked"="1.6" %_V_dest_V, [4096 x %"struct.ap_uint<64>"]* "orig.arg.no"="2" "unpacked"="2", [4096 x i64]* nocapture readonly "orig.arg.no"="3" "unpacked"="3.0", [4096 x %"struct.ap_uint<64>"]* "orig.arg.no"="4" "unpacked"="4", [4096 x i64]* nocapture readonly "orig.arg.no"="5" "unpacked"="5.0", [4096 x %"struct.ap_uint<64>"]* "orig.arg.no"="6" "unpacked"="6", [4096 x i64]* nocapture readonly "orig.arg.no"="7" "unpacked"="7.0", [2 x i16]* "orig.arg.no"="8" "unpacked"="8", i16* readonly align 512 "orig.arg.no"="9" "unpacked"="9.0" %_0, i16* readonly align 512 "orig.arg.no"="9" "unpacked"="9.1" %_1, [2 x i16]* "orig.arg.no"="10" "unpacked"="10", i16* readonly align 512 "orig.arg.no"="11" "unpacked"="11.0" %_01, i16* readonly align 512 "orig.arg.no"="11" "unpacked"="11.1" %_12, [2 x i16]* "orig.arg.no"="12" "unpacked"="12", i16* readonly align 512 "orig.arg.no"="13" "unpacked"="13.0" %_03, i16* readonly align 512 "orig.arg.no"="13" "unpacked"="13.1" %_14, [2 x i16]* "orig.arg.no"="14" "unpacked"="14", i16* readonly align 512 "orig.arg.no"="15" "unpacked"="15.0" %_05, i16* readonly align 512 "orig.arg.no"="15" "unpacked"="15.1" %_16, [2 x i16]* "orig.arg.no"="16" "unpacked"="16", i16* readonly align 512 "orig.arg.no"="17" "unpacked"="17.0" %_07, i16* readonly align 512 "orig.arg.no"="17" "unpacked"="17.1" %_18, [2 x i8]* "orig.arg.no"="18" "unpacked"="18", i8* readonly align 512 "orig.arg.no"="19" "unpacked"="19.0" %_09, i8* readonly align 512 "orig.arg.no"="19" "unpacked"="19.1" %_110, [2 x i8]* "orig.arg.no"="20" "unpacked"="20", [2 x i8]* readonly align 512 "orig.arg.no"="21" "unpacked"="21", [2 x i16]* "orig.arg.no"="22" "unpacked"="22", i16* readonly align 512 "orig.arg.no"="23" "unpacked"="23.0" %_011, i16* readonly align 512 "orig.arg.no"="23" "unpacked"="23.1" %_112, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* "orig.arg.no"="24" "unpacked"="24", i24* align 512 "orig.arg.no"="25" "unpacked"="25.0" %_V_data_V1, i3* align 512 "orig.arg.no"="25" "unpacked"="25.1" %_V_keep_V2, i3* align 512 "orig.arg.no"="25" "unpacked"="25.2" %_V_strb_V3, i1* align 512 "orig.arg.no"="25" "unpacked"="25.3" %_V_user_V4, i1* align 512 "orig.arg.no"="25" "unpacked"="25.4" %_V_last_V5, i1* align 512 "orig.arg.no"="25" "unpacked"="25.5" %_V_id_V6, i1* align 512 "orig.arg.no"="25" "unpacked"="25.6" %_V_dest_V7) #4 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* %0, i24* align 512 %_V_data_V, i3* align 512 %_V_keep_V, i3* align 512 %_V_strb_V, i1* align 512 %_V_user_V, i1* align 512 %_V_last_V, i1* align 512 %_V_id_V, i1* align 512 %_V_dest_V)
  call fastcc void @"onebyonecpy_hls.p0a4096struct.ap_uint<64>.80"([4096 x %"struct.ap_uint<64>"]* %1, [4096 x i64]* %2)
  call fastcc void @"onebyonecpy_hls.p0a4096struct.ap_uint<64>.80"([4096 x %"struct.ap_uint<64>"]* %3, [4096 x i64]* %4)
  call fastcc void @"onebyonecpy_hls.p0a4096struct.ap_uint<64>.80"([4096 x %"struct.ap_uint<64>"]* %5, [4096 x i64]* %6)
  call void @onebyonecpy_hls.p0a2i16.126.129([2 x i16]* %7, i16* align 512 %_0, i16* align 512 %_1)
  call void @onebyonecpy_hls.p0a2i16.126.129([2 x i16]* %8, i16* align 512 %_01, i16* align 512 %_12)
  call void @onebyonecpy_hls.p0a2i16.126.129([2 x i16]* %9, i16* align 512 %_03, i16* align 512 %_14)
  call void @onebyonecpy_hls.p0a2i16.126.129([2 x i16]* %10, i16* align 512 %_05, i16* align 512 %_16)
  call void @onebyonecpy_hls.p0a2i16.126.129([2 x i16]* %11, i16* align 512 %_07, i16* align 512 %_18)
  call void @onebyonecpy_hls.p0a2i8.130.133([2 x i8]* %12, i8* align 512 %_09, i8* align 512 %_110)
  call fastcc void @onebyonecpy_hls.p0a2i8([2 x i8]* %13, [2 x i8]* align 512 %14)
  call void @onebyonecpy_hls.p0a2i16.126.129([2 x i16]* %15, i16* align 512 %_011, i16* align 512 %_112)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* %16, i24* align 512 %_V_data_V1, i3* align 512 %_V_keep_V2, i3* align 512 %_V_strb_V3, i1* align 512 %_V_user_V4, i1* align 512 %_V_last_V5, i1* align 512 %_V_id_V6, i1* align 512 %_V_dest_V7)
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* %dst, i24* align 512 "unpacked"="1.0" %src_V_data_V, i3* align 512 "unpacked"="1.1" %src_V_keep_V, i3* align 512 "unpacked"="1.2" %src_V_strb_V, i1* align 512 "unpacked"="1.3" %src_V_user_V, i1* align 512 "unpacked"="1.4" %src_V_last_V, i1* align 512 "unpacked"="1.5" %src_V_id_V, i1* align 512 "unpacked"="1.6" %src_V_dest_V) unnamed_addr #5 {
entry:
  %0 = icmp eq %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>.167"(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* nonnull %dst, i24* align 512 %src_V_data_V, i3* align 512 %src_V_keep_V, i3* align 512 %src_V_strb_V, i1* align 512 %src_V_user_V, i1* align 512 %src_V_last_V, i1* align 512 %src_V_id_V, i1* align 512 %src_V_dest_V)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>.167"(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* nocapture, i24* nocapture align 512 "unpacked"="1.0" %_V_data_V, i3* nocapture align 512 "unpacked"="1.1" %_V_keep_V, i3* nocapture align 512 "unpacked"="1.2" %_V_strb_V, i1* nocapture align 512 "unpacked"="1.3" %_V_user_V, i1* nocapture align 512 "unpacked"="1.4" %_V_last_V, i1* nocapture align 512 "unpacked"="1.5" %_V_id_V, i1* nocapture align 512 "unpacked"="1.6" %_V_dest_V) unnamed_addr #6 {
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
  br label %empty, !llvm.loop !50

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>.174"(i24* align 512 "unpacked"="0.0" %dst_V_data_V, i3* align 512 "unpacked"="0.1" %dst_V_keep_V, i3* align 512 "unpacked"="0.2" %dst_V_strb_V, i1* align 512 "unpacked"="0.3" %dst_V_user_V, i1* align 512 "unpacked"="0.4" %dst_V_last_V, i1* align 512 "unpacked"="0.5" %dst_V_id_V, i1* align 512 "unpacked"="0.6" %dst_V_dest_V, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* %src) unnamed_addr #5 {
entry:
  %0 = icmp eq %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>.177"(i24* align 512 %dst_V_data_V, i3* align 512 %dst_V_keep_V, i3* align 512 %dst_V_strb_V, i1* align 512 %dst_V_user_V, i1* align 512 %dst_V_last_V, i1* align 512 %dst_V_id_V, i1* align 512 %dst_V_dest_V, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* nonnull %src)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>.177"(i24* nocapture align 512 "unpacked"="0.0" %_V_data_V, i3* nocapture align 512 "unpacked"="0.1" %_V_keep_V, i3* nocapture align 512 "unpacked"="0.2" %_V_strb_V, i1* nocapture align 512 "unpacked"="0.3" %_V_user_V, i1* nocapture align 512 "unpacked"="0.4" %_V_last_V, i1* nocapture align 512 "unpacked"="0.5" %_V_id_V, i1* nocapture align 512 "unpacked"="0.6" %_V_dest_V, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* nocapture) unnamed_addr #6 {
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
  br label %empty, !llvm.loop !50

ret:                                              ; preds = %empty
  ret void
}

declare void @apatb_v_mix_hw(i24*, i3*, i3*, i1*, i1*, i1*, i1*, i16, i16, i16, i16, i16, i16, i32, [4096 x i64]*, i64*, i64*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i8*, i8*, [2 x i8]*, i16*, i16*, i16, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i24*, i3*, i3*, i1*, i1*, i1*, i1*)

; Function Attrs: argmemonly noinline willreturn
define internal void @copy_back(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* "orig.arg.no"="0" "unpacked"="0", i24* align 512 "orig.arg.no"="1" "unpacked"="1.0" %_V_data_V, i3* align 512 "orig.arg.no"="1" "unpacked"="1.1" %_V_keep_V, i3* align 512 "orig.arg.no"="1" "unpacked"="1.2" %_V_strb_V, i1* align 512 "orig.arg.no"="1" "unpacked"="1.3" %_V_user_V, i1* align 512 "orig.arg.no"="1" "unpacked"="1.4" %_V_last_V, i1* align 512 "orig.arg.no"="1" "unpacked"="1.5" %_V_id_V, i1* align 512 "orig.arg.no"="1" "unpacked"="1.6" %_V_dest_V, [4096 x %"struct.ap_uint<64>"]* "orig.arg.no"="2" "unpacked"="2", [4096 x i64]* nocapture readonly "orig.arg.no"="3" "unpacked"="3.0", [4096 x %"struct.ap_uint<64>"]* "orig.arg.no"="4" "unpacked"="4", [4096 x i64]* nocapture readonly "orig.arg.no"="5" "unpacked"="5.0", [4096 x %"struct.ap_uint<64>"]* "orig.arg.no"="6" "unpacked"="6", [4096 x i64]* nocapture readonly "orig.arg.no"="7" "unpacked"="7.0", [2 x i16]* "orig.arg.no"="8" "unpacked"="8", i16* readonly align 512 "orig.arg.no"="9" "unpacked"="9.0" %_0, i16* readonly align 512 "orig.arg.no"="9" "unpacked"="9.1" %_1, [2 x i16]* "orig.arg.no"="10" "unpacked"="10", i16* readonly align 512 "orig.arg.no"="11" "unpacked"="11.0" %_01, i16* readonly align 512 "orig.arg.no"="11" "unpacked"="11.1" %_12, [2 x i16]* "orig.arg.no"="12" "unpacked"="12", i16* readonly align 512 "orig.arg.no"="13" "unpacked"="13.0" %_03, i16* readonly align 512 "orig.arg.no"="13" "unpacked"="13.1" %_14, [2 x i16]* "orig.arg.no"="14" "unpacked"="14", i16* readonly align 512 "orig.arg.no"="15" "unpacked"="15.0" %_05, i16* readonly align 512 "orig.arg.no"="15" "unpacked"="15.1" %_16, [2 x i16]* "orig.arg.no"="16" "unpacked"="16", i16* readonly align 512 "orig.arg.no"="17" "unpacked"="17.0" %_07, i16* readonly align 512 "orig.arg.no"="17" "unpacked"="17.1" %_18, [2 x i8]* "orig.arg.no"="18" "unpacked"="18", i8* readonly align 512 "orig.arg.no"="19" "unpacked"="19.0" %_09, i8* readonly align 512 "orig.arg.no"="19" "unpacked"="19.1" %_110, [2 x i8]* "orig.arg.no"="20" "unpacked"="20", [2 x i8]* readonly align 512 "orig.arg.no"="21" "unpacked"="21", [2 x i16]* "orig.arg.no"="22" "unpacked"="22", i16* readonly align 512 "orig.arg.no"="23" "unpacked"="23.0" %_011, i16* readonly align 512 "orig.arg.no"="23" "unpacked"="23.1" %_112, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* "orig.arg.no"="24" "unpacked"="24", i24* align 512 "orig.arg.no"="25" "unpacked"="25.0" %_V_data_V1, i3* align 512 "orig.arg.no"="25" "unpacked"="25.1" %_V_keep_V2, i3* align 512 "orig.arg.no"="25" "unpacked"="25.2" %_V_strb_V3, i1* align 512 "orig.arg.no"="25" "unpacked"="25.3" %_V_user_V4, i1* align 512 "orig.arg.no"="25" "unpacked"="25.4" %_V_last_V5, i1* align 512 "orig.arg.no"="25" "unpacked"="25.5" %_V_id_V6, i1* align 512 "orig.arg.no"="25" "unpacked"="25.6" %_V_dest_V7) #4 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* %0, i24* align 512 %_V_data_V, i3* align 512 %_V_keep_V, i3* align 512 %_V_strb_V, i1* align 512 %_V_user_V, i1* align 512 %_V_last_V, i1* align 512 %_V_id_V, i1* align 512 %_V_dest_V)
  call fastcc void @"onebyonecpy_hls.p0a4096struct.ap_uint<64>.80"([4096 x %"struct.ap_uint<64>"]* %1, [4096 x i64]* %2)
  call fastcc void @"onebyonecpy_hls.p0a4096struct.ap_uint<64>.80"([4096 x %"struct.ap_uint<64>"]* %3, [4096 x i64]* %4)
  call fastcc void @"onebyonecpy_hls.p0a4096struct.ap_uint<64>.80"([4096 x %"struct.ap_uint<64>"]* %5, [4096 x i64]* %6)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* %16, i24* align 512 %_V_data_V1, i3* align 512 %_V_keep_V2, i3* align 512 %_V_strb_V3, i1* align 512 %_V_user_V4, i1* align 512 %_V_last_V5, i1* align 512 %_V_id_V6, i1* align 512 %_V_dest_V7)
  ret void
}

declare void @v_mix_hw_stub(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* noalias nonnull, i16 zeroext, i16 zeroext, i16 zeroext, i16 zeroext, i16 zeroext, i16 zeroext, i32, %"struct.ap_uint<64>"* noalias nonnull, %"struct.ap_uint<64>"* noalias nonnull, %"struct.ap_uint<64>"* noalias nonnull, i16* noalias nocapture nonnull readonly, i16* noalias nocapture nonnull readonly, i16* noalias nocapture nonnull readonly, i16* noalias nocapture nonnull readonly, i16* noalias nocapture nonnull readonly, i8* noalias nocapture nonnull readonly, i8* noalias nocapture nonnull readnone, i16* noalias nocapture nonnull readonly, i16 zeroext, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* noalias nonnull)

define void @v_mix_hw_stub_wrapper(i24*, i3*, i3*, i1*, i1*, i1*, i1*, i16, i16, i16, i16, i16, i16, i32, [4096 x i64]*, i64*, i64*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i8*, i8*, [2 x i8]*, i16*, i16*, i16, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i24*, i3*, i3*, i1*, i1*, i1*, i1*) #7 {
entry:
  %64 = call i8* @malloc(i64 12)
  %65 = bitcast i8* %64 to %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"*
  %66 = call i8* @malloc(i64 32768)
  %67 = bitcast i8* %66 to [4096 x %"struct.ap_uint<64>"]*
  %68 = call i8* @malloc(i64 32768)
  %69 = bitcast i8* %68 to [4096 x %"struct.ap_uint<64>"]*
  %70 = bitcast i64* %15 to [4096 x i64]*
  %71 = call i8* @malloc(i64 32768)
  %72 = bitcast i8* %71 to [4096 x %"struct.ap_uint<64>"]*
  %73 = bitcast i64* %16 to [4096 x i64]*
  %74 = call i8* @malloc(i64 4)
  %75 = bitcast i8* %74 to [2 x i16]*
  %76 = call i8* @malloc(i64 4)
  %77 = bitcast i8* %76 to [2 x i16]*
  %78 = call i8* @malloc(i64 4)
  %79 = bitcast i8* %78 to [2 x i16]*
  %80 = call i8* @malloc(i64 4)
  %81 = bitcast i8* %80 to [2 x i16]*
  %82 = call i8* @malloc(i64 4)
  %83 = bitcast i8* %82 to [2 x i16]*
  %84 = call i8* @malloc(i64 2)
  %85 = bitcast i8* %84 to [2 x i8]*
  %86 = call i8* @malloc(i64 4)
  %87 = bitcast i8* %86 to [2 x i16]*
  %88 = call i8* @malloc(i64 12)
  %89 = bitcast i8* %88 to %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"*
  call void @copy_out(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* %65, i24* %0, i3* %1, i3* %2, i1* %3, i1* %4, i1* %5, i1* %6, [4096 x %"struct.ap_uint<64>"]* %67, [4096 x i64]* %14, [4096 x %"struct.ap_uint<64>"]* %69, [4096 x i64]* %70, [4096 x %"struct.ap_uint<64>"]* %72, [4096 x i64]* %73, [2 x i16]* %75, i16* %17, i16* %18, [2 x i16]* %77, i16* %19, i16* %20, [2 x i16]* %79, i16* %21, i16* %22, [2 x i16]* %81, i16* %23, i16* %24, [2 x i16]* %83, i16* %25, i16* %26, [2 x i8]* %85, i8* %27, i8* %28, [2 x i8]* null, [2 x i8]* %29, [2 x i16]* %87, i16* %30, i16* %31, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* %89, i24* %57, i3* %58, i3* %59, i1* %60, i1* %61, i1* %62, i1* %63)
  %90 = bitcast [4096 x %"struct.ap_uint<64>"]* %67 to %"struct.ap_uint<64>"*
  %91 = bitcast [4096 x %"struct.ap_uint<64>"]* %69 to %"struct.ap_uint<64>"*
  %92 = bitcast [4096 x %"struct.ap_uint<64>"]* %72 to %"struct.ap_uint<64>"*
  %93 = bitcast [2 x i16]* %75 to i16*
  %94 = bitcast [2 x i16]* %77 to i16*
  %95 = bitcast [2 x i16]* %79 to i16*
  %96 = bitcast [2 x i16]* %81 to i16*
  %97 = bitcast [2 x i16]* %83 to i16*
  %98 = bitcast [2 x i8]* %85 to i8*
  %99 = bitcast [2 x i8]* %29 to i8*
  %100 = bitcast [2 x i16]* %87 to i16*
  call void @v_mix_hw_stub(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* %65, i16 %7, i16 %8, i16 %9, i16 %10, i16 %11, i16 %12, i32 %13, %"struct.ap_uint<64>"* %90, %"struct.ap_uint<64>"* %91, %"struct.ap_uint<64>"* %92, i16* %93, i16* %94, i16* %95, i16* %96, i16* %97, i8* %98, i8* %99, i16* %100, i16 %32, i32 %33, i32 %34, i32 %35, i32 %36, i32 %37, i32 %38, i32 %39, i32 %40, i32 %41, i32 %42, i32 %43, i32 %44, i32 %45, i32 %46, i32 %47, i32 %48, i32 %49, i32 %50, i32 %51, i32 %52, i32 %53, i32 %54, i32 %55, i32 %56, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* %89)
  call void @copy_in(%"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* %65, i24* %0, i3* %1, i3* %2, i1* %3, i1* %4, i1* %5, i1* %6, [4096 x %"struct.ap_uint<64>"]* %67, [4096 x i64]* %14, [4096 x %"struct.ap_uint<64>"]* %69, [4096 x i64]* %70, [4096 x %"struct.ap_uint<64>"]* %72, [4096 x i64]* %73, [2 x i16]* %75, i16* %17, i16* %18, [2 x i16]* %77, i16* %19, i16* %20, [2 x i16]* %79, i16* %21, i16* %22, [2 x i16]* %81, i16* %23, i16* %24, [2 x i16]* %83, i16* %25, i16* %26, [2 x i8]* %85, i8* %27, i8* %28, [2 x i8]* null, [2 x i8]* %29, [2 x i16]* %87, i16* %30, i16* %31, %"class.hls::stream<hls::axis<ap_uint<24>, 1, 1, 1, '8', false>, 0>"* %89, i24* %57, i3* %58, i3* %59, i1* %60, i1* %61, i1* %62, i1* %63)
  call void @free(i8* %64)
  call void @free(i8* %66)
  call void @free(i8* %68)
  call void @free(i8* %71)
  call void @free(i8* %74)
  call void @free(i8* %76)
  call void @free(i8* %78)
  call void @free(i8* %80)
  call void @free(i8* %82)
  call void @free(i8* %84)
  call void @free(i8* %86)
  call void @free(i8* %88)
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
attributes #1 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="arraycpy_hls" }
attributes #2 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline willreturn "fpga.wrapper.func"="copyin" }
attributes #4 = { argmemonly noinline willreturn "fpga.wrapper.func"="copyout" }
attributes #5 = { argmemonly noinline willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #6 = { argmemonly noinline willreturn "fpga.wrapper.func"="streamcpy_hls" }
attributes #7 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1, !1}
!llvm.module.flags = !{!2, !3, !4}
!blackbox_cfg = !{!5}
!datalayout.transforms.on.top = !{!6, !14, !20, !26, !32, !38, !44}

!0 = !{!"AMD/Xilinx clang version 16.0.6"}
!1 = !{!"clang version 7.0.0 "}
!2 = !{i32 2, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{}
!6 = !{!7, !9, !11}
!7 = !{!8}
!8 = !{!"11", [2 x i16]* null}
!9 = !{!10}
!10 = !{!"array_partition", !"type=Complete", !"dim=1"}
!11 = !{!12, !13}
!12 = !{!"11.0", i16* null}
!13 = !{!"11.1", i16* null}
!14 = !{!15, !9, !17}
!15 = !{!16}
!16 = !{!"12", [2 x i16]* null}
!17 = !{!18, !19}
!18 = !{!"12.0", i16* null}
!19 = !{!"12.1", i16* null}
!20 = !{!21, !9, !23}
!21 = !{!22}
!22 = !{!"13", [2 x i16]* null}
!23 = !{!24, !25}
!24 = !{!"13.0", i16* null}
!25 = !{!"13.1", i16* null}
!26 = !{!27, !9, !29}
!27 = !{!28}
!28 = !{!"14", [2 x i16]* null}
!29 = !{!30, !31}
!30 = !{!"14.0", i16* null}
!31 = !{!"14.1", i16* null}
!32 = !{!33, !9, !35}
!33 = !{!34}
!34 = !{!"15", [2 x i16]* null}
!35 = !{!36, !37}
!36 = !{!"15.0", i16* null}
!37 = !{!"15.1", i16* null}
!38 = !{!39, !9, !41}
!39 = !{!40}
!40 = !{!"16", [2 x i8]* null}
!41 = !{!42, !43}
!42 = !{!"16.0", i8* null}
!43 = !{!"16.1", i8* null}
!44 = !{!45, !9, !47}
!45 = !{!46}
!46 = !{!"18", [2 x i16]* null}
!47 = !{!48, !49}
!48 = !{!"18.0", i16* null}
!49 = !{!"18.1", i16* null}
!50 = distinct !{!50, !51}
!51 = !{!"llvm.loop.rotate.disable"}
