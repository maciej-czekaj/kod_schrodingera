; ModuleID = 'kod.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"Hello\00", align 1
@a = common global i32 0, align 4
@b = common global i32 0, align 4
@.str1 = private unnamed_addr constant [8 x i8] c"b = %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @code_1a() #0 {
  %1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0)) #4
  tail call void @use(i32 4) #4
  tail call void @use(i32 5) #4
  ret void
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

declare void @use(i32) #2

; Function Attrs: nounwind uwtable
define void @code_1b() #0 {
  %a = alloca i32, align 4
  %1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0)) #4
  store i32 4, i32* %a, align 4, !tbaa !1
  call void @escape(i32* %a) #4
  %2 = load i32* %a, align 4, !tbaa !1
  %3 = add nsw i32 %2, 1
  call void @use(i32 %3) #4
  ret void
}

declare void @escape(i32*) #2

; Function Attrs: nounwind uwtable
define void @code_1c() #0 {
  store i32 1, i32* @a, align 4, !tbaa !1
  store i32 3, i32* @b, align 4, !tbaa !1
  %1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i64 0, i64 0)) #4
  %2 = load i32* @b, align 4, !tbaa !1
  %3 = add nsw i32 %2, 1
  store i32 %3, i32* @a, align 4, !tbaa !1
  tail call void @use(i32 %3) #4
  %4 = load i32* @a, align 4, !tbaa !1
  %5 = add nsw i32 %4, 1
  store i32 %5, i32* @b, align 4, !tbaa !1
  tail call void @use(i32 %5) #4
  ret void
}

; Function Attrs: nounwind uwtable
define void @code_1d() #0 {
  store i32 3, i32* @b, align 4, !tbaa !1
  tail call void asm sideeffect "", "~{memory},~{dirflag},~{fpsr},~{flags}"() #4, !srcloc !5
  %1 = load i32* @b, align 4, !tbaa !1
  %2 = add nsw i32 %1, 1
  tail call void @use(i32 %2) #4
  %3 = add nsw i32 %1, 2
  store i32 %3, i32* @b, align 4, !tbaa !1
  tail call void @use(i32 %3) #4
  ret void
}

; Function Attrs: nounwind readnone uwtable
define i32 @code_2a(i32 %a, i32 %n) #3 {
  %1 = icmp sgt i32 %n, 0
  br i1 %1, label %.lr.ph, label %4

.lr.ph:                                           ; preds = %0
  %2 = icmp eq i32 %a, 0
  %sum.1.v = select i1 %2, i32 1, i32 2
  %3 = mul i32 %sum.1.v, %n
  br label %4

; <label>:4                                       ; preds = %.lr.ph, %0
  %sum.0.lcssa = phi i32 [ %3, %.lr.ph ], [ 0, %0 ]
  ret i32 %sum.0.lcssa
}

; Function Attrs: nounwind uwtable
define i32 @code_2c(i32 %a, i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %a, i32* %1, align 4, !tbaa !1
  %2 = icmp sgt i32 %n, 0
  br i1 %2, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %0
  %3 = add i32 %n, -1
  br label %4

; <label>:4                                       ; preds = %4, %.lr.ph
  %sum.02 = phi i32 [ 0, %.lr.ph ], [ %sub, %4 ]
  %i.01 = phi i32 [ 0, %.lr.ph ], [ %7, %4 ]
  call void @escape(i32* %1) #4
  %5 = load i32* %1, align 4, !tbaa !1
  %6 = or i32 %5, -2
  %sub = sub i32 %sum.02, %6
  %7 = add nuw nsw i32 %i.01, 1
  %exitcond = icmp eq i32 %i.01, %3
  br i1 %exitcond, label %._crit_edge, label %4

._crit_edge:                                      ; preds = %4, %0
  %sum.0.lcssa = phi i32 [ 0, %0 ], [ %sub, %4 ]
  ret i32 %sum.0.lcssa
}

; Function Attrs: nounwind uwtable
define i32 @code_3a(i32* nocapture %a, i32* nocapture readonly %b, i32 %n) #0 {
  %1 = icmp sgt i32 %n, 0
  br i1 %1, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %0
  %2 = add i32 %n, -1
  br label %3

; <label>:3                                       ; preds = %3, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %3 ]
  %4 = load i32* %b, align 4, !tbaa !1
  %5 = getelementptr inbounds i32* %a, i64 %indvars.iv
  %6 = load i32* %5, align 4, !tbaa !1
  %7 = add nsw i32 %6, %4
  store i32 %7, i32* %5, align 4, !tbaa !1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %2
  br i1 %exitcond, label %._crit_edge, label %3

._crit_edge:                                      ; preds = %3, %0
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @code_3b(i32* nocapture %a, i32* nocapture readonly %b, i32 %n) #0 {
  %1 = load i32* %b, align 4, !tbaa !1
  %2 = icmp sgt i32 %n, 0
  br i1 %2, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %0
  %3 = add i32 %n, -1
  br label %4

; <label>:4                                       ; preds = %4, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %4 ]
  %5 = getelementptr inbounds i32* %a, i64 %indvars.iv
  %6 = load i32* %5, align 4, !tbaa !1
  %7 = add nsw i32 %6, %1
  store i32 %7, i32* %5, align 4, !tbaa !1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %3
  br i1 %exitcond, label %._crit_edge, label %4

._crit_edge:                                      ; preds = %4, %0
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @code_3c(i32* noalias nocapture %a, i32* noalias nocapture readonly %b, i32 %n) #0 {
  %1 = icmp sgt i32 %n, 0
  br i1 %1, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %0
  %2 = load i32* %b, align 4, !tbaa !1
  %3 = add i32 %n, -1
  br label %4

; <label>:4                                       ; preds = %4, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %4 ]
  %5 = getelementptr inbounds i32* %a, i64 %indvars.iv
  %6 = load i32* %5, align 4, !tbaa !1
  %7 = add nsw i32 %6, %2
  store i32 %7, i32* %5, align 4, !tbaa !1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %3
  br i1 %exitcond, label %._crit_edge, label %4

._crit_edge:                                      ; preds = %4, %0
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @code_3d(i32* noalias nocapture %a, i32* noalias %b, i32 %n) #0 {
  tail call void @escape(i32* %b) #4
  %1 = icmp sgt i32 %n, 0
  br i1 %1, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %0
  %2 = add i32 %n, -1
  br label %3

; <label>:3                                       ; preds = %3, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %3 ]
  tail call void @side_effect() #4
  %4 = load i32* %b, align 4, !tbaa !1
  %5 = getelementptr inbounds i32* %a, i64 %indvars.iv
  %6 = load i32* %5, align 4, !tbaa !1
  %7 = add nsw i32 %6, %4
  store i32 %7, i32* %5, align 4, !tbaa !1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %2
  br i1 %exitcond, label %._crit_edge, label %3

._crit_edge:                                      ; preds = %3, %0
  ret i32 0
}

declare void @side_effect() #2

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #0 {
  %1 = load i32* @b, align 4, !tbaa !1
  %2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), i32 %1) #4
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.6.0-2ubuntu1~trusty1 (tags/RELEASE_360/final) (based on LLVM 3.6.0)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{i32 572}
