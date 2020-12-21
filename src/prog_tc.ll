; ModuleID = 'prog_tc.c'
source_filename = "prog_tc.c"
target datalayout = "e-m:e-p:64:64-i64:64-n32:64-S128"
target triple = "bpf"

%struct.bpf_elf_map = type { i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.__sk_buff = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [5 x i32], i32, i32, i32, i32, i32, i32, i32, i32, [4 x i32], [4 x i32], i32, i32, i32, %union.anon, i64, i32, i32, %union.anon.2 }
%union.anon = type { %struct.bpf_flow_keys* }
%struct.bpf_flow_keys = type { i16, i16, i16, i8, i8, i8, i8, i16, i16, i16, %union.anon.0 }
%union.anon.0 = type { %struct.anon.1 }
%struct.anon.1 = type { [4 x i32], [4 x i32] }
%union.anon.2 = type { %struct.bpf_sock* }
%struct.bpf_sock = type { i32, i32, i32, i32, i32, i32, i32, [4 x i32], i32, i32, i32, [4 x i32], i32 }
%struct.ip_key = type { i32, i32 }
%struct.flow_key = type { %struct.ip_key, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.xdp_md = type { i32, i32, i32, i32, i32 }
%struct.hash_elem = type { i32 }

@acc_map = global %struct.bpf_elf_map { i32 1, i32 12, i32 6, i32 32768, i32 0, i32 0, i32 2, i32 0, i32 0 }, section "maps", align 4, !dbg !0
@ip_map = global %struct.bpf_elf_map { i32 1, i32 8, i32 4, i32 256, i32 0, i32 0, i32 2, i32 0, i32 0 }, section "maps", align 4, !dbg !93
@llvm.used = appending global [4 x i8*] [i8* bitcast (%struct.bpf_elf_map* @acc_map to i8*), i8* bitcast (%struct.bpf_elf_map* @ip_map to i8*), i8* bitcast (i32 (%struct.__sk_buff*)* @tc_egress to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_ingress to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define i32 @tc_egress(%struct.__sk_buff* nocapture readonly) #0 section "tc_egr" !dbg !124 {
  %2 = alloca %struct.ip_key, align 4
  %3 = alloca %struct.flow_key, align 4
  call void @llvm.dbg.value(metadata %struct.__sk_buff* %0, metadata !217, metadata !DIExpression()), !dbg !234
  %4 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 15, !dbg !235
  %5 = load i32, i32* %4, align 4, !dbg !235, !tbaa !236
  %6 = zext i32 %5 to i64, !dbg !242
  %7 = inttoptr i64 %6 to i8*, !dbg !243
  call void @llvm.dbg.value(metadata i8* %7, metadata !218, metadata !DIExpression()), !dbg !244
  %8 = getelementptr inbounds %struct.__sk_buff, %struct.__sk_buff* %0, i64 0, i32 16, !dbg !245
  %9 = load i32, i32* %8, align 8, !dbg !245, !tbaa !246
  %10 = zext i32 %9 to i64, !dbg !247
  %11 = inttoptr i64 %10 to i8*, !dbg !248
  call void @llvm.dbg.value(metadata i8* %11, metadata !219, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.value(metadata i8* %7, metadata !250, metadata !DIExpression()), !dbg !260
  call void @llvm.dbg.value(metadata i8* %11, metadata !255, metadata !DIExpression()), !dbg !263
  call void @llvm.dbg.value(metadata i8* %7, metadata !256, metadata !DIExpression()), !dbg !264
  %12 = getelementptr inbounds i8, i8* %7, i64 14, !dbg !265
  %13 = icmp ugt i8* %12, %11, !dbg !267
  br i1 %13, label %77, label %14, !dbg !268

; <label>:14:                                     ; preds = %1
  %15 = getelementptr inbounds i8, i8* %7, i64 12, !dbg !269
  %16 = bitcast i8* %15 to i16*, !dbg !269
  %17 = load i16, i16* %16, align 1, !dbg !269, !tbaa !270
  %18 = icmp ne i16 %17, 8, !dbg !273
  %19 = getelementptr inbounds i8, i8* %7, i64 34, !dbg !274
  %20 = icmp ugt i8* %19, %11, !dbg !276
  %21 = or i1 %20, %18, !dbg !277
  call void @llvm.dbg.value(metadata i8* %12, metadata !257, metadata !DIExpression()), !dbg !278
  br i1 %21, label %77, label %22, !dbg !277

; <label>:22:                                     ; preds = %14
  %23 = getelementptr inbounds i8, i8* %7, i64 23, !dbg !279
  %24 = load i8, i8* %23, align 1, !dbg !279, !tbaa !281
  %25 = icmp eq i8 %24, 6, !dbg !283
  br i1 %25, label %26, label %77

; <label>:26:                                     ; preds = %22
  %27 = inttoptr i64 %6 to %struct.ethhdr*, !dbg !284
  call void @llvm.dbg.value(metadata %struct.ethhdr* %27, metadata !220, metadata !DIExpression()), !dbg !285
  call void @llvm.dbg.value(metadata i8* %7, metadata !231, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)), !dbg !286
  call void @llvm.dbg.value(metadata i8* %19, metadata !232, metadata !DIExpression()), !dbg !287
  %28 = getelementptr inbounds i8, i8* %7, i64 54, !dbg !288
  %29 = icmp ugt i8* %28, %11, !dbg !290
  br i1 %29, label %77, label %30, !dbg !291

; <label>:30:                                     ; preds = %26
  %31 = getelementptr inbounds i8, i8* %7, i64 30, !dbg !292
  %32 = bitcast i8* %31 to i32*, !dbg !292
  %33 = load i32, i32* %32, align 4, !dbg !292, !tbaa !293
  %34 = bitcast i8* %19 to i16*, !dbg !294
  %35 = load i16, i16* %34, align 4, !dbg !294, !tbaa !295
  call void @llvm.dbg.value(metadata i32 %33, metadata !297, metadata !DIExpression()) #3, !dbg !322
  call void @llvm.dbg.value(metadata i16 %35, metadata !308, metadata !DIExpression()) #3, !dbg !324
  %36 = bitcast %struct.ip_key* %2 to i8*, !dbg !325
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %36) #3, !dbg !325
  %37 = getelementptr inbounds %struct.ip_key, %struct.ip_key* %2, i64 0, i32 0, !dbg !326
  store i32 %33, i32* %37, align 4, !dbg !326, !tbaa !327
  %38 = getelementptr inbounds %struct.ip_key, %struct.ip_key* %2, i64 0, i32 1, !dbg !326
  %39 = zext i16 %35 to i32, !dbg !329
  store i32 %39, i32* %38, align 4, !dbg !326, !tbaa !330
  %40 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_elf_map* @ip_map to i8*), i8* nonnull %36) #3, !dbg !331
  call void @llvm.dbg.value(metadata i8* %40, metadata !316, metadata !DIExpression()) #3, !dbg !332
  call void @llvm.dbg.value(metadata i32 -1, metadata !321, metadata !DIExpression()) #3, !dbg !333
  %41 = icmp eq i8* %40, null, !dbg !334
  br i1 %41, label %46, label %42, !dbg !336

; <label>:42:                                     ; preds = %30
  %43 = bitcast i8* %40 to i32*, !dbg !337
  %44 = load i32, i32* %43, align 4, !dbg !337, !tbaa !338
  call void @llvm.dbg.value(metadata i32 %44, metadata !321, metadata !DIExpression()) #3, !dbg !333
  %45 = icmp sgt i32 %44, -1, !dbg !340
  br i1 %45, label %47, label %46, !dbg !342

; <label>:46:                                     ; preds = %30, %42
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %36) #3, !dbg !343
  call void @llvm.dbg.value(metadata i32 %44, metadata !233, metadata !DIExpression()), !dbg !344
  br label %77, !dbg !345

; <label>:47:                                     ; preds = %42
  %48 = add i32 %44, -1, !dbg !346
  store i32 %48, i32* %43, align 4, !dbg !346, !tbaa !338
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %36) #3, !dbg !343
  call void @llvm.dbg.value(metadata i32 %44, metadata !233, metadata !DIExpression()), !dbg !344
  %49 = load i32, i32* %32, align 4, !dbg !347, !tbaa !293
  %50 = load i16, i16* %34, align 4, !dbg !348, !tbaa !295
  call void @llvm.dbg.value(metadata i32 %49, metadata !349, metadata !DIExpression()) #3, !dbg !368
  call void @llvm.dbg.value(metadata i16 %50, metadata !355, metadata !DIExpression()) #3, !dbg !370
  call void @llvm.dbg.value(metadata i32 %44, metadata !356, metadata !DIExpression()) #3, !dbg !371
  call void @llvm.dbg.value(metadata i8* %59, metadata !357, metadata !DIExpression()) #3, !dbg !372
  %51 = bitcast %struct.flow_key* %3 to i8*, !dbg !373
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %51) #3, !dbg !373
  %52 = getelementptr inbounds %struct.flow_key, %struct.flow_key* %3, i64 0, i32 0, i32 0, !dbg !374
  store i32 %49, i32* %52, align 4, !dbg !374, !tbaa !327
  %53 = getelementptr inbounds %struct.flow_key, %struct.flow_key* %3, i64 0, i32 0, i32 1, !dbg !374
  %54 = zext i16 %50 to i32, !dbg !375
  store i32 %54, i32* %53, align 4, !dbg !374, !tbaa !330
  %55 = getelementptr inbounds %struct.flow_key, %struct.flow_key* %3, i64 0, i32 1, !dbg !376
  store i32 %44, i32* %55, align 4, !dbg !376, !tbaa !377
  %56 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_elf_map* @acc_map to i8*), i8* nonnull %51) #3, !dbg !379
  call void @llvm.dbg.value(metadata i8* %56, metadata !363, metadata !DIExpression()) #3, !dbg !380
  %57 = icmp eq i8* %56, null, !dbg !381
  br i1 %57, label %76, label %58, !dbg !383

; <label>:58:                                     ; preds = %47
  %59 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %27, i64 0, i32 0, i64 0, !dbg !384
  %60 = load i8, i8* %56, align 1, !dbg !385, !tbaa !386
  store i8 %60, i8* %59, align 1, !dbg !387, !tbaa !386
  %61 = getelementptr inbounds i8, i8* %56, i64 1, !dbg !388
  %62 = load i8, i8* %61, align 1, !dbg !388, !tbaa !386
  %63 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %27, i64 0, i32 0, i64 1, !dbg !389
  store i8 %62, i8* %63, align 1, !dbg !390, !tbaa !386
  %64 = getelementptr inbounds i8, i8* %56, i64 2, !dbg !391
  %65 = load i8, i8* %64, align 1, !dbg !391, !tbaa !386
  %66 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %27, i64 0, i32 0, i64 2, !dbg !392
  store i8 %65, i8* %66, align 1, !dbg !393, !tbaa !386
  %67 = getelementptr inbounds i8, i8* %56, i64 3, !dbg !394
  %68 = load i8, i8* %67, align 1, !dbg !394, !tbaa !386
  %69 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %27, i64 0, i32 0, i64 3, !dbg !395
  store i8 %68, i8* %69, align 1, !dbg !396, !tbaa !386
  %70 = getelementptr inbounds i8, i8* %56, i64 4, !dbg !397
  %71 = load i8, i8* %70, align 1, !dbg !397, !tbaa !386
  %72 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %27, i64 0, i32 0, i64 4, !dbg !398
  store i8 %71, i8* %72, align 1, !dbg !399, !tbaa !386
  %73 = getelementptr inbounds i8, i8* %56, i64 5, !dbg !400
  %74 = load i8, i8* %73, align 1, !dbg !400, !tbaa !386
  %75 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %27, i64 0, i32 0, i64 5, !dbg !401
  store i8 %74, i8* %75, align 1, !dbg !402, !tbaa !386
  br label %76, !dbg !403

; <label>:76:                                     ; preds = %47, %58
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %51) #3, !dbg !403
  br label %77, !dbg !404

; <label>:77:                                     ; preds = %14, %22, %1, %46, %26, %76
  ret i32 0, !dbg !405
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind
define i32 @xdp_ingress(%struct.xdp_md* nocapture readonly) #0 section "xdp_ing" !dbg !406 {
  %2 = alloca %struct.ip_key, align 4
  %3 = alloca %struct.hash_elem, align 4
  %4 = alloca %struct.flow_key, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !418, metadata !DIExpression()), !dbg !425
  %5 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !426
  %6 = load i32, i32* %5, align 4, !dbg !426, !tbaa !427
  %7 = zext i32 %6 to i64, !dbg !429
  %8 = inttoptr i64 %7 to i8*, !dbg !430
  call void @llvm.dbg.value(metadata i8* %8, metadata !419, metadata !DIExpression()), !dbg !431
  %9 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !432
  %10 = load i32, i32* %9, align 4, !dbg !432, !tbaa !433
  %11 = zext i32 %10 to i64, !dbg !434
  %12 = inttoptr i64 %11 to i8*, !dbg !435
  call void @llvm.dbg.value(metadata i8* %12, metadata !420, metadata !DIExpression()), !dbg !436
  call void @llvm.dbg.value(metadata i8* %8, metadata !250, metadata !DIExpression()), !dbg !437
  call void @llvm.dbg.value(metadata i8* %12, metadata !255, metadata !DIExpression()), !dbg !440
  call void @llvm.dbg.value(metadata i8* %8, metadata !256, metadata !DIExpression()), !dbg !441
  %13 = getelementptr inbounds i8, i8* %8, i64 14, !dbg !442
  %14 = icmp ugt i8* %13, %12, !dbg !443
  br i1 %14, label %85, label %15, !dbg !444

; <label>:15:                                     ; preds = %1
  %16 = getelementptr inbounds i8, i8* %8, i64 12, !dbg !445
  %17 = bitcast i8* %16 to i16*, !dbg !445
  %18 = load i16, i16* %17, align 1, !dbg !445, !tbaa !270
  %19 = icmp ne i16 %18, 8, !dbg !446
  %20 = getelementptr inbounds i8, i8* %8, i64 34, !dbg !447
  %21 = icmp ugt i8* %20, %12, !dbg !448
  %22 = or i1 %21, %19, !dbg !449
  call void @llvm.dbg.value(metadata i8* %13, metadata !257, metadata !DIExpression()), !dbg !450
  br i1 %22, label %85, label %23, !dbg !449

; <label>:23:                                     ; preds = %15
  %24 = getelementptr inbounds i8, i8* %8, i64 23, !dbg !451
  %25 = load i8, i8* %24, align 1, !dbg !451, !tbaa !281
  %26 = icmp eq i8 %25, 6, !dbg !452
  br i1 %26, label %27, label %85

; <label>:27:                                     ; preds = %23
  %28 = inttoptr i64 %7 to %struct.ethhdr*, !dbg !453
  call void @llvm.dbg.value(metadata %struct.ethhdr* %28, metadata !421, metadata !DIExpression()), !dbg !454
  call void @llvm.dbg.value(metadata i8* %8, metadata !422, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)), !dbg !455
  call void @llvm.dbg.value(metadata i8* %8, metadata !423, metadata !DIExpression(DW_OP_plus_uconst, 34, DW_OP_stack_value)), !dbg !456
  %29 = getelementptr inbounds i8, i8* %8, i64 54, !dbg !457
  %30 = icmp ugt i8* %29, %12, !dbg !459
  br i1 %30, label %85, label %31, !dbg !460

; <label>:31:                                     ; preds = %27
  %32 = getelementptr inbounds i8, i8* %8, i64 26, !dbg !461
  %33 = bitcast i8* %32 to i32*, !dbg !461
  %34 = load i32, i32* %33, align 4, !dbg !461, !tbaa !462
  %35 = getelementptr inbounds i8, i8* %8, i64 36, !dbg !463
  %36 = bitcast i8* %35 to i16*, !dbg !463
  %37 = load i16, i16* %36, align 2, !dbg !463, !tbaa !464
  call void @llvm.dbg.value(metadata i32 %34, metadata !465, metadata !DIExpression()) #3, !dbg !474
  call void @llvm.dbg.value(metadata i16 %37, metadata !468, metadata !DIExpression()) #3, !dbg !476
  %38 = bitcast %struct.ip_key* %2 to i8*, !dbg !477
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %38) #3, !dbg !477
  %39 = getelementptr inbounds %struct.ip_key, %struct.ip_key* %2, i64 0, i32 0, !dbg !478
  store i32 %34, i32* %39, align 4, !dbg !478, !tbaa !327
  %40 = getelementptr inbounds %struct.ip_key, %struct.ip_key* %2, i64 0, i32 1, !dbg !478
  %41 = zext i16 %37 to i32, !dbg !479
  store i32 %41, i32* %40, align 4, !dbg !478, !tbaa !330
  %42 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_elf_map* @ip_map to i8*), i8* nonnull %38) #3, !dbg !480
  call void @llvm.dbg.value(metadata i8* %42, metadata !470, metadata !DIExpression()) #3, !dbg !481
  %43 = icmp eq i8* %42, null, !dbg !482
  br i1 %43, label %44, label %49, !dbg !483

; <label>:44:                                     ; preds = %31
  %45 = bitcast %struct.hash_elem* %3 to i8*, !dbg !484
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %45) #3, !dbg !484
  %46 = getelementptr inbounds %struct.hash_elem, %struct.hash_elem* %3, i64 0, i32 0, !dbg !485
  store i32 0, i32* %46, align 4, !dbg !486, !tbaa !338
  %47 = call i32 inttoptr (i64 2 to i32 (i8*, i8*, i8*, i64)*)(i8* bitcast (%struct.bpf_elf_map* @ip_map to i8*), i8* nonnull %38, i8* nonnull %45, i64 0) #3, !dbg !487
  %48 = ashr i32 %47, 31, !dbg !489
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %45) #3, !dbg !490
  br label %53

; <label>:49:                                     ; preds = %31
  %50 = bitcast i8* %42 to i32*, !dbg !491
  %51 = load i32, i32* %50, align 4, !dbg !492, !tbaa !338
  %52 = add i32 %51, 1, !dbg !492
  store i32 %52, i32* %50, align 4, !dbg !492, !tbaa !338
  br label %53, !dbg !493

; <label>:53:                                     ; preds = %44, %49
  %54 = phi i32 [ %52, %49 ], [ %48, %44 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %38) #3, !dbg !494
  call void @llvm.dbg.value(metadata i32 %54, metadata !424, metadata !DIExpression()), !dbg !495
  %55 = icmp slt i32 %54, 0, !dbg !496
  br i1 %55, label %85, label %56, !dbg !498

; <label>:56:                                     ; preds = %53
  %57 = load i32, i32* %33, align 4, !dbg !499, !tbaa !462
  %58 = load i16, i16* %36, align 2, !dbg !500, !tbaa !464
  call void @llvm.dbg.value(metadata i32 %57, metadata !501, metadata !DIExpression()) #3, !dbg !509
  call void @llvm.dbg.value(metadata i16 %58, metadata !504, metadata !DIExpression()) #3, !dbg !511
  call void @llvm.dbg.value(metadata i32 %54, metadata !505, metadata !DIExpression()) #3, !dbg !512
  call void @llvm.dbg.value(metadata i8* %67, metadata !506, metadata !DIExpression()) #3, !dbg !513
  %59 = bitcast %struct.flow_key* %4 to i8*, !dbg !514
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %59) #3, !dbg !514
  %60 = getelementptr inbounds %struct.flow_key, %struct.flow_key* %4, i64 0, i32 0, i32 0, !dbg !515
  store i32 %57, i32* %60, align 4, !dbg !515, !tbaa !327
  %61 = getelementptr inbounds %struct.flow_key, %struct.flow_key* %4, i64 0, i32 0, i32 1, !dbg !515
  %62 = zext i16 %58 to i32, !dbg !516
  store i32 %62, i32* %61, align 4, !dbg !515, !tbaa !330
  %63 = getelementptr inbounds %struct.flow_key, %struct.flow_key* %4, i64 0, i32 1, !dbg !517
  store i32 %54, i32* %63, align 4, !dbg !517, !tbaa !377
  %64 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_elf_map* @acc_map to i8*), i8* nonnull %59) #3, !dbg !518
  call void @llvm.dbg.value(metadata i8* %64, metadata !508, metadata !DIExpression()) #3, !dbg !519
  %65 = icmp eq i8* %64, null, !dbg !520
  br i1 %65, label %84, label %66, !dbg !522

; <label>:66:                                     ; preds = %56
  %67 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %28, i64 0, i32 1, i64 0, !dbg !523
  %68 = load i8, i8* %67, align 1, !dbg !524, !tbaa !386
  store i8 %68, i8* %64, align 1, !dbg !525, !tbaa !386
  %69 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %28, i64 0, i32 1, i64 1, !dbg !526
  %70 = load i8, i8* %69, align 1, !dbg !526, !tbaa !386
  %71 = getelementptr inbounds i8, i8* %64, i64 1, !dbg !527
  store i8 %70, i8* %71, align 1, !dbg !528, !tbaa !386
  %72 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %28, i64 0, i32 1, i64 2, !dbg !529
  %73 = load i8, i8* %72, align 1, !dbg !529, !tbaa !386
  %74 = getelementptr inbounds i8, i8* %64, i64 2, !dbg !530
  store i8 %73, i8* %74, align 1, !dbg !531, !tbaa !386
  %75 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %28, i64 0, i32 1, i64 3, !dbg !532
  %76 = load i8, i8* %75, align 1, !dbg !532, !tbaa !386
  %77 = getelementptr inbounds i8, i8* %64, i64 3, !dbg !533
  store i8 %76, i8* %77, align 1, !dbg !534, !tbaa !386
  %78 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %28, i64 0, i32 1, i64 4, !dbg !535
  %79 = load i8, i8* %78, align 1, !dbg !535, !tbaa !386
  %80 = getelementptr inbounds i8, i8* %64, i64 4, !dbg !536
  store i8 %79, i8* %80, align 1, !dbg !537, !tbaa !386
  %81 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %28, i64 0, i32 1, i64 5, !dbg !538
  %82 = load i8, i8* %81, align 1, !dbg !538, !tbaa !386
  %83 = getelementptr inbounds i8, i8* %64, i64 5, !dbg !539
  store i8 %82, i8* %83, align 1, !dbg !540, !tbaa !386
  br label %84, !dbg !541

; <label>:84:                                     ; preds = %56, %66
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %59) #3, !dbg !541
  br label %85, !dbg !542

; <label>:85:                                     ; preds = %15, %23, %1, %27, %53, %84
  ret i32 2, !dbg !543
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.value(metadata, metadata, metadata) #2

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind readnone speculatable }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!120, !121, !122}
!llvm.ident = !{!123}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "acc_map", scope: !2, file: !3, line: 14, type: !95, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !42, globals: !92)
!3 = !DIFile(filename: "prog_tc.c", directory: "/home/jeremyguo/Desktop/tc-xdp-lab/src")
!4 = !{!5, !13}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 2845, size: 32, elements: !7)
!6 = !DIFile(filename: "../headers/linux/bpf.h", directory: "/home/jeremyguo/Desktop/tc-xdp-lab/src")
!7 = !{!8, !9, !10, !11, !12}
!8 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!9 = !DIEnumerator(name: "XDP_DROP", value: 1)
!10 = !DIEnumerator(name: "XDP_PASS", value: 2)
!11 = !DIEnumerator(name: "XDP_TX", value: 3)
!12 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!13 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !14, line: 28, size: 32, elements: !15)
!14 = !DIFile(filename: "/usr/include/linux/in.h", directory: "/home/jeremyguo/Desktop/tc-xdp-lab/src")
!15 = !{!16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41}
!16 = !DIEnumerator(name: "IPPROTO_IP", value: 0)
!17 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1)
!18 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2)
!19 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4)
!20 = !DIEnumerator(name: "IPPROTO_TCP", value: 6)
!21 = !DIEnumerator(name: "IPPROTO_EGP", value: 8)
!22 = !DIEnumerator(name: "IPPROTO_PUP", value: 12)
!23 = !DIEnumerator(name: "IPPROTO_UDP", value: 17)
!24 = !DIEnumerator(name: "IPPROTO_IDP", value: 22)
!25 = !DIEnumerator(name: "IPPROTO_TP", value: 29)
!26 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33)
!27 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41)
!28 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46)
!29 = !DIEnumerator(name: "IPPROTO_GRE", value: 47)
!30 = !DIEnumerator(name: "IPPROTO_ESP", value: 50)
!31 = !DIEnumerator(name: "IPPROTO_AH", value: 51)
!32 = !DIEnumerator(name: "IPPROTO_MTP", value: 92)
!33 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94)
!34 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98)
!35 = !DIEnumerator(name: "IPPROTO_PIM", value: 103)
!36 = !DIEnumerator(name: "IPPROTO_COMP", value: 108)
!37 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132)
!38 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136)
!39 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137)
!40 = !DIEnumerator(name: "IPPROTO_RAW", value: 255)
!41 = !DIEnumerator(name: "IPPROTO_MAX", value: 256)
!42 = !{!43, !44, !45, !52, !75}
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!44 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!46 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tcphdr", file: !47, line: 25, size: 160, elements: !48)
!47 = !DIFile(filename: "/usr/include/linux/tcp.h", directory: "/home/jeremyguo/Desktop/tc-xdp-lab/src")
!48 = !{!49, !55, !56, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !74}
!49 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !46, file: !47, line: 26, baseType: !50, size: 16)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !51, line: 25, baseType: !52)
!51 = !DIFile(filename: "/usr/include/linux/types.h", directory: "/home/jeremyguo/Desktop/tc-xdp-lab/src")
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !53, line: 24, baseType: !54)
!53 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "/home/jeremyguo/Desktop/tc-xdp-lab/src")
!54 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !46, file: !47, line: 27, baseType: !50, size: 16, offset: 16)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "seq", scope: !46, file: !47, line: 28, baseType: !57, size: 32, offset: 32)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !51, line: 27, baseType: !58)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !53, line: 27, baseType: !59)
!59 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "ack_seq", scope: !46, file: !47, line: 29, baseType: !57, size: 32, offset: 64)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "res1", scope: !46, file: !47, line: 31, baseType: !52, size: 4, offset: 96, flags: DIFlagBitField, extraData: i64 96)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "doff", scope: !46, file: !47, line: 32, baseType: !52, size: 4, offset: 100, flags: DIFlagBitField, extraData: i64 96)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "fin", scope: !46, file: !47, line: 33, baseType: !52, size: 1, offset: 104, flags: DIFlagBitField, extraData: i64 96)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "syn", scope: !46, file: !47, line: 34, baseType: !52, size: 1, offset: 105, flags: DIFlagBitField, extraData: i64 96)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "rst", scope: !46, file: !47, line: 35, baseType: !52, size: 1, offset: 106, flags: DIFlagBitField, extraData: i64 96)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "psh", scope: !46, file: !47, line: 36, baseType: !52, size: 1, offset: 107, flags: DIFlagBitField, extraData: i64 96)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "ack", scope: !46, file: !47, line: 37, baseType: !52, size: 1, offset: 108, flags: DIFlagBitField, extraData: i64 96)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "urg", scope: !46, file: !47, line: 38, baseType: !52, size: 1, offset: 109, flags: DIFlagBitField, extraData: i64 96)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "ece", scope: !46, file: !47, line: 39, baseType: !52, size: 1, offset: 110, flags: DIFlagBitField, extraData: i64 96)
!70 = !DIDerivedType(tag: DW_TAG_member, name: "cwr", scope: !46, file: !47, line: 40, baseType: !52, size: 1, offset: 111, flags: DIFlagBitField, extraData: i64 96)
!71 = !DIDerivedType(tag: DW_TAG_member, name: "window", scope: !46, file: !47, line: 55, baseType: !50, size: 16, offset: 112)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !46, file: !47, line: 56, baseType: !73, size: 16, offset: 128)
!73 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !51, line: 31, baseType: !52)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "urg_ptr", scope: !46, file: !47, line: 57, baseType: !50, size: 16, offset: 144)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !77, line: 86, size: 160, elements: !78)
!77 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "/home/jeremyguo/Desktop/tc-xdp-lab/src")
!78 = !{!79, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91}
!79 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !76, file: !77, line: 88, baseType: !80, size: 4, flags: DIFlagBitField, extraData: i64 0)
!80 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !53, line: 21, baseType: !81)
!81 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !76, file: !77, line: 89, baseType: !80, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !76, file: !77, line: 96, baseType: !80, size: 8, offset: 8)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !76, file: !77, line: 97, baseType: !50, size: 16, offset: 16)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !76, file: !77, line: 98, baseType: !50, size: 16, offset: 32)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !76, file: !77, line: 99, baseType: !50, size: 16, offset: 48)
!87 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !76, file: !77, line: 100, baseType: !80, size: 8, offset: 64)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !76, file: !77, line: 101, baseType: !80, size: 8, offset: 72)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !76, file: !77, line: 102, baseType: !73, size: 16, offset: 80)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !76, file: !77, line: 103, baseType: !57, size: 32, offset: 96)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !76, file: !77, line: 104, baseType: !57, size: 32, offset: 128)
!92 = !{!0, !93, !107, !113}
!93 = !DIGlobalVariableExpression(var: !94, expr: !DIExpression())
!94 = distinct !DIGlobalVariable(name: "ip_map", scope: !2, file: !3, line: 22, type: !95, isLocal: false, isDefinition: true)
!95 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_elf_map", file: !96, line: 32, size: 288, elements: !97)
!96 = !DIFile(filename: "/usr/include/iproute2/bpf_elf.h", directory: "/home/jeremyguo/Desktop/tc-xdp-lab/src")
!97 = !{!98, !99, !100, !101, !102, !103, !104, !105, !106}
!98 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !95, file: !96, line: 33, baseType: !58, size: 32)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "size_key", scope: !95, file: !96, line: 34, baseType: !58, size: 32, offset: 32)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "size_value", scope: !95, file: !96, line: 35, baseType: !58, size: 32, offset: 64)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "max_elem", scope: !95, file: !96, line: 36, baseType: !58, size: 32, offset: 96)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !95, file: !96, line: 37, baseType: !58, size: 32, offset: 128)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !95, file: !96, line: 38, baseType: !58, size: 32, offset: 160)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "pinning", scope: !95, file: !96, line: 39, baseType: !58, size: 32, offset: 192)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "inner_id", scope: !95, file: !96, line: 40, baseType: !58, size: 32, offset: 224)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "inner_idx", scope: !95, file: !96, line: 41, baseType: !58, size: 32, offset: 256)
!107 = !DIGlobalVariableExpression(var: !108, expr: !DIExpression())
!108 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !109, line: 12, type: !110, isLocal: true, isDefinition: true)
!109 = !DIFile(filename: "../headers/bpf_helpers.h", directory: "/home/jeremyguo/Desktop/tc-xdp-lab/src")
!110 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !111, size: 64)
!111 = !DISubroutineType(types: !112)
!112 = !{!43, !43, !43}
!113 = !DIGlobalVariableExpression(var: !114, expr: !DIExpression())
!114 = distinct !DIGlobalVariable(name: "bpf_map_update_elem", scope: !2, file: !109, line: 14, type: !115, isLocal: true, isDefinition: true)
!115 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !116, size: 64)
!116 = !DISubroutineType(types: !117)
!117 = !{!118, !43, !43, !43, !119}
!118 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!119 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!120 = !{i32 2, !"Dwarf Version", i32 4}
!121 = !{i32 2, !"Debug Info Version", i32 3}
!122 = !{i32 1, !"wchar_size", i32 4}
!123 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!124 = distinct !DISubprogram(name: "tc_egress", scope: !3, file: !3, line: 108, type: !125, isLocal: false, isDefinition: true, scopeLine: 108, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !216)
!125 = !DISubroutineType(types: !126)
!126 = !{!118, !127}
!127 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !128, size: 64)
!128 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sk_buff", file: !6, line: 2677, size: 1408, elements: !129)
!129 = !{!130, !131, !132, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !146, !147, !148, !149, !150, !151, !152, !153, !154, !158, !159, !160, !161, !162, !192, !194, !195, !196}
!130 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !128, file: !6, line: 2678, baseType: !58, size: 32)
!131 = !DIDerivedType(tag: DW_TAG_member, name: "pkt_type", scope: !128, file: !6, line: 2679, baseType: !58, size: 32, offset: 32)
!132 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !128, file: !6, line: 2680, baseType: !58, size: 32, offset: 64)
!133 = !DIDerivedType(tag: DW_TAG_member, name: "queue_mapping", scope: !128, file: !6, line: 2681, baseType: !58, size: 32, offset: 96)
!134 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !128, file: !6, line: 2682, baseType: !58, size: 32, offset: 128)
!135 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_present", scope: !128, file: !6, line: 2683, baseType: !58, size: 32, offset: 160)
!136 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_tci", scope: !128, file: !6, line: 2684, baseType: !58, size: 32, offset: 192)
!137 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_proto", scope: !128, file: !6, line: 2685, baseType: !58, size: 32, offset: 224)
!138 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !128, file: !6, line: 2686, baseType: !58, size: 32, offset: 256)
!139 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !128, file: !6, line: 2687, baseType: !58, size: 32, offset: 288)
!140 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !128, file: !6, line: 2688, baseType: !58, size: 32, offset: 320)
!141 = !DIDerivedType(tag: DW_TAG_member, name: "tc_index", scope: !128, file: !6, line: 2689, baseType: !58, size: 32, offset: 352)
!142 = !DIDerivedType(tag: DW_TAG_member, name: "cb", scope: !128, file: !6, line: 2690, baseType: !143, size: 160, offset: 384)
!143 = !DICompositeType(tag: DW_TAG_array_type, baseType: !58, size: 160, elements: !144)
!144 = !{!145}
!145 = !DISubrange(count: 5)
!146 = !DIDerivedType(tag: DW_TAG_member, name: "hash", scope: !128, file: !6, line: 2691, baseType: !58, size: 32, offset: 544)
!147 = !DIDerivedType(tag: DW_TAG_member, name: "tc_classid", scope: !128, file: !6, line: 2692, baseType: !58, size: 32, offset: 576)
!148 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !128, file: !6, line: 2693, baseType: !58, size: 32, offset: 608)
!149 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !128, file: !6, line: 2694, baseType: !58, size: 32, offset: 640)
!150 = !DIDerivedType(tag: DW_TAG_member, name: "napi_id", scope: !128, file: !6, line: 2695, baseType: !58, size: 32, offset: 672)
!151 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !128, file: !6, line: 2698, baseType: !58, size: 32, offset: 704)
!152 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip4", scope: !128, file: !6, line: 2699, baseType: !58, size: 32, offset: 736)
!153 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip4", scope: !128, file: !6, line: 2700, baseType: !58, size: 32, offset: 768)
!154 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip6", scope: !128, file: !6, line: 2701, baseType: !155, size: 128, offset: 800)
!155 = !DICompositeType(tag: DW_TAG_array_type, baseType: !58, size: 128, elements: !156)
!156 = !{!157}
!157 = !DISubrange(count: 4)
!158 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip6", scope: !128, file: !6, line: 2702, baseType: !155, size: 128, offset: 928)
!159 = !DIDerivedType(tag: DW_TAG_member, name: "remote_port", scope: !128, file: !6, line: 2703, baseType: !58, size: 32, offset: 1056)
!160 = !DIDerivedType(tag: DW_TAG_member, name: "local_port", scope: !128, file: !6, line: 2704, baseType: !58, size: 32, offset: 1088)
!161 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !128, file: !6, line: 2707, baseType: !58, size: 32, offset: 1120)
!162 = !DIDerivedType(tag: DW_TAG_member, scope: !128, file: !6, line: 2708, baseType: !163, size: 64, align: 64, offset: 1152)
!163 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !128, file: !6, line: 2708, size: 64, align: 64, elements: !164)
!164 = !{!165}
!165 = !DIDerivedType(tag: DW_TAG_member, name: "flow_keys", scope: !163, file: !6, line: 2708, baseType: !166, size: 64)
!166 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !167, size: 64)
!167 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_flow_keys", file: !6, line: 3237, size: 384, elements: !168)
!168 = !{!169, !170, !171, !172, !173, !174, !175, !176, !177, !178, !179}
!169 = !DIDerivedType(tag: DW_TAG_member, name: "nhoff", scope: !167, file: !6, line: 3238, baseType: !52, size: 16)
!170 = !DIDerivedType(tag: DW_TAG_member, name: "thoff", scope: !167, file: !6, line: 3239, baseType: !52, size: 16, offset: 16)
!171 = !DIDerivedType(tag: DW_TAG_member, name: "addr_proto", scope: !167, file: !6, line: 3240, baseType: !52, size: 16, offset: 32)
!172 = !DIDerivedType(tag: DW_TAG_member, name: "is_frag", scope: !167, file: !6, line: 3241, baseType: !80, size: 8, offset: 48)
!173 = !DIDerivedType(tag: DW_TAG_member, name: "is_first_frag", scope: !167, file: !6, line: 3242, baseType: !80, size: 8, offset: 56)
!174 = !DIDerivedType(tag: DW_TAG_member, name: "is_encap", scope: !167, file: !6, line: 3243, baseType: !80, size: 8, offset: 64)
!175 = !DIDerivedType(tag: DW_TAG_member, name: "ip_proto", scope: !167, file: !6, line: 3244, baseType: !80, size: 8, offset: 72)
!176 = !DIDerivedType(tag: DW_TAG_member, name: "n_proto", scope: !167, file: !6, line: 3245, baseType: !50, size: 16, offset: 80)
!177 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !167, file: !6, line: 3246, baseType: !50, size: 16, offset: 96)
!178 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !167, file: !6, line: 3247, baseType: !50, size: 16, offset: 112)
!179 = !DIDerivedType(tag: DW_TAG_member, scope: !167, file: !6, line: 3248, baseType: !180, size: 256, offset: 128)
!180 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !167, file: !6, line: 3248, size: 256, elements: !181)
!181 = !{!182, !187}
!182 = !DIDerivedType(tag: DW_TAG_member, scope: !180, file: !6, line: 3249, baseType: !183, size: 64)
!183 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !180, file: !6, line: 3249, size: 64, elements: !184)
!184 = !{!185, !186}
!185 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_src", scope: !183, file: !6, line: 3250, baseType: !57, size: 32)
!186 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_dst", scope: !183, file: !6, line: 3251, baseType: !57, size: 32, offset: 32)
!187 = !DIDerivedType(tag: DW_TAG_member, scope: !180, file: !6, line: 3253, baseType: !188, size: 256)
!188 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !180, file: !6, line: 3253, size: 256, elements: !189)
!189 = !{!190, !191}
!190 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_src", scope: !188, file: !6, line: 3254, baseType: !155, size: 128)
!191 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_dst", scope: !188, file: !6, line: 3255, baseType: !155, size: 128, offset: 128)
!192 = !DIDerivedType(tag: DW_TAG_member, name: "tstamp", scope: !128, file: !6, line: 2709, baseType: !193, size: 64, offset: 1216)
!193 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !53, line: 31, baseType: !119)
!194 = !DIDerivedType(tag: DW_TAG_member, name: "wire_len", scope: !128, file: !6, line: 2710, baseType: !58, size: 32, offset: 1280)
!195 = !DIDerivedType(tag: DW_TAG_member, name: "gso_segs", scope: !128, file: !6, line: 2711, baseType: !58, size: 32, offset: 1312)
!196 = !DIDerivedType(tag: DW_TAG_member, scope: !128, file: !6, line: 2712, baseType: !197, size: 64, align: 64, offset: 1344)
!197 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !128, file: !6, line: 2712, size: 64, align: 64, elements: !198)
!198 = !{!199}
!199 = !DIDerivedType(tag: DW_TAG_member, name: "sk", scope: !197, file: !6, line: 2712, baseType: !200, size: 64)
!200 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !201, size: 64)
!201 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_sock", file: !6, line: 2765, size: 608, elements: !202)
!202 = !{!203, !204, !205, !206, !207, !208, !209, !210, !211, !212, !213, !214, !215}
!203 = !DIDerivedType(tag: DW_TAG_member, name: "bound_dev_if", scope: !201, file: !6, line: 2766, baseType: !58, size: 32)
!204 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !201, file: !6, line: 2767, baseType: !58, size: 32, offset: 32)
!205 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !201, file: !6, line: 2768, baseType: !58, size: 32, offset: 64)
!206 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !201, file: !6, line: 2769, baseType: !58, size: 32, offset: 96)
!207 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !201, file: !6, line: 2770, baseType: !58, size: 32, offset: 128)
!208 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !201, file: !6, line: 2771, baseType: !58, size: 32, offset: 160)
!209 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip4", scope: !201, file: !6, line: 2773, baseType: !58, size: 32, offset: 192)
!210 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip6", scope: !201, file: !6, line: 2774, baseType: !155, size: 128, offset: 224)
!211 = !DIDerivedType(tag: DW_TAG_member, name: "src_port", scope: !201, file: !6, line: 2775, baseType: !58, size: 32, offset: 352)
!212 = !DIDerivedType(tag: DW_TAG_member, name: "dst_port", scope: !201, file: !6, line: 2776, baseType: !58, size: 32, offset: 384)
!213 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip4", scope: !201, file: !6, line: 2777, baseType: !58, size: 32, offset: 416)
!214 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip6", scope: !201, file: !6, line: 2778, baseType: !155, size: 128, offset: 448)
!215 = !DIDerivedType(tag: DW_TAG_member, name: "state", scope: !201, file: !6, line: 2779, baseType: !58, size: 32, offset: 576)
!216 = !{!217, !218, !219, !220, !231, !232, !233}
!217 = !DILocalVariable(name: "skb", arg: 1, scope: !124, file: !3, line: 108, type: !127)
!218 = !DILocalVariable(name: "data", scope: !124, file: !3, line: 109, type: !43)
!219 = !DILocalVariable(name: "data_end", scope: !124, file: !3, line: 110, type: !43)
!220 = !DILocalVariable(name: "eth", scope: !124, file: !3, line: 114, type: !221)
!221 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !222, size: 64)
!222 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !223, line: 159, size: 112, elements: !224)
!223 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "/home/jeremyguo/Desktop/tc-xdp-lab/src")
!224 = !{!225, !229, !230}
!225 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !222, file: !223, line: 160, baseType: !226, size: 48)
!226 = !DICompositeType(tag: DW_TAG_array_type, baseType: !81, size: 48, elements: !227)
!227 = !{!228}
!228 = !DISubrange(count: 6)
!229 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !222, file: !223, line: 161, baseType: !226, size: 48, offset: 48)
!230 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !222, file: !223, line: 162, baseType: !50, size: 16, offset: 96)
!231 = !DILocalVariable(name: "iph", scope: !124, file: !3, line: 115, type: !75)
!232 = !DILocalVariable(name: "tcph", scope: !124, file: !3, line: 116, type: !45)
!233 = !DILocalVariable(name: "old_counter", scope: !124, file: !3, line: 119, type: !118)
!234 = !DILocation(line: 108, column: 33, scope: !124)
!235 = !DILocation(line: 109, column: 37, scope: !124)
!236 = !{!237, !238, i64 76}
!237 = !{!"__sk_buff", !238, i64 0, !238, i64 4, !238, i64 8, !238, i64 12, !238, i64 16, !238, i64 20, !238, i64 24, !238, i64 28, !238, i64 32, !238, i64 36, !238, i64 40, !238, i64 44, !239, i64 48, !238, i64 68, !238, i64 72, !238, i64 76, !238, i64 80, !238, i64 84, !238, i64 88, !238, i64 92, !238, i64 96, !239, i64 100, !239, i64 116, !238, i64 132, !238, i64 136, !238, i64 140, !239, i64 144, !241, i64 152, !238, i64 160, !238, i64 164, !239, i64 168}
!238 = !{!"int", !239, i64 0}
!239 = !{!"omnipotent char", !240, i64 0}
!240 = !{!"Simple C/C++ TBAA"}
!241 = !{!"long long", !239, i64 0}
!242 = !DILocation(line: 109, column: 26, scope: !124)
!243 = !DILocation(line: 109, column: 18, scope: !124)
!244 = !DILocation(line: 109, column: 11, scope: !124)
!245 = !DILocation(line: 110, column: 41, scope: !124)
!246 = !{!237, !238, i64 80}
!247 = !DILocation(line: 110, column: 30, scope: !124)
!248 = !DILocation(line: 110, column: 22, scope: !124)
!249 = !DILocation(line: 110, column: 11, scope: !124)
!250 = !DILocalVariable(name: "data_begin", arg: 1, scope: !251, file: !3, line: 30, type: !43)
!251 = distinct !DISubprogram(name: "is_TCP", scope: !3, file: !3, line: 30, type: !252, isLocal: true, isDefinition: true, scopeLine: 30, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !254)
!252 = !DISubroutineType(types: !253)
!253 = !{!118, !43, !43}
!254 = !{!250, !255, !256, !257}
!255 = !DILocalVariable(name: "data_end", arg: 2, scope: !251, file: !3, line: 30, type: !43)
!256 = !DILocalVariable(name: "eth", scope: !251, file: !3, line: 31, type: !221)
!257 = !DILocalVariable(name: "iph", scope: !258, file: !3, line: 36, type: !75)
!258 = distinct !DILexicalBlock(scope: !259, file: !3, line: 35, column: 3)
!259 = distinct !DILexicalBlock(scope: !251, file: !3, line: 34, column: 7)
!260 = !DILocation(line: 30, column: 25, scope: !251, inlinedAt: !261)
!261 = distinct !DILocation(line: 112, column: 9, scope: !262)
!262 = distinct !DILexicalBlock(scope: !124, file: !3, line: 112, column: 8)
!263 = !DILocation(line: 30, column: 43, scope: !251, inlinedAt: !261)
!264 = !DILocation(line: 31, column: 18, scope: !251, inlinedAt: !261)
!265 = !DILocation(line: 32, column: 20, scope: !266, inlinedAt: !261)
!266 = distinct !DILexicalBlock(scope: !251, file: !3, line: 32, column: 7)
!267 = !DILocation(line: 32, column: 25, scope: !266, inlinedAt: !261)
!268 = !DILocation(line: 32, column: 7, scope: !251, inlinedAt: !261)
!269 = !DILocation(line: 34, column: 12, scope: !259, inlinedAt: !261)
!270 = !{!271, !272, i64 12}
!271 = !{!"ethhdr", !239, i64 0, !239, i64 6, !272, i64 12}
!272 = !{!"short", !239, i64 0}
!273 = !DILocation(line: 34, column: 20, scope: !259, inlinedAt: !261)
!274 = !DILocation(line: 37, column: 22, scope: !275, inlinedAt: !261)
!275 = distinct !DILexicalBlock(scope: !258, file: !3, line: 37, column: 9)
!276 = !DILocation(line: 37, column: 27, scope: !275, inlinedAt: !261)
!277 = !DILocation(line: 34, column: 7, scope: !251, inlinedAt: !261)
!278 = !DILocation(line: 36, column: 19, scope: !258, inlinedAt: !261)
!279 = !DILocation(line: 39, column: 14, scope: !280, inlinedAt: !261)
!280 = distinct !DILexicalBlock(scope: !258, file: !3, line: 39, column: 9)
!281 = !{!282, !239, i64 9}
!282 = !{!"iphdr", !239, i64 0, !239, i64 0, !239, i64 1, !272, i64 2, !272, i64 4, !272, i64 6, !239, i64 8, !239, i64 9, !272, i64 10, !238, i64 12, !238, i64 16}
!283 = !DILocation(line: 39, column: 23, scope: !280, inlinedAt: !261)
!284 = !DILocation(line: 114, column: 26, scope: !124)
!285 = !DILocation(line: 114, column: 20, scope: !124)
!286 = !DILocation(line: 115, column: 19, scope: !124)
!287 = !DILocation(line: 116, column: 20, scope: !124)
!288 = !DILocation(line: 117, column: 21, scope: !289)
!289 = distinct !DILexicalBlock(scope: !124, file: !3, line: 117, column: 8)
!290 = !DILocation(line: 117, column: 26, scope: !289)
!291 = !DILocation(line: 117, column: 8, scope: !124)
!292 = !DILocation(line: 119, column: 39, scope: !124)
!293 = !{!282, !238, i64 16}
!294 = !DILocation(line: 119, column: 52, scope: !124)
!295 = !{!296, !272, i64 0}
!296 = !{!"tcphdr", !272, i64 0, !272, i64 2, !238, i64 4, !238, i64 8, !272, i64 12, !272, i64 12, !272, i64 13, !272, i64 13, !272, i64 13, !272, i64 13, !272, i64 13, !272, i64 13, !272, i64 13, !272, i64 13, !272, i64 14, !272, i64 16, !272, i64 18}
!297 = !DILocalVariable(name: "ip_addr", arg: 1, scope: !298, file: !3, line: 48, type: !301)
!298 = distinct !DISubprogram(name: "getHashOld", scope: !3, file: !3, line: 48, type: !299, isLocal: true, isDefinition: true, scopeLine: 48, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !307)
!299 = !DISubroutineType(types: !300)
!300 = !{!118, !301, !305}
!301 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !302, line: 26, baseType: !303)
!302 = !DIFile(filename: "/usr/include/bits/stdint-uintn.h", directory: "/home/jeremyguo/Desktop/tc-xdp-lab/src")
!303 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !304, line: 41, baseType: !59)
!304 = !DIFile(filename: "/usr/include/bits/types.h", directory: "/home/jeremyguo/Desktop/tc-xdp-lab/src")
!305 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !302, line: 25, baseType: !306)
!306 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !304, line: 39, baseType: !54)
!307 = !{!297, !308, !309, !316, !321}
!308 = !DILocalVariable(name: "port", arg: 2, scope: !298, file: !3, line: 48, type: !305)
!309 = !DILocalVariable(name: "key", scope: !298, file: !3, line: 49, type: !310)
!310 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ip_key", file: !311, line: 31, size: 64, elements: !312)
!311 = !DIFile(filename: "./prog.h", directory: "/home/jeremyguo/Desktop/tc-xdp-lab/src")
!312 = !{!313, !315}
!313 = !DIDerivedType(tag: DW_TAG_member, name: "ip", scope: !310, file: !311, line: 32, baseType: !314, size: 32)
!314 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !311, line: 12, baseType: !59)
!315 = !DIDerivedType(tag: DW_TAG_member, name: "port", scope: !310, file: !311, line: 33, baseType: !314, size: 32, offset: 32)
!316 = !DILocalVariable(name: "val", scope: !298, file: !3, line: 53, type: !317)
!317 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !318, size: 64)
!318 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hash_elem", file: !311, line: 27, size: 32, elements: !319)
!319 = !{!320}
!320 = !DIDerivedType(tag: DW_TAG_member, name: "counter", scope: !318, file: !311, line: 28, baseType: !314, size: 32)
!321 = !DILocalVariable(name: "ret", scope: !298, file: !3, line: 54, type: !118)
!322 = !DILocation(line: 48, column: 32, scope: !298, inlinedAt: !323)
!323 = distinct !DILocation(line: 119, column: 23, scope: !124)
!324 = !DILocation(line: 48, column: 50, scope: !298, inlinedAt: !323)
!325 = !DILocation(line: 49, column: 5, scope: !298, inlinedAt: !323)
!326 = !DILocation(line: 49, column: 25, scope: !298, inlinedAt: !323)
!327 = !{!328, !238, i64 0}
!328 = !{!"ip_key", !238, i64 0, !238, i64 4}
!329 = !DILocation(line: 51, column: 17, scope: !298, inlinedAt: !323)
!330 = !{!328, !238, i64 4}
!331 = !DILocation(line: 53, column: 29, scope: !298, inlinedAt: !323)
!332 = !DILocation(line: 53, column: 23, scope: !298, inlinedAt: !323)
!333 = !DILocation(line: 54, column: 9, scope: !298, inlinedAt: !323)
!334 = !DILocation(line: 55, column: 9, scope: !335, inlinedAt: !323)
!335 = distinct !DILexicalBlock(scope: !298, file: !3, line: 55, column: 8)
!336 = !DILocation(line: 55, column: 8, scope: !298, inlinedAt: !323)
!337 = !DILocation(line: 56, column: 16, scope: !298, inlinedAt: !323)
!338 = !{!339, !238, i64 0}
!339 = !{!"hash_elem", !238, i64 0}
!340 = !DILocation(line: 57, column: 12, scope: !341, inlinedAt: !323)
!341 = distinct !DILexicalBlock(scope: !298, file: !3, line: 57, column: 8)
!342 = !DILocation(line: 57, column: 8, scope: !298, inlinedAt: !323)
!343 = !DILocation(line: 59, column: 1, scope: !298, inlinedAt: !323)
!344 = !DILocation(line: 119, column: 9, scope: !124)
!345 = !DILocation(line: 120, column: 8, scope: !124)
!346 = !DILocation(line: 57, column: 31, scope: !341, inlinedAt: !323)
!347 = !DILocation(line: 122, column: 20, scope: !124)
!348 = !DILocation(line: 122, column: 33, scope: !124)
!349 = !DILocalVariable(name: "ip_addr", arg: 1, scope: !350, file: !3, line: 93, type: !301)
!350 = distinct !DISubprogram(name: "restoreIP", scope: !3, file: !3, line: 93, type: !351, isLocal: true, isDefinition: true, scopeLine: 93, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !354)
!351 = !DISubroutineType(types: !352)
!352 = !{null, !301, !305, !301, !353}
!353 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!354 = !{!349, !355, !356, !357, !358, !363}
!355 = !DILocalVariable(name: "port", arg: 2, scope: !350, file: !3, line: 93, type: !305)
!356 = !DILocalVariable(name: "counter", arg: 3, scope: !350, file: !3, line: 93, type: !301)
!357 = !DILocalVariable(name: "store_pos", arg: 4, scope: !350, file: !3, line: 93, type: !353)
!358 = !DILocalVariable(name: "key", scope: !350, file: !3, line: 94, type: !359)
!359 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "flow_key", file: !311, line: 36, size: 96, elements: !360)
!360 = !{!361, !362}
!361 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !359, file: !311, line: 37, baseType: !310, size: 64)
!362 = !DIDerivedType(tag: DW_TAG_member, name: "idx", scope: !359, file: !311, line: 38, baseType: !118, size: 32, offset: 64)
!363 = !DILocalVariable(name: "data", scope: !350, file: !3, line: 98, type: !364)
!364 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !365, size: 64)
!365 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "data_elem", file: !311, line: 23, size: 48, elements: !366)
!366 = !{!367}
!367 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !365, file: !311, line: 24, baseType: !226, size: 48)
!368 = !DILocation(line: 93, column: 32, scope: !350, inlinedAt: !369)
!369 = distinct !DILocation(line: 122, column: 5, scope: !124)
!370 = !DILocation(line: 93, column: 50, scope: !350, inlinedAt: !369)
!371 = !DILocation(line: 93, column: 65, scope: !350, inlinedAt: !369)
!372 = !DILocation(line: 93, column: 89, scope: !350, inlinedAt: !369)
!373 = !DILocation(line: 94, column: 5, scope: !350, inlinedAt: !369)
!374 = !DILocation(line: 95, column: 16, scope: !350, inlinedAt: !369)
!375 = !DILocation(line: 95, column: 26, scope: !350, inlinedAt: !369)
!376 = !DILocation(line: 94, column: 27, scope: !350, inlinedAt: !369)
!377 = !{!378, !238, i64 8}
!378 = !{!"flow_key", !328, i64 0, !238, i64 8}
!379 = !DILocation(line: 98, column: 30, scope: !350, inlinedAt: !369)
!380 = !DILocation(line: 98, column: 23, scope: !350, inlinedAt: !369)
!381 = !DILocation(line: 99, column: 9, scope: !382, inlinedAt: !369)
!382 = distinct !DILexicalBlock(scope: !350, file: !3, line: 99, column: 8)
!383 = !DILocation(line: 99, column: 8, scope: !350, inlinedAt: !369)
!384 = !DILocation(line: 122, column: 54, scope: !124)
!385 = !DILocation(line: 100, column: 20, scope: !350, inlinedAt: !369)
!386 = !{!239, !239, i64 0}
!387 = !DILocation(line: 100, column: 18, scope: !350, inlinedAt: !369)
!388 = !DILocation(line: 101, column: 20, scope: !350, inlinedAt: !369)
!389 = !DILocation(line: 101, column: 5, scope: !350, inlinedAt: !369)
!390 = !DILocation(line: 101, column: 18, scope: !350, inlinedAt: !369)
!391 = !DILocation(line: 102, column: 20, scope: !350, inlinedAt: !369)
!392 = !DILocation(line: 102, column: 5, scope: !350, inlinedAt: !369)
!393 = !DILocation(line: 102, column: 18, scope: !350, inlinedAt: !369)
!394 = !DILocation(line: 103, column: 20, scope: !350, inlinedAt: !369)
!395 = !DILocation(line: 103, column: 5, scope: !350, inlinedAt: !369)
!396 = !DILocation(line: 103, column: 18, scope: !350, inlinedAt: !369)
!397 = !DILocation(line: 104, column: 20, scope: !350, inlinedAt: !369)
!398 = !DILocation(line: 104, column: 5, scope: !350, inlinedAt: !369)
!399 = !DILocation(line: 104, column: 18, scope: !350, inlinedAt: !369)
!400 = !DILocation(line: 105, column: 20, scope: !350, inlinedAt: !369)
!401 = !DILocation(line: 105, column: 5, scope: !350, inlinedAt: !369)
!402 = !DILocation(line: 105, column: 18, scope: !350, inlinedAt: !369)
!403 = !DILocation(line: 106, column: 1, scope: !350, inlinedAt: !369)
!404 = !DILocation(line: 123, column: 5, scope: !124)
!405 = !DILocation(line: 124, column: 1, scope: !124)
!406 = distinct !DISubprogram(name: "xdp_ingress", scope: !3, file: !3, line: 126, type: !407, isLocal: false, isDefinition: true, scopeLine: 126, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !417)
!407 = !DISubroutineType(types: !408)
!408 = !{!118, !409}
!409 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !410, size: 64)
!410 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 2856, size: 160, elements: !411)
!411 = !{!412, !413, !414, !415, !416}
!412 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !410, file: !6, line: 2857, baseType: !58, size: 32)
!413 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !410, file: !6, line: 2858, baseType: !58, size: 32, offset: 32)
!414 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !410, file: !6, line: 2859, baseType: !58, size: 32, offset: 64)
!415 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !410, file: !6, line: 2861, baseType: !58, size: 32, offset: 96)
!416 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !410, file: !6, line: 2862, baseType: !58, size: 32, offset: 128)
!417 = !{!418, !419, !420, !421, !422, !423, !424}
!418 = !DILocalVariable(name: "ctx", arg: 1, scope: !406, file: !3, line: 126, type: !409)
!419 = !DILocalVariable(name: "data", scope: !406, file: !3, line: 127, type: !43)
!420 = !DILocalVariable(name: "data_end", scope: !406, file: !3, line: 128, type: !43)
!421 = !DILocalVariable(name: "eth", scope: !406, file: !3, line: 131, type: !221)
!422 = !DILocalVariable(name: "iph", scope: !406, file: !3, line: 132, type: !75)
!423 = !DILocalVariable(name: "tcph", scope: !406, file: !3, line: 133, type: !45)
!424 = !DILocalVariable(name: "new_counter", scope: !406, file: !3, line: 136, type: !118)
!425 = !DILocation(line: 126, column: 32, scope: !406)
!426 = !DILocation(line: 127, column: 37, scope: !406)
!427 = !{!428, !238, i64 0}
!428 = !{!"xdp_md", !238, i64 0, !238, i64 4, !238, i64 8, !238, i64 12, !238, i64 16}
!429 = !DILocation(line: 127, column: 26, scope: !406)
!430 = !DILocation(line: 127, column: 18, scope: !406)
!431 = !DILocation(line: 127, column: 11, scope: !406)
!432 = !DILocation(line: 128, column: 40, scope: !406)
!433 = !{!428, !238, i64 4}
!434 = !DILocation(line: 128, column: 29, scope: !406)
!435 = !DILocation(line: 128, column: 22, scope: !406)
!436 = !DILocation(line: 128, column: 11, scope: !406)
!437 = !DILocation(line: 30, column: 25, scope: !251, inlinedAt: !438)
!438 = distinct !DILocation(line: 129, column: 9, scope: !439)
!439 = distinct !DILexicalBlock(scope: !406, file: !3, line: 129, column: 8)
!440 = !DILocation(line: 30, column: 43, scope: !251, inlinedAt: !438)
!441 = !DILocation(line: 31, column: 18, scope: !251, inlinedAt: !438)
!442 = !DILocation(line: 32, column: 20, scope: !266, inlinedAt: !438)
!443 = !DILocation(line: 32, column: 25, scope: !266, inlinedAt: !438)
!444 = !DILocation(line: 32, column: 7, scope: !251, inlinedAt: !438)
!445 = !DILocation(line: 34, column: 12, scope: !259, inlinedAt: !438)
!446 = !DILocation(line: 34, column: 20, scope: !259, inlinedAt: !438)
!447 = !DILocation(line: 37, column: 22, scope: !275, inlinedAt: !438)
!448 = !DILocation(line: 37, column: 27, scope: !275, inlinedAt: !438)
!449 = !DILocation(line: 34, column: 7, scope: !251, inlinedAt: !438)
!450 = !DILocation(line: 36, column: 19, scope: !258, inlinedAt: !438)
!451 = !DILocation(line: 39, column: 14, scope: !280, inlinedAt: !438)
!452 = !DILocation(line: 39, column: 23, scope: !280, inlinedAt: !438)
!453 = !DILocation(line: 131, column: 26, scope: !406)
!454 = !DILocation(line: 131, column: 20, scope: !406)
!455 = !DILocation(line: 132, column: 19, scope: !406)
!456 = !DILocation(line: 133, column: 20, scope: !406)
!457 = !DILocation(line: 134, column: 21, scope: !458)
!458 = distinct !DILexicalBlock(scope: !406, file: !3, line: 134, column: 8)
!459 = !DILocation(line: 134, column: 26, scope: !458)
!460 = !DILocation(line: 134, column: 8, scope: !406)
!461 = !DILocation(line: 136, column: 39, scope: !406)
!462 = !{!282, !238, i64 12}
!463 = !DILocation(line: 136, column: 52, scope: !406)
!464 = !{!296, !272, i64 2}
!465 = !DILocalVariable(name: "ip_addr", arg: 1, scope: !466, file: !3, line: 64, type: !301)
!466 = distinct !DISubprogram(name: "getHashNew", scope: !3, file: !3, line: 64, type: !299, isLocal: true, isDefinition: true, scopeLine: 64, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !467)
!467 = !{!465, !468, !469, !470, !471}
!468 = !DILocalVariable(name: "port", arg: 2, scope: !466, file: !3, line: 64, type: !305)
!469 = !DILocalVariable(name: "key", scope: !466, file: !3, line: 65, type: !310)
!470 = !DILocalVariable(name: "val", scope: !466, file: !3, line: 69, type: !317)
!471 = !DILocalVariable(name: "emp", scope: !472, file: !3, line: 71, type: !318)
!472 = distinct !DILexicalBlock(scope: !473, file: !3, line: 70, column: 14)
!473 = distinct !DILexicalBlock(scope: !466, file: !3, line: 70, column: 8)
!474 = !DILocation(line: 64, column: 32, scope: !466, inlinedAt: !475)
!475 = distinct !DILocation(line: 136, column: 23, scope: !406)
!476 = !DILocation(line: 64, column: 50, scope: !466, inlinedAt: !475)
!477 = !DILocation(line: 65, column: 5, scope: !466, inlinedAt: !475)
!478 = !DILocation(line: 65, column: 25, scope: !466, inlinedAt: !475)
!479 = !DILocation(line: 67, column: 17, scope: !466, inlinedAt: !475)
!480 = !DILocation(line: 69, column: 29, scope: !466, inlinedAt: !475)
!481 = !DILocation(line: 69, column: 23, scope: !466, inlinedAt: !475)
!482 = !DILocation(line: 70, column: 9, scope: !473, inlinedAt: !475)
!483 = !DILocation(line: 70, column: 8, scope: !466, inlinedAt: !475)
!484 = !DILocation(line: 71, column: 9, scope: !472, inlinedAt: !475)
!485 = !DILocation(line: 72, column: 13, scope: !472, inlinedAt: !475)
!486 = !DILocation(line: 72, column: 21, scope: !472, inlinedAt: !475)
!487 = !DILocation(line: 73, column: 12, scope: !488, inlinedAt: !475)
!488 = distinct !DILexicalBlock(scope: !472, file: !3, line: 73, column: 12)
!489 = !DILocation(line: 74, column: 13, scope: !488, inlinedAt: !475)
!490 = !DILocation(line: 76, column: 5, scope: !473, inlinedAt: !475)
!491 = !DILocation(line: 77, column: 20, scope: !466, inlinedAt: !475)
!492 = !DILocation(line: 77, column: 12, scope: !466, inlinedAt: !475)
!493 = !DILocation(line: 77, column: 5, scope: !466, inlinedAt: !475)
!494 = !DILocation(line: 78, column: 1, scope: !466, inlinedAt: !475)
!495 = !DILocation(line: 136, column: 9, scope: !406)
!496 = !DILocation(line: 137, column: 20, scope: !497)
!497 = distinct !DILexicalBlock(scope: !406, file: !3, line: 137, column: 8)
!498 = !DILocation(line: 137, column: 8, scope: !406)
!499 = !DILocation(line: 139, column: 18, scope: !406)
!500 = !DILocation(line: 139, column: 31, scope: !406)
!501 = !DILocalVariable(name: "ip_addr", arg: 1, scope: !502, file: !3, line: 79, type: !301)
!502 = distinct !DISubprogram(name: "storeIP", scope: !3, file: !3, line: 79, type: !351, isLocal: true, isDefinition: true, scopeLine: 79, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !503)
!503 = !{!501, !504, !505, !506, !507, !508}
!504 = !DILocalVariable(name: "port", arg: 2, scope: !502, file: !3, line: 79, type: !305)
!505 = !DILocalVariable(name: "counter", arg: 3, scope: !502, file: !3, line: 79, type: !301)
!506 = !DILocalVariable(name: "store_res", arg: 4, scope: !502, file: !3, line: 79, type: !353)
!507 = !DILocalVariable(name: "key", scope: !502, file: !3, line: 80, type: !359)
!508 = !DILocalVariable(name: "data", scope: !502, file: !3, line: 84, type: !364)
!509 = !DILocation(line: 79, column: 30, scope: !502, inlinedAt: !510)
!510 = distinct !DILocation(line: 139, column: 5, scope: !406)
!511 = !DILocation(line: 79, column: 48, scope: !502, inlinedAt: !510)
!512 = !DILocation(line: 79, column: 63, scope: !502, inlinedAt: !510)
!513 = !DILocation(line: 79, column: 87, scope: !502, inlinedAt: !510)
!514 = !DILocation(line: 80, column: 5, scope: !502, inlinedAt: !510)
!515 = !DILocation(line: 81, column: 16, scope: !502, inlinedAt: !510)
!516 = !DILocation(line: 81, column: 26, scope: !502, inlinedAt: !510)
!517 = !DILocation(line: 80, column: 27, scope: !502, inlinedAt: !510)
!518 = !DILocation(line: 84, column: 30, scope: !502, inlinedAt: !510)
!519 = !DILocation(line: 84, column: 23, scope: !502, inlinedAt: !510)
!520 = !DILocation(line: 85, column: 9, scope: !521, inlinedAt: !510)
!521 = distinct !DILexicalBlock(scope: !502, file: !3, line: 85, column: 8)
!522 = !DILocation(line: 85, column: 8, scope: !502, inlinedAt: !510)
!523 = !DILocation(line: 139, column: 50, scope: !406)
!524 = !DILocation(line: 86, column: 21, scope: !502, inlinedAt: !510)
!525 = !DILocation(line: 86, column: 19, scope: !502, inlinedAt: !510)
!526 = !DILocation(line: 87, column: 21, scope: !502, inlinedAt: !510)
!527 = !DILocation(line: 87, column: 5, scope: !502, inlinedAt: !510)
!528 = !DILocation(line: 87, column: 19, scope: !502, inlinedAt: !510)
!529 = !DILocation(line: 88, column: 21, scope: !502, inlinedAt: !510)
!530 = !DILocation(line: 88, column: 5, scope: !502, inlinedAt: !510)
!531 = !DILocation(line: 88, column: 19, scope: !502, inlinedAt: !510)
!532 = !DILocation(line: 89, column: 21, scope: !502, inlinedAt: !510)
!533 = !DILocation(line: 89, column: 5, scope: !502, inlinedAt: !510)
!534 = !DILocation(line: 89, column: 19, scope: !502, inlinedAt: !510)
!535 = !DILocation(line: 90, column: 21, scope: !502, inlinedAt: !510)
!536 = !DILocation(line: 90, column: 5, scope: !502, inlinedAt: !510)
!537 = !DILocation(line: 90, column: 19, scope: !502, inlinedAt: !510)
!538 = !DILocation(line: 91, column: 21, scope: !502, inlinedAt: !510)
!539 = !DILocation(line: 91, column: 5, scope: !502, inlinedAt: !510)
!540 = !DILocation(line: 91, column: 19, scope: !502, inlinedAt: !510)
!541 = !DILocation(line: 92, column: 1, scope: !502, inlinedAt: !510)
!542 = !DILocation(line: 140, column: 5, scope: !406)
!543 = !DILocation(line: 141, column: 1, scope: !406)
