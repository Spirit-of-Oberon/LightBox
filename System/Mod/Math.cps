﻿MODULE Math; 
(**
    project    = "BlackBox"
    organization    = "www.oberon.ch"
    contributors    = "Oberon microsystems"
    version    = "System/Rsrc/About"
    copyright    = "System/Rsrc/About"
    license    = "Docu/BB-License"
    changes    = ""
    issues    = ""

**)

    IMPORT SYSTEM;

    VAR eps, e: REAL;


    (* code procedures for 80387 math coprocessor *)

    PROCEDURE [code] FLD (x: REAL);
    PROCEDURE [code] TOP (): REAL;
    PROCEDURE [code] FSW (): INTEGER 0DFH, 0E0H;
    PROCEDURE [code] FSWs (): SET 0DFH, 0E0H;
    PROCEDURE [code] ST0 (): REAL 0D9H, 0C0H;
    PROCEDURE [code] ST1 (): REAL 0D9H, 0C1H;

    PROCEDURE [code] FXCH 0D9H, 0C9H;
    PROCEDURE [code] FLDst0 0D9H, 0C0H;    (* doublicate st[0] *)
    PROCEDURE [code] FSTPst0 0DDH, 0D8H;    (* remove st[0] *)
    PROCEDURE [code] FSTPst1 0DDH, 0D9H;    (* remove st[1] *)
    PROCEDURE [code] FSTPDe 0DBH, 05DH, 0F4H;    (* FSTPD -12[FP] *)    (* COMPILER DEPENDENT *)
    PROCEDURE [code] WAIT 09BH;
    PROCEDURE [code] FNOP 0D9H, 0D0H;

    PROCEDURE [code] FLD0 0D9H, 0EEH;
    PROCEDURE [code] FLD1 0D9H, 0E8H;
    PROCEDURE [code] FLDPI 0D9H, 0EBH;
    PROCEDURE [code] FLDLN2 0D9H, 0EDH;
    PROCEDURE [code] FLDLG2 0D9H, 0ECH;
    PROCEDURE [code] FLDL2E 0D9H, 0EAH;

    PROCEDURE [code] FADD 0DEH, 0C1H;
    PROCEDURE [code] FADDst0 0D8H, 0C0H;
    PROCEDURE [code] FSUB 0DEH, 0E9H;
    PROCEDURE [code] FSUBn 0DCH, 0E9H;    (* no pop *)
    PROCEDURE [code] FSUBR 0DEH, 0E1H;
    PROCEDURE [code] FSUBst1 0D8H, 0E1H;
    PROCEDURE [code] FMUL 0DEH, 0C9H;
    PROCEDURE [code] FMULst0 0D8H, 0C8H;
    PROCEDURE [code] FMULst1st0 0DCH, 0C9H;
    PROCEDURE [code] FDIV 0DEH, 0F9H;
    PROCEDURE [code] FDIVR 0DEH, 0F1H;
    PROCEDURE [code] FDIVRst1 0D8H, 0F9H;
    PROCEDURE [code] FCHS 0D9H, 0E0H;

    PROCEDURE [code] FCOM 0D8H, 0D1H;
    PROCEDURE [code] FSWax 0DFH, 0E0H;
    PROCEDURE [code] SAHF 09EH;
    PROCEDURE [code] JBE4 076H, 004H;
    PROCEDURE [code] JAE4 073H, 004H;

    PROCEDURE [code] FRNDINT 0D9H, 0FCH;
    PROCEDURE [code] FSCALE 0D9H, 0FDH;    (* st[0] * 2^FLOOR(st[1]) *)
    PROCEDURE [code] FXTRACT 0D9H, 0F4H;    (* exp -> st[1]; mant -> st[0] *)
    PROCEDURE [code] FXAM 0D9H, 0E5H;

    PROCEDURE [code] FSQRT 0D9H, 0FAH;    (* st[0] >= 0 *)
    PROCEDURE [code] FSIN 0D9H, 0FEH;    (* |st[0]| < 2^63 *)
    PROCEDURE [code] FCOS 0D9H, 0FFH;    (* |st[0]| < 2^63 *)
    PROCEDURE [code] FTAN 0D9H, 0F2H;    (* |st[0]| < 2^63 *)
    PROCEDURE [code] FATAN 0D9H, 0F3H;    (* atan2(st[1], st[0]) *)
    PROCEDURE [code] FYL2X 0D9H, 0F1H;    (* st[1] * log2(st[0]), st[0] > 0 *)
    PROCEDURE [code] FYL2XP1 0D9H, 0F9H;    (* st[1] * log2(1 + st[0]), |st[0]| < 1-sqrt(2)/2 *)
    PROCEDURE [code] F2XM1 0D9H, 0F0H;    (* 2^st[0] - 1, |st[0]| <= 1 *)


    PROCEDURE IsNan (x: REAL): BOOLEAN;
    BEGIN
        FLD(x); FXAM; FSTPst0; WAIT; RETURN FSWs() * {8, 10} = {8}
    END IsNan;


    (* sin, cos, tan argument reduction *)

    PROCEDURE Reduce;
    BEGIN
        FXAM; WAIT;
        IF ~(8 IN FSWs()) & (ABS(ST0()) > 1.0E18) THEN
            (* to be completed *)
            FSTPst0; FLD0
        END;
    END Reduce;


    (** REAL precision **)

    PROCEDURE Pi* (): REAL;
    BEGIN
        FLDPI; RETURN TOP()
    END Pi;

    PROCEDURE Eps* (): REAL;
    BEGIN
        RETURN eps
    END Eps;


    PROCEDURE Sqrt* (x: REAL): REAL;
    BEGIN
        (* 20, argument of Sqrt must not be negative *)
        FLD(x); FSQRT; WAIT; RETURN TOP()
    END Sqrt;


    PROCEDURE Exp* (x: REAL): REAL;
    BEGIN
        (* 2 ^ (x * 1/ln(2)) *)
        FLD(x); FLDL2E; FMUL;
        IF ABS(ST0()) = INF THEN FLD1
        ELSE FLDst0; FRNDINT; FXCH; FSUBst1; FNOP; F2XM1; FLD1; FADD
        END;
        FSCALE; FSTPst1; RETURN TOP()
    END Exp;

    PROCEDURE Ln* (x: REAL): REAL;
    BEGIN
        (* 20, argument of Ln must not be negative *)
        (* ln(2) * ld(x) *)
        FLDLN2; FLD(x); FYL2X; WAIT; RETURN TOP()
    END Ln;

    PROCEDURE Log* (x: REAL): REAL;
    BEGIN
        (* 20, argument of Log must not be negative *)
        (* log(2) * ld(x) *)
        FLDLG2; FLD(x); FYL2X; WAIT; RETURN TOP()
    END Log;

    PROCEDURE Power* (x, y: REAL): REAL;
    BEGIN
        ASSERT(x >= 0, 20);
        ASSERT((x # 0.0)  OR  (y # 0.0), 21);
        ASSERT((x # INF)  OR  (y # 0.0), 22);
        ASSERT((x # 1.0)  OR  (ABS(y) # INF), 23);
        (* 2 ^ (y * ld(x)) *)
        FLD(y); FLD(x); FYL2X;
        IF ABS(ST0()) = INF THEN FLD1
        ELSE FLDst0; FRNDINT; FXCH; FSUBst1; FNOP; F2XM1; FLD1; FADD
        END;
        FSCALE; FSTPst1; WAIT; RETURN TOP()
    END Power;

    PROCEDURE IntPower* (x: REAL; n: INTEGER): REAL;
    BEGIN 
        FLD1; FLD(x);
        IF n = MIN(INTEGER) THEN RETURN IntPower(x, n + 1) / x END;
        IF n <= 0 THEN FDIVRst1; (* 1 / x *) n := -n END;
        WHILE n > 0 DO
            IF ODD(n) THEN FMULst1st0; (* y := y * x *) DEC(n)
            ELSE FMULst0; (* x := x * x *) n := n DIV 2
            END
        END;
        FSTPst0; RETURN TOP()
    END IntPower;


    PROCEDURE Sin* (x: REAL): REAL;
    BEGIN
        (* 20, ABS(x) # INF *)
        FLD(x); Reduce; FSIN; WAIT; RETURN TOP()
    END Sin;

    PROCEDURE Cos* (x: REAL): REAL;
    BEGIN
        (* 20, ABS(x) # INF *)
        FLD(x); Reduce; FCOS; WAIT; RETURN TOP()
    END Cos;

    PROCEDURE Tan* (x: REAL): REAL;
    BEGIN
        (* 20, ABS(x) # INF *)
        FLD(x); Reduce; FTAN; FSTPst0; WAIT; RETURN TOP()
    END Tan;

    PROCEDURE ArcSin* (x: REAL): REAL;
    BEGIN
        (* 20, -1.0 <= x <= 1.0 *)
        (* atan2(x, sqrt(1 - x*x)) *)
        FLD(x); FLDst0; FMULst0; FLD1; FSUBR; FSQRT; FNOP; FATAN; WAIT; RETURN TOP()
    END ArcSin;

    PROCEDURE ArcCos* (x: REAL): REAL;
    BEGIN
        (* 20, -1.0 <= x <= 1.0 *)
        (* atan2(sqrt(1 - x*x), x) *)
        FLD(x); FMULst0; FLD1; FSUBR; FSQRT; FLD(x); FATAN; WAIT; RETURN TOP()
    END ArcCos;

    PROCEDURE ArcTan* (x: REAL): REAL;
    BEGIN
        (* atan2(x, 1) *)
        FLD(x); FLD1; FATAN; RETURN TOP()
    END ArcTan;

    PROCEDURE ArcTan2* (y, x: REAL): REAL;
    BEGIN
        ASSERT((y # 0)  OR (x # 0), 20);
        ASSERT((ABS(y) # INF)  OR  (ABS(x)  # INF), 21);
        FLD(y); FLD(x); FATAN; WAIT; RETURN TOP()
    END ArcTan2;


    PROCEDURE Sinh* (x: REAL): REAL;
    BEGIN
        (* IF IsNan(x) THEN RETURN x END; *)
        (* abs(x) * 1/ln(2) *)
        FLD(ABS(x)); FLDL2E; FMUL;
        IF ST0() < 0.5 THEN
            (* (2^z - 1) + (2^z - 1) / ((2^z - 1) + 1) *)
            F2XM1; FLDst0; FLDst0; FLD1; FADD; FDIV; FADD
        ELSIF ST0() # INF THEN
            (* 2^z - 1 / 2^z *)
            FLDst0; FRNDINT; FXCH; FSUBst1; FNOP; F2XM1; FLD1; FADD; FSCALE;
            FSTPst1; FLDst0; FLD1; FDIVR; FSUB
        END;
        IF x < 0 THEN FCHS END;
        RETURN TOP() * 0.5
    END Sinh;

    PROCEDURE Cosh* (x: REAL): REAL;
    BEGIN
        (* IF IsNan(x) THEN RETURN x END; *)
        (* 2^(abs(x) * 1/ln(2)) *)
        FLD(ABS(x));
        IF ST0() # INF THEN 
            FLDL2E; FMUL; FLDst0; FRNDINT; FXCH; FSUBst1; FNOP; F2XM1; FLD1; FADD; FSCALE;
            FSTPst1;
            (* z + 1/z *)
            FLDst0; FLD1; FDIVR; FADD
        END;
        RETURN TOP() * 0.5
    END Cosh;

    PROCEDURE Tanh* (x: REAL): REAL;
    BEGIN
        (* IF IsNan(x) THEN RETURN x END; *)
        (* abs(x) * 1/ln(2) * 2 *)
        FLD(ABS(x)); FLDL2E; FMUL; FADDst0;
        IF ST0() < 0.5 THEN
            (* (2^z - 1) / (2^z + 1) *)
            F2XM1; FLDst0; FLD(2); FADD; FDIV
        ELSIF ST0() < 65 THEN
            (* 1 - 2 / (2^z + 1) *)
            FLDst0; FRNDINT; FXCH; FSUBst1; FNOP; F2XM1; FLD1; FADD; FSCALE;
            FSTPst1; FLD1; FADD; FLD(2); FDIVR; FLD1; FSUBR
        ELSE
            FSTPst0; FLD1
        END;
        IF x < 0 THEN FCHS END;
        RETURN TOP()
    END Tanh;

    PROCEDURE ArcSinh* (x: REAL): REAL;
    BEGIN
        (* IF IsNan(x) THEN RETURN x END; *)
        (* x*x *)
        FLDLN2; FLD(ABS(x)); FLDst0; FMULst0;
        IF ST0() < 0.067 THEN
            (* ln(2) * ld(1 + x*x / (sqrt(x*x + 1) + 1) + x) *)
            FLDst0; FLD1; FADD; FSQRT; FLD1; FADD; FDIV; FADD; FYL2XP1
        ELSE
            (* ln(2) * ld(x + sqrt(x*x + 1)) *)
            FLD1; FADD; FSQRT; FADD; FYL2X
        END;
        IF x < 0 THEN FCHS END;
        RETURN TOP()
    END ArcSinh;

    PROCEDURE ArcCosh* (x: REAL): REAL;
    BEGIN
        (* 20, x >= 1.0 *)
        (* IF IsNan(x) THEN RETURN x END; *)
        (* ln(2) * ld(x + sqrt(x*x - 1)) *)
        FLDLN2; FLD(x); FLDst0; FMULst0; FLD1; FSUB; FSQRT; FADD; FYL2X; WAIT; RETURN TOP()
    END ArcCosh;

    PROCEDURE ArcTanh* (x: REAL): REAL;
    BEGIN
        (* 20, -1.0 <= x <= 1.0 *)
        (* IF IsNan(x) THEN RETURN x END; *)
        (* |x| *)
        FLDLN2; FLD(ABS(x)); 
        IF ST0() < 0.12 THEN
            (* ln(2) * ld(1 + 2*x / (1 - x)) *)
            FLDst0; FLD1; FSUBR; FDIV; FADDst0; FYL2XP1
        ELSE
            (* ln(2) * ld((1 + x) / (1 - x)) *)
            FLDst0; FLD1; FADD; FXCH; FLD1; FSUBR; FDIV; FNOP; FYL2X
        END;
        IF x < 0 THEN FCHS END;
        WAIT;
        RETURN TOP() * 0.5
    END ArcTanh;


    PROCEDURE Floor* (x: REAL): REAL;
    BEGIN
        FLD(x); FLDst0; FRNDINT; FCOM; FSWax; FSTPst1; SAHF; JBE4; FLD1; FSUB; RETURN TOP()
    END Floor;

    PROCEDURE Ceiling* (x: REAL): REAL;
    BEGIN
        FLD(x); FLDst0; FRNDINT; FCOM; FSWax; FSTPst1; SAHF; JAE4; FLD1; FADD; RETURN TOP()
    END Ceiling;

    PROCEDURE Round* (x: REAL): REAL;
    BEGIN
        FLD(x); 
        IF ABS(ST0()) = INF THEN RETURN TOP() END;
        FLDst0; FRNDINT; FSUBn; FXCH;
        IF TOP() = 0.5 THEN FLD1; FADD END;
        RETURN TOP()
    END Round;

    PROCEDURE Trunc* (x: REAL): REAL;
    BEGIN 
        FLD(x); FLDst0; FRNDINT;
        IF ST1() >= 0 THEN
            FCOM; FSWax; FSTPst1; SAHF; JBE4; FLD1; FSUB
        ELSE
            FCOM; FSWax; FSTPst1; SAHF; JAE4; FLD1; FADD
        END;
        RETURN TOP()
    END Trunc;

    PROCEDURE Frac* (x: REAL): REAL;
    BEGIN
        (* 20, x # INF  &  x # -INF *)
        FLD(x); FLDst0; FRNDINT;
        IF ST1() >= 0 THEN
            FCOM; FSWax; SAHF; JBE4; FLD1; FSUB
        ELSE
            FCOM; FSWax; SAHF; JAE4; FLD1; FADD
        END;
        FSUB; WAIT; RETURN TOP()
    END Frac;


    PROCEDURE Sign* (x: REAL): REAL;
    BEGIN
        FLD(x); FXAM; WAIT;
        CASE FSW() DIV 256 MOD 8 OF
        | 0, 2: FSTPst0; RETURN 0.0
        | 1, 4, 5: FSTPst0; RETURN 1.0
        | 3, 6, 7: FSTPst0; RETURN -1.0
        END
    END Sign;

    PROCEDURE Mantissa* (x: REAL): REAL;
    BEGIN
        FLD(x); FXAM; WAIT;
        CASE FSW() DIV 256 MOD 8 OF
        | 4, 6: FXTRACT; FSTPst1; RETURN TOP()
        | 0, 2: FSTPst0; RETURN 0.0    (* zero *)
        | 5: FSTPst0; RETURN 1.0    (* inf *)
        | 7: FSTPst0; RETURN -1.0    (* -inf *)
        | 1: FSTPst0; RETURN 1.5    (* nan *)
        | 3: FSTPst0; RETURN -1.5    (* -nan *)
        END
    END Mantissa;

    PROCEDURE Exponent* (x: REAL): INTEGER;    (* COMPILER DEPENDENT *)
        VAR e: INTEGER;    (* e is set by FSTPDe! *)
    BEGIN
        FLD(x); FXAM; WAIT;
        CASE FSW() DIV 256 MOD 8 OF
        | 4, 6: FXTRACT; FSTPst0; FSTPDe; WAIT; RETURN e
        | 0, 2: FSTPst0; RETURN 0    (* zero *)
        | 1, 3, 5, 7: FSTPst0; RETURN MAX(INTEGER)    (* inf or nan*)
        END
    END Exponent;

    PROCEDURE Real* (m: REAL; e: INTEGER): REAL;
        VAR s: SET;
    BEGIN
        IF (m = 0) THEN RETURN 0.0 END;
        ASSERT(~IsNan(m) & (1 <= ABS(m)) & (ABS(m) < 2), 20);
        IF e = MAX(INTEGER) THEN
            SYSTEM.GET(SYSTEM.ADR(m) + 4, s);
            SYSTEM.PUT(SYSTEM.ADR(m) + 4, s + {20..30});
            RETURN m
        ELSE
            FLD(e); FLD(m); FSCALE; FSTPst1; RETURN TOP()
        END
    END Real;

BEGIN
    eps := 1.0E+0; e := 2.0E+0;
    WHILE e > 1.0E+0 DO eps := eps/2.0E+0; e := 1.0E+0 + eps END; eps := 2.0E+0 * eps;
END Math.



    PROCEDURE Log* (x: REAL): REAL;
    BEGIN
        RETURN Ln(x)/ln10
    END Log;
    
    PROCEDURE Power* (x, y: REAL): REAL;
    BEGIN
        RETURN Exp(y * Ln(x))
    END Power;
    
    PROCEDURE IntPower* (x: REAL; n: LONGINT): REAL;
        VAR y: REAL;
    BEGIN y := 1.0E+0;
        IF n < 0 THEN x := 1.0E+0/x; n := -n END;
        WHILE n > 0 DO
            IF ODD(n) THEN y := y*x; DEC(n)
            ELSE x := x * x; n := n DIV 2
            END
        END;
        RETURN y
    END IntPower;

    PROCEDURE Tan* (x: REAL): REAL;
    BEGIN
        RETURN Sin(x)/Cos(x)
    END Tan;
    
    PROCEDURE ArcSin* (x: REAL): REAL;
    BEGIN
        RETURN  2.0E+0 * ArcTan(x/(1.0E+0 + Sqrt(1.0E+0 - x*x)))
    END ArcSin;
    
    PROCEDURE ArcCos* (x: REAL): REAL;
    BEGIN (* pi/2 - arcsin(x) *)
        RETURN Pi()/2.0E+0 - 2.0E+0 * ArcTan(x/(1.0E+0 + Sqrt(1.0E+0 - x*x)))
(*
        IF x = -1 THEN RETURN Pi()
        ELSE RETURN 2 * ArcTan(Sqrt((1 - x) / (1 + x)))
        END
*)    END ArcCos;

    PROCEDURE ArcTan2* (y, x: REAL): REAL;
    BEGIN
        IF x = 0.0 THEN
            RETURN Sign(y) * Pi() / 2.0
        ELSIF y = 0.0 THEN
            RETURN (1.0 - Sign(x)) * Pi() / 2.0
        ELSE
            RETURN ArcTan(y/x) + (1.0 - Sign(x)) * Sign(y) * Pi() / 2.0
        END 
    END ArcTan2;

    PROCEDURE Sinh* (x: REAL): REAL;
    BEGIN
        IF ABS(x) < -lneps THEN RETURN (Exp(x)-Exp(-x))/2.0E+0
        ELSE RETURN Sign(x)*Exp(ABS(x))/2.0E+0
        END
    END Sinh;
    
    PROCEDURE Cosh* (x: REAL): REAL;
    BEGIN
        IF ABS(x) < -lneps THEN RETURN (Exp(x)+Exp(-x))/2.0E+0
        ELSE RETURN Exp(ABS(x))/2.0E+0
        END
    END Cosh;
    
    PROCEDURE Tanh* (x: REAL): REAL;
        VAR e1, e2: REAL;
    BEGIN 
        IF ABS(x) < -lneps THEN
            e1 := Exp(x); e2 := 1.0E+0/e1;
            RETURN (e1-e2)/(e1+e2)
        ELSE
            RETURN Sign(x)
        END
    END Tanh;
    
    PROCEDURE ArcSinh* (x: REAL): REAL;
    BEGIN
        IF x >= 0.0E+0 THEN RETURN Ln(x + Sqrt(x*x + 1.0E+0))
        ELSE RETURN  - Ln(-x + Sqrt(x*x + 1.0E+0))
        END
    END ArcSinh;
    
    PROCEDURE ArcCosh* (x: REAL): REAL;
    BEGIN
        RETURN Ln(x + Sqrt(x*x - 1.0E+0))
    END ArcCosh;
    
    PROCEDURE ArcTanh* (x: REAL): REAL;
    BEGIN
        RETURN Ln((1.0E+0 + x)/(1.0E+0 - x))/2.0E+0
        (* Variants:
            (Ln(1+x)-Ln(1-x))/2.0E+0
            -Ln((1-x)/Sqrt(1-x*x))
            arcsinh(x/sqrt(1-x*x))
        *)
    END ArcTanh;
    
    PROCEDURE Floor* (x: REAL): REAL;
    BEGIN
        IF ABS(x) >= 1.0E16 THEN RETURN x
        ELSE RETURN ENTIER(x)
        END
    END Floor;
    
    PROCEDURE Ceiling* (x: REAL): REAL;
    BEGIN
        IF ABS(x) >= 1.0E16 THEN RETURN x
        ELSE RETURN -ENTIER(-x)
        END
    END Ceiling;
    
    PROCEDURE Round* (x: REAL): REAL;
    BEGIN
        IF ABS(x) >= 1.0E16 THEN RETURN x
        ELSE RETURN ENTIER(x + 0.5)
        END
    END Round;

    PROCEDURE Trunc* (x: REAL): REAL;
    BEGIN 
        IF ABS(x) >= 1.0E16 THEN RETURN x
        ELSIF x >= 0 THEN RETURN ENTIER(x)
        ELSE RETURN -ENTIER(-x)
        END
    END Trunc;

    PROCEDURE Frac* (x: REAL): REAL;
    BEGIN
        IF ABS(x) >= 1.0E16 THEN RETURN 0.0
        ELSIF x >= 0 THEN RETURN x - ENTIER(x)
        ELSE RETURN x + ENTIER(-x)
        END
    END Frac;
    
