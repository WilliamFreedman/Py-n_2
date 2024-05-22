; ModuleID = 'Pyn'
source_filename = "Pyn"

@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@fmt.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@fmt.2 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

declare i32 @printf(i8*, ...)

define void @main() {
entry:
  %x = alloca double, align 8
  store double 3.000000e+00, double* %x, align 8
  %y = alloca double, align 8
  store double 4.000000e+00, double* %y, align 8
  %a = alloca i1, align 1
  store i1 true, i1* %a, align 1
  %z = alloca i1, align 1
  %x1 = load double, double* %x, align 8
  %y2 = load double, double* %y, align 8
  %tmp = fadd double %x1, %y2
  %tmp3 = fcmp olt double %tmp, 7.010000e+00
  %x4 = load double, double* %x, align 8
  %y5 = load double, double* %y, align 8
  %tmp6 = fadd double %x4, %y5
  %tmp7 = fcmp ogt double %tmp6, 6.990000e+00
  %tmp8 = and i1 %tmp3, %tmp7
  store i1 %tmp8, i1* %z, align 1
  %z9 = load i1, i1* %z, align 1
  %bool_to_int = zext i1 %z9 to i8
  %print_bool = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt, i32 0, i32 0), i8 %bool_to_int)
  %print_bool10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.1, i32 0, i32 0), i8 1)
  %print_bool11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.2, i32 0, i32 0), i8 0)
  ret void
}

define i1 @return_bool(i1 %b) {
entry:
  %b1 = alloca i1, align 1
  store i1 %b, i1* %b1, align 1
  ret i1 true
}
