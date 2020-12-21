; ModuleID = 'prog_xdp.c'
source_filename = "prog_xdp.c"
target datalayout = "e-m:e-p:64:64-i64:64-n32:64-S128"
target triple = "bpf"

%struct.bpf_elf_map = type { i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.xdp_md = type { i32, i32, i32, i32, i32 }
%struct.ip_key = type { i32, i16 }
%struct.hash_elem = type { i32 }

@acc_map = global %struct.bpf_elf_map { i32 9, i32 8, i32 6, i32 32768, i32 0, i32 0, i32 2, i32 0, i32 0 }, section "maps", align 4, !dbg !0
@ip_map = global %struct.bpf_elf_map { i32 9, i32 12, i32 4, i32 256, i32 0, i32 0, i32 2, i32 0, i32 0 }, section "maps", align 4, !dbg !93
@llvm.used = appending global [3 x i8*] [i8* bitcast (%struct.bpf_elf_map* @acc_map to i8*), i8* bitcast (%struct.bpf_elf_map* @ip_map to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_ingress to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define i32 @xdp_ingress(%struct.xdp_md* nocapture readonly) #0 section "xdp_ing" !dbg !124 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.ip_key, align 4
  %4 = alloca %struct.hash_elem, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !136, metadata !DIExpression()), !dbg !153
  %5 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !154
  %6 = load i32, i32* %5, align 4, !dbg !154, !tbaa !155
  %7 = zext i32 %6 to i64, !dbg !160
  %8 = inttoptr i64 %7 to i8*, !dbg !161
  call void @llvm.dbg.value(metadata i8* %8, metadata !137, metadata !DIExpression()), !dbg !162
  %9 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !163
  %10 = load i32, i32* %9, align 4, !dbg !163, !tbaa !164
  %11 = zext i32 %10 to i64, !dbg !165
  %12 = inttoptr i64 %11 to i8*, !dbg !166
  call void @llvm.dbg.value(metadata i8* %12, metadata !138, metadata !DIExpression()), !dbg !167
  call void @llvm.dbg.value(metadata i8* %8, metadata !168, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.value(metadata i8* %12, metadata !173, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.value(metadata i8* %8, metadata !174, metadata !DIExpression()), !dbg !182
  %13 = getelementptr inbounds i8, i8* %8, i64 14, !dbg !183
  %14 = icmp ugt i8* %13, %12, !dbg !185
  br i1 %14, label %52, label %15, !dbg !186

; <label>:15:                                     ; preds = %1
  %16 = getelementptr inbounds i8, i8* %8, i64 12, !dbg !187
  %17 = bitcast i8* %16 to i16*, !dbg !187
  %18 = load i16, i16* %17, align 1, !dbg !187, !tbaa !188
  %19 = icmp ne i16 %18, 8, !dbg !191
  %20 = getelementptr inbounds i8, i8* %8, i64 34, !dbg !192
  %21 = icmp ugt i8* %20, %12, !dbg !194
  %22 = or i1 %21, %19, !dbg !195
  call void @llvm.dbg.value(metadata i8* %13, metadata !175, metadata !DIExpression()), !dbg !196
  br i1 %22, label %52, label %23, !dbg !195

; <label>:23:                                     ; preds = %15
  %24 = getelementptr inbounds i8, i8* %8, i64 23, !dbg !197
  %25 = load i8, i8* %24, align 1, !dbg !197, !tbaa !199
  %26 = icmp ne i8 %25, 6, !dbg !201
  %27 = getelementptr inbounds i8, i8* %8, i64 54, !dbg !202
  %28 = icmp ugt i8* %27, %12, !dbg !204
  %29 = or i1 %28, %26
  call void @llvm.dbg.value(metadata i8* %8, metadata !150, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)), !dbg !205
  call void @llvm.dbg.value(metadata i8* %8, metadata !151, metadata !DIExpression(DW_OP_plus_uconst, 34, DW_OP_stack_value)), !dbg !206
  br i1 %29, label %52, label %30

; <label>:30:                                     ; preds = %23
  %31 = getelementptr inbounds i8, i8* %8, i64 26, !dbg !207
  %32 = bitcast i8* %31 to i32*, !dbg !207
  %33 = load i32, i32* %32, align 4, !dbg !207, !tbaa !208
  %34 = getelementptr inbounds i8, i8* %8, i64 36, !dbg !209
  %35 = bitcast i8* %34 to i16*, !dbg !209
  %36 = load i16, i16* %35, align 2, !dbg !209, !tbaa !210
  %37 = bitcast i32* %2 to i8*, !dbg !212
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %37), !dbg !212
  call void @llvm.dbg.value(metadata i32 %33, metadata !220, metadata !DIExpression()) #3, !dbg !212
  store i32 %33, i32* %2, align 4, !tbaa !237
  call void @llvm.dbg.value(metadata i16 %36, metadata !221, metadata !DIExpression()) #3, !dbg !238
  %38 = bitcast %struct.ip_key* %3 to i8*, !dbg !239
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %38) #3, !dbg !239
  %39 = getelementptr inbounds %struct.ip_key, %struct.ip_key* %3, i64 0, i32 0, !dbg !240
  call void @llvm.dbg.value(metadata i32 %33, metadata !220, metadata !DIExpression()) #3, !dbg !212
  store i32 %33, i32* %39, align 4, !dbg !240, !tbaa !241
  %40 = getelementptr inbounds %struct.ip_key, %struct.ip_key* %3, i64 0, i32 1, !dbg !240
  store i16 %36, i16* %40, align 4, !dbg !240, !tbaa !243
  %41 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_elf_map* @ip_map to i8*), i8* nonnull %38) #3, !dbg !244
  call void @llvm.dbg.value(metadata i8* %41, metadata !227, metadata !DIExpression()) #3, !dbg !245
  %42 = icmp eq i8* %41, null, !dbg !246
  br i1 %42, label %43, label %47, !dbg !247

; <label>:43:                                     ; preds = %30
  %44 = bitcast %struct.hash_elem* %4 to i8*, !dbg !248
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %44) #3, !dbg !248
  %45 = getelementptr inbounds %struct.hash_elem, %struct.hash_elem* %4, i64 0, i32 0, !dbg !249
  store i32 0, i32* %45, align 4, !dbg !250, !tbaa !251
  %46 = call i32 inttoptr (i64 2 to i32 (i8*, i8*, i8*, i64)*)(i8* bitcast (%struct.bpf_elf_map* @ip_map to i8*), i8* nonnull %37, i8* nonnull %44, i64 0) #3, !dbg !253
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %44) #3, !dbg !255
  br label %51

; <label>:47:                                     ; preds = %30
  %48 = bitcast i8* %41 to i32*, !dbg !256
  %49 = load i32, i32* %48, align 4, !dbg !257, !tbaa !251
  %50 = add i32 %49, 1, !dbg !257
  store i32 %50, i32* %48, align 4, !dbg !257, !tbaa !251
  call void @llvm.dbg.value(metadata i32 %50, metadata !235, metadata !DIExpression()) #3, !dbg !258
  br label %51

; <label>:51:                                     ; preds = %43, %47
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %38) #3, !dbg !259
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %37), !dbg !259
  br label %52

; <label>:52:                                     ; preds = %23, %15, %1, %51
  ret i32 2, !dbg !260
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

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
!1 = distinct !DIGlobalVariable(name: "acc_map", scope: !2, file: !3, line: 3, type: !95, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !42, globals: !92)
!3 = !DIFile(filename: "prog_xdp.c", directory: "/home/jeremyguo/Desktop/tc-xdp-lab/src")
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
!94 = distinct !DIGlobalVariable(name: "ip_map", scope: !2, file: !3, line: 11, type: !95, isLocal: false, isDefinition: true)
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
!124 = distinct !DISubprogram(name: "xdp_ingress", scope: !3, file: !3, line: 101, type: !125, isLocal: false, isDefinition: true, scopeLine: 101, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !135)
!125 = !DISubroutineType(types: !126)
!126 = !{!118, !127}
!127 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !128, size: 64)
!128 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 2856, size: 160, elements: !129)
!129 = !{!130, !131, !132, !133, !134}
!130 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !128, file: !6, line: 2857, baseType: !58, size: 32)
!131 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !128, file: !6, line: 2858, baseType: !58, size: 32, offset: 32)
!132 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !128, file: !6, line: 2859, baseType: !58, size: 32, offset: 64)
!133 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !128, file: !6, line: 2861, baseType: !58, size: 32, offset: 96)
!134 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !128, file: !6, line: 2862, baseType: !58, size: 32, offset: 128)
!135 = !{!136, !137, !138, !139, !150, !151, !152}
!136 = !DILocalVariable(name: "ctx", arg: 1, scope: !124, file: !3, line: 101, type: !127)
!137 = !DILocalVariable(name: "data", scope: !124, file: !3, line: 102, type: !43)
!138 = !DILocalVariable(name: "data_end", scope: !124, file: !3, line: 103, type: !43)
!139 = !DILocalVariable(name: "eth", scope: !124, file: !3, line: 106, type: !140)
!140 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !141, size: 64)
!141 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !142, line: 159, size: 112, elements: !143)
!142 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "/home/jeremyguo/Desktop/tc-xdp-lab/src")
!143 = !{!144, !148, !149}
!144 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !141, file: !142, line: 160, baseType: !145, size: 48)
!145 = !DICompositeType(tag: DW_TAG_array_type, baseType: !81, size: 48, elements: !146)
!146 = !{!147}
!147 = !DISubrange(count: 6)
!148 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !141, file: !142, line: 161, baseType: !145, size: 48, offset: 48)
!149 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !141, file: !142, line: 162, baseType: !50, size: 16, offset: 96)
!150 = !DILocalVariable(name: "iph", scope: !124, file: !3, line: 107, type: !75)
!151 = !DILocalVariable(name: "tcph", scope: !124, file: !3, line: 108, type: !45)
!152 = !DILocalVariable(name: "new_counter", scope: !124, file: !3, line: 111, type: !118)
!153 = !DILocation(line: 101, column: 32, scope: !124)
!154 = !DILocation(line: 102, column: 37, scope: !124)
!155 = !{!156, !157, i64 0}
!156 = !{!"xdp_md", !157, i64 0, !157, i64 4, !157, i64 8, !157, i64 12, !157, i64 16}
!157 = !{!"int", !158, i64 0}
!158 = !{!"omnipotent char", !159, i64 0}
!159 = !{!"Simple C/C++ TBAA"}
!160 = !DILocation(line: 102, column: 26, scope: !124)
!161 = !DILocation(line: 102, column: 18, scope: !124)
!162 = !DILocation(line: 102, column: 11, scope: !124)
!163 = !DILocation(line: 103, column: 40, scope: !124)
!164 = !{!156, !157, i64 4}
!165 = !DILocation(line: 103, column: 29, scope: !124)
!166 = !DILocation(line: 103, column: 22, scope: !124)
!167 = !DILocation(line: 103, column: 11, scope: !124)
!168 = !DILocalVariable(name: "data_begin", arg: 1, scope: !169, file: !3, line: 19, type: !43)
!169 = distinct !DISubprogram(name: "is_TCP", scope: !3, file: !3, line: 19, type: !170, isLocal: false, isDefinition: true, scopeLine: 19, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !172)
!170 = !DISubroutineType(types: !171)
!171 = !{!118, !43, !43}
!172 = !{!168, !173, !174, !175}
!173 = !DILocalVariable(name: "data_end", arg: 2, scope: !169, file: !3, line: 19, type: !43)
!174 = !DILocalVariable(name: "eth", scope: !169, file: !3, line: 20, type: !140)
!175 = !DILocalVariable(name: "iph", scope: !176, file: !3, line: 25, type: !75)
!176 = distinct !DILexicalBlock(scope: !177, file: !3, line: 24, column: 3)
!177 = distinct !DILexicalBlock(scope: !169, file: !3, line: 23, column: 7)
!178 = !DILocation(line: 19, column: 25, scope: !169, inlinedAt: !179)
!179 = distinct !DILocation(line: 104, column: 9, scope: !180)
!180 = distinct !DILexicalBlock(scope: !124, file: !3, line: 104, column: 8)
!181 = !DILocation(line: 19, column: 43, scope: !169, inlinedAt: !179)
!182 = !DILocation(line: 20, column: 18, scope: !169, inlinedAt: !179)
!183 = !DILocation(line: 21, column: 20, scope: !184, inlinedAt: !179)
!184 = distinct !DILexicalBlock(scope: !169, file: !3, line: 21, column: 7)
!185 = !DILocation(line: 21, column: 25, scope: !184, inlinedAt: !179)
!186 = !DILocation(line: 21, column: 7, scope: !169, inlinedAt: !179)
!187 = !DILocation(line: 23, column: 12, scope: !177, inlinedAt: !179)
!188 = !{!189, !190, i64 12}
!189 = !{!"ethhdr", !158, i64 0, !158, i64 6, !190, i64 12}
!190 = !{!"short", !158, i64 0}
!191 = !DILocation(line: 23, column: 20, scope: !177, inlinedAt: !179)
!192 = !DILocation(line: 26, column: 22, scope: !193, inlinedAt: !179)
!193 = distinct !DILexicalBlock(scope: !176, file: !3, line: 26, column: 9)
!194 = !DILocation(line: 26, column: 27, scope: !193, inlinedAt: !179)
!195 = !DILocation(line: 23, column: 7, scope: !169, inlinedAt: !179)
!196 = !DILocation(line: 25, column: 19, scope: !176, inlinedAt: !179)
!197 = !DILocation(line: 28, column: 14, scope: !198, inlinedAt: !179)
!198 = distinct !DILexicalBlock(scope: !176, file: !3, line: 28, column: 9)
!199 = !{!200, !158, i64 9}
!200 = !{!"iphdr", !158, i64 0, !158, i64 0, !158, i64 1, !190, i64 2, !190, i64 4, !190, i64 6, !158, i64 8, !158, i64 9, !190, i64 10, !157, i64 12, !157, i64 16}
!201 = !DILocation(line: 28, column: 23, scope: !198, inlinedAt: !179)
!202 = !DILocation(line: 109, column: 21, scope: !203)
!203 = distinct !DILexicalBlock(scope: !124, file: !3, line: 109, column: 8)
!204 = !DILocation(line: 109, column: 26, scope: !203)
!205 = !DILocation(line: 107, column: 19, scope: !124)
!206 = !DILocation(line: 108, column: 20, scope: !124)
!207 = !DILocation(line: 111, column: 39, scope: !124)
!208 = !{!200, !157, i64 12}
!209 = !DILocation(line: 111, column: 52, scope: !124)
!210 = !{!211, !190, i64 2}
!211 = !{!"tcphdr", !190, i64 0, !190, i64 2, !157, i64 4, !157, i64 8, !190, i64 12, !190, i64 12, !190, i64 13, !190, i64 13, !190, i64 13, !190, i64 13, !190, i64 13, !190, i64 13, !190, i64 13, !190, i64 13, !190, i64 14, !190, i64 16, !190, i64 18}
!212 = !DILocation(line: 53, column: 32, scope: !213, inlinedAt: !236)
!213 = distinct !DISubprogram(name: "getHashNew", scope: !3, file: !3, line: 53, type: !214, isLocal: false, isDefinition: true, scopeLine: 53, flags: DIFlagPrototyped, isOptimized: true, unit: !2, variables: !219)
!214 = !DISubroutineType(types: !215)
!215 = !{!118, !216, !218}
!216 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !217, line: 12, baseType: !59)
!217 = !DIFile(filename: "./prog.h", directory: "/home/jeremyguo/Desktop/tc-xdp-lab/src")
!218 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !217, line: 13, baseType: !54)
!219 = !{!220, !221, !222, !227, !232, !235}
!220 = !DILocalVariable(name: "ip_addr", arg: 1, scope: !213, file: !3, line: 53, type: !216)
!221 = !DILocalVariable(name: "port", arg: 2, scope: !213, file: !3, line: 53, type: !218)
!222 = !DILocalVariable(name: "key", scope: !213, file: !3, line: 54, type: !223)
!223 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ip_key", file: !217, line: 31, size: 64, elements: !224)
!224 = !{!225, !226}
!225 = !DIDerivedType(tag: DW_TAG_member, name: "ip", scope: !223, file: !217, line: 32, baseType: !216, size: 32)
!226 = !DIDerivedType(tag: DW_TAG_member, name: "port", scope: !223, file: !217, line: 33, baseType: !218, size: 16, offset: 32)
!227 = !DILocalVariable(name: "val", scope: !213, file: !3, line: 58, type: !228)
!228 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !229, size: 64)
!229 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hash_elem", file: !217, line: 27, size: 32, elements: !230)
!230 = !{!231}
!231 = !DIDerivedType(tag: DW_TAG_member, name: "counter", scope: !229, file: !217, line: 28, baseType: !216, size: 32)
!232 = !DILocalVariable(name: "emp", scope: !233, file: !3, line: 60, type: !229)
!233 = distinct !DILexicalBlock(scope: !234, file: !3, line: 59, column: 14)
!234 = distinct !DILexicalBlock(scope: !213, file: !3, line: 59, column: 8)
!235 = !DILocalVariable(name: "ret", scope: !213, file: !3, line: 66, type: !118)
!236 = distinct !DILocation(line: 111, column: 23, scope: !124)
!237 = !{!157, !157, i64 0}
!238 = !DILocation(line: 53, column: 50, scope: !213, inlinedAt: !236)
!239 = !DILocation(line: 54, column: 5, scope: !213, inlinedAt: !236)
!240 = !DILocation(line: 54, column: 25, scope: !213, inlinedAt: !236)
!241 = !{!242, !157, i64 0}
!242 = !{!"ip_key", !157, i64 0, !190, i64 4}
!243 = !{!242, !190, i64 4}
!244 = !DILocation(line: 58, column: 29, scope: !213, inlinedAt: !236)
!245 = !DILocation(line: 58, column: 23, scope: !213, inlinedAt: !236)
!246 = !DILocation(line: 59, column: 9, scope: !234, inlinedAt: !236)
!247 = !DILocation(line: 59, column: 8, scope: !213, inlinedAt: !236)
!248 = !DILocation(line: 60, column: 9, scope: !233, inlinedAt: !236)
!249 = !DILocation(line: 61, column: 13, scope: !233, inlinedAt: !236)
!250 = !DILocation(line: 61, column: 21, scope: !233, inlinedAt: !236)
!251 = !{!252, !157, i64 0}
!252 = !{!"hash_elem", !157, i64 0}
!253 = !DILocation(line: 62, column: 12, scope: !254, inlinedAt: !236)
!254 = distinct !DILexicalBlock(scope: !233, file: !3, line: 62, column: 12)
!255 = !DILocation(line: 65, column: 5, scope: !234, inlinedAt: !236)
!256 = !DILocation(line: 66, column: 23, scope: !213, inlinedAt: !236)
!257 = !DILocation(line: 66, column: 15, scope: !213, inlinedAt: !236)
!258 = !DILocation(line: 66, column: 9, scope: !213, inlinedAt: !236)
!259 = !DILocation(line: 68, column: 1, scope: !213, inlinedAt: !236)
!260 = !DILocation(line: 117, column: 1, scope: !124)
