﻿MODULE Integers;
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

    IMPORT Files, Math;

    CONST
        B = 10000; DecPerDig = 4; BinBase = 16 * 1024;
        KaratsubaBreak = 41;

    TYPE
        Index = INTEGER;
        Digit = SHORTINT;
        DoubleDigit = INTEGER;

        IntegerDesc = ARRAY OF Digit;    (* to hide internal structure from interface *)
        Integer* = POINTER TO IntegerDesc;
        Buffer = RECORD
            digit: Integer;
            beg, len: Index
        END;

    VAR zero, one, two, buf6: Integer;

    PROCEDURE CopyOf (x: Integer; len: Index): Integer;
        VAR buf: Integer;
    BEGIN
        ASSERT(len > 0, 20);
        NEW(buf, len);
        REPEAT DEC(len); buf[len] := x[len] UNTIL len = 0;
        RETURN buf
    END CopyOf;

    (* Operations on Digits *)

    PROCEDURE Add (x, y, sum: Integer; xL, yL: Index; OUT sumL: Index);
        VAR i, l: Index; c: Digit;
    BEGIN
        l := MIN(xL, yL);
        i := 0; c := 0;
        WHILE i < l DO c := SHORT(c DIV B + x[i] + y[i]); sum[i] := SHORT(c MOD B); INC(i) END;
        WHILE i < xL DO c := SHORT(c DIV B + x[i]); sum[i] := SHORT(c MOD B); INC(i) END;
        WHILE i < yL DO c := SHORT(c DIV B + y[i]); sum[i] := SHORT(c MOD B); INC(i) END;
        IF c >= B THEN sum[i] := SHORT(c DIV B); INC(i) END;
        sumL := i
    END Add;

    PROCEDURE Subtract (x, y, dif: Integer; xL, yL: Index; OUT difL: Index);
        VAR i: Index; c, d: Digit;
    BEGIN
        ASSERT(xL >= yL, 20);
        i := 0; difL := 0; c := 0;
        WHILE i < yL DO
            c := SHORT(c DIV B + x[i] - y[i]); d := SHORT(c MOD B);
            IF d # 0 THEN
                WHILE difL # i DO dif[difL] := 0; INC(difL) END;
                dif[i] := d; INC(difL)
            END;
            INC(i)
        END;
        WHILE i < xL DO
            c := SHORT(c DIV B + x[i]); d := SHORT(c MOD B);
            IF d # 0 THEN
                WHILE difL # i DO dif[difL] := 0; INC(difL) END;
                dif[i] := d; INC(difL)
            END;
            INC(i)
        END;
        ASSERT(c DIV B = 0, 100)
    END Subtract;

    PROCEDURE OneDigitMult (a, b: Buffer; VAR c: Buffer);
        VAR i: Index; carry, factor: DoubleDigit;
    BEGIN
        ASSERT(a.len = 1, 20);
        factor := a.digit[a.beg]; i := 0; carry := 0;
        WHILE i # b.len DO
            carry := carry DIV B + factor * b.digit[b.beg + i]; c.digit[c.beg + i] := SHORT(carry MOD B);
            INC(i)
        END;
        IF carry >= B THEN c.digit[c.beg + i] := SHORT(carry DIV B); INC(i) END;
        c.len := i
    END OneDigitMult;

    PROCEDURE SimpleMult (a, b: Buffer; VAR c: Buffer);
        VAR i, j, k: Index; c0, c1: DoubleDigit;
    BEGIN
        ASSERT(a.len <= b.len, 20);
        c.len := a.len + b.len - 1;
        i := 0; c0 := 0; c1 := 0;
        REPEAT
            IF i < b.len THEN
                IF i < a.len THEN j := i; k := 0 ELSE j := a.len - 1; k := i - a.len + 1 END;
                REPEAT
                    c0 := c0 + a.digit[a.beg + j] * b.digit[b.beg + k];
                    IF c0 > MAX(DoubleDigit) - BinBase * (B - 1) THEN
                        c1 := c1 + c0 DIV BinBase; c0 := c0 MOD BinBase
                    END;
                    DEC(j); INC(k)
                UNTIL j < 0
            ELSE
                j := a.len - 1; k := i - a.len + 1;
                REPEAT
                    c0 := c0 + a.digit[a.beg + j] * b.digit[b.beg + k];
                    IF c0 > MAX(DoubleDigit) - BinBase * (B - 1) THEN
                        c1 := c1 + c0 DIV BinBase; c0 := c0 MOD BinBase
                    END;
                    DEC(j); INC(k)
                UNTIL k = b.len
            END;
            IF c1 = 0 THEN c.digit[c.beg + i] := SHORT(c0 MOD B); c0 := c0 DIV B
            ELSE
                c0 := c0 + BinBase * (c1 MOD B);
                c.digit[c.beg + i] := SHORT(c0 MOD B); c0 := c0 DIV B; c1 := c1 DIV B
            END;
            INC(i)
        UNTIL i = c.len;
        IF c0 # 0 THEN c.digit[c.beg + c.len] := SHORT(c0); INC(c.len) END
    END SimpleMult;

    PROCEDURE AddBuf (a, b: Buffer; VAR c: Buffer);    (* c := a + b *)
        VAR i: Index; carry: Digit;
    BEGIN
        ASSERT(a.len <= b.len, 20);
        i := 0; carry := 0;
        WHILE i # a.len DO
            carry := SHORT(carry DIV B + a.digit[a.beg + i] + b.digit[b.beg + i]);
            c.digit[c.beg + i] := SHORT(carry MOD B);
            INC(i)
        END;
        WHILE (i # b.len) & (carry >= B) DO
            carry := SHORT(carry DIV B + b.digit[b.beg + i]); c.digit[c.beg + i] := SHORT(carry MOD B);
            INC(i)
        END;
        IF carry >= B THEN c.digit[c.beg + i] := SHORT(carry DIV B); INC(i)
        ELSE
            WHILE i # b.len DO c.digit[c.beg + i] := b.digit[b.beg + i]; INC(i) END
        END;
        c.len := i
    END AddBuf;

    PROCEDURE AddToBuf (VAR a: Buffer; b: Buffer; shift: Index);    (* a := a + b * B^shift *)
        VAR i, n: Index; carry: Digit;
    BEGIN
        b.beg := b.beg - shift; b.len := b.len + shift; i := shift; n := MIN(a.len, b.len); carry := 0;
        WHILE i # n DO
            carry := SHORT(carry DIV B + a.digit[a.beg + i] + b.digit[b.beg + i]);
            a.digit[a.beg + i] := SHORT(carry MOD B);
            INC(i)
        END;
        IF i # a.len THEN
            WHILE (i # a.len) & (carry >= B) DO
                carry := SHORT(carry DIV B + a.digit[a.beg + i]); a.digit[a.beg + i] := SHORT(carry MOD B);
                INC(i)
            END;
            IF carry >= B THEN a.digit[a.beg + i] := SHORT(carry DIV B); INC(i) END
        ELSE
            WHILE (i # b.len) & (carry >= B) DO
                carry := SHORT(carry DIV B + b.digit[b.beg + i]); a.digit[a.beg + i] := SHORT(carry MOD B);
                INC(i)
            END;
            IF carry >= B THEN a.digit[a.beg + i] := SHORT(carry DIV B); INC(i)
            ELSE
                WHILE i # b.len DO a.digit[a.beg + i] := b.digit[b.beg + i]; INC(i) END
            END
        END;
        a.len := MAX(i, a.len)
    END AddToBuf;

    PROCEDURE SubtractFromBuf (VAR a: Buffer; b, c: Buffer);    (* a := a - b - c *)
        VAR i: Index; carry: Digit;
    BEGIN
        ASSERT(b.len <= c.len, 20);
        i := 0; carry := 0;
        WHILE i # b.len DO
            carry := SHORT(carry DIV B + a.digit[a.beg + i] - b.digit[b.beg + i] - c.digit[c.beg + i]);
            a.digit[a.beg + i] := SHORT(carry MOD B);
            INC(i)
        END;
        WHILE i # c.len DO
            carry := SHORT(carry DIV B + a.digit[a.beg + i] - c.digit[c.beg + i]);
            a.digit[a.beg + i] := SHORT(carry MOD B);
            INC(i)
        END;
        WHILE carry < 0 DO
            carry := SHORT(carry DIV B + a.digit[a.beg + i]); a.digit[a.beg + i]  := SHORT(carry MOD B);
            INC(i)
        END;
        ASSERT(i <= a.len, 100);
        WHILE (a.len # 0) & (a.digit[a.beg + a.len - 1] = 0) DO DEC(a.len) END
    END SubtractFromBuf;

    PROCEDURE KStep (a, b: Buffer; VAR c: Buffer; stack: Buffer);
        VAR n2, i: Index; a0, a1, b0, b1, c0, c1, h: Buffer;
    BEGIN
        ASSERT(a.len <= b.len, 20);
        IF a.len = 0 THEN c.len := 0
        ELSIF a.len = 1 THEN OneDigitMult(a, b, c)
        ELSIF a.len <= KaratsubaBreak THEN SimpleMult(a, b, c)
        ELSE
            n2 := b.len DIV 2;
            c0.digit := c.digit; c0.beg := c.beg; c1.digit := c.digit; c1.beg := c.beg + 2 * n2;
            a0.digit := a.digit; a0.beg := a.beg; a0.len := MIN(a.len, n2);
            a1.digit := a.digit; a1.beg := a.beg + n2; a1.len := MAX(0, a.len - n2);
            WHILE (a0.len # 0) & (a0.digit[a0.beg + a0.len - 1] = 0) DO DEC(a0.len) END;
            b0.digit := b.digit; b0.beg := b.beg; b0.len := MIN(b.len, n2);
            b1.digit := b.digit; b1.beg := b.beg + n2; b1.len := MAX(0, b.len - n2);
            WHILE (b0.len # 0) & (b0.digit[b0.beg + b0.len - 1] = 0) DO DEC(b0.len) END;
            IF (a0.len # 0) OR (b0.len # 0) THEN
                IF a0.len <= a1.len THEN AddBuf(a0, a1, c1) ELSE AddBuf(a1, a0, c1) END;
                IF b0.len <= b1.len THEN AddBuf(b0, b1, c0) ELSE AddBuf(b1, b0, c0) END;
                h.digit := stack.digit; h.beg := stack.beg; stack.beg := stack.beg + c0.len + c1.len;
                IF c0.len <= c1.len THEN KStep(c0, c1, h, stack) ELSE KStep(c1, c0, h, stack) END;
                IF a0.len <= b0.len THEN KStep(a0, b0, c0, stack) ELSE KStep(b0, a0, c0, stack) END;
                KStep(a1, b1, c1, stack);
                IF c0.len <= c1.len THEN SubtractFromBuf(h, c0, c1) ELSE SubtractFromBuf(h, c1, c0) END;
                IF c1.len # 0 THEN
                    i := c0.beg + c0.len;
                    WHILE i < c1.beg DO c.digit[i] := 0; INC(i) END;
                    c.len := c1.beg + c1.len - c.beg
                ELSE
                    WHILE c0.len < n2 DO c0.digit[c0.beg + c0.len] := 0; INC(c0.len) END;
                    c.len := c0.len
                END;
                ASSERT(h.len # 0, 100);
                AddToBuf(c, h, n2)
            ELSE
                KStep(a1, b1, c1, stack); c.len := c1.beg + c1.len - c.beg;
                i := c.beg;
                WHILE i # c1.beg DO c.digit[i] := 0; INC(i) END
            END
        END
    END KStep;

    PROCEDURE Karatsuba (x, y, pro:Integer; xL, yL: Index; OUT proL: Index);
        VAR a, b, c, stack: Buffer;
    BEGIN
        ASSERT(xL <= yL, 20);
        a.digit := x; a.beg := 0; a.len := xL; b.digit := y; b.beg := 0; b.len := yL;
        c.digit := pro; c.beg := 0;
        NEW(stack.digit, 2 * b.len); stack.beg := 0;
        KStep(a, b, c, stack);
        proL := c.len
    END Karatsuba;
    
    PROCEDURE Multiply (x, y, pro: Integer; xL, yL: Index; OUT proL: Index);
        VAR i, j, k: Index; c0, c1: DoubleDigit;
    BEGIN
        ASSERT(xL <= yL, 20);
        IF xL > KaratsubaBreak THEN Karatsuba(x, y, pro, xL, yL, proL)
        ELSIF xL = 1 THEN
            proL := 0; c1 := x[0]; c0 := 0;
            WHILE proL < yL DO
                c0 := c1 * y[proL] + c0; pro[proL] := SHORT(c0 MOD B);
                c0 := c0 DIV B ; INC(proL)
            END;
            IF c0 # 0 THEN pro[proL] := SHORT(c0); INC(proL) END
        ELSE
            proL := xL + yL - 1;
            i := 0; c0 := 0; c1 := 0;
            REPEAT
                IF i < yL THEN
                    IF i < xL THEN j := i; k := 0 ELSE j := xL - 1; k := i - xL + 1 END;
                    REPEAT
                        c0 := c0 + x[j] * y[k];
                        IF c0 > MAX(DoubleDigit) - BinBase * (B - 1) THEN
                            c1 := c1 + c0 DIV BinBase; c0 := c0 MOD BinBase
                        END;
                        DEC(j); INC(k)
                    UNTIL j < 0
                ELSE
                    j := xL - 1; k := i - xL + 1;
                    REPEAT
                        c0 := c0 + x[j] * y[k];
                        IF c0 > MAX(DoubleDigit) - BinBase * (B - 1) THEN
                            c1 := c1 + c0 DIV BinBase; c0 := c0 MOD BinBase
                        END;
                        DEC(j); INC(k)
                    UNTIL k = yL
                END;
                IF c1 = 0 THEN pro[i] := SHORT(c0 MOD B); c0 := c0 DIV B
                ELSE c0 := c0 + BinBase * (c1 MOD B); pro[i] := SHORT(c0 MOD B);
                    c0 := c0 DIV B; c1 := c1 DIV B
                END;
                INC(i)
            UNTIL i = proL;
            IF c0 # 0 THEN pro[proL] := SHORT(c0); INC(proL) END
        END
    END Multiply;

    PROCEDURE DecomposeQuoRem (x, y: Integer; xL, yL: Index);
        VAR ix, iy, j: Index; d, q, h, yLead, ySecond: DoubleDigit; yBuf: Integer;
    BEGIN
        ASSERT((yL # 0) & (y[yL - 1] # 0), 20);
        IF yL = 1 THEN
            j := xL - 1; h := 0; d := y[0];
            WHILE j >= 0 DO h := x[j] + h * B; x[j + 1] := SHORT(h DIV d); h := h MOD d; DEC(j) END;
            x[0] := SHORT(h)
        ELSIF xL >= yL THEN
            x[xL] := 0; d := (B DIV 2 - 1) DIV y[yL - 1] + 1; yBuf := CopyOf(y, yL);
            IF d # 1 THEN
                j := 0; h := 0;
                WHILE j < xL DO h := d * x[j] + h DIV B; x[j] := SHORT(h MOD B); INC(j) END;
                x[xL] := SHORT(h DIV B);
                j := 0; h := 0;
                WHILE j < yL DO h := d * yBuf[j] + h DIV B; yBuf[j] := SHORT(h MOD B); INC(j) END;
                ASSERT(h DIV B = 0, 100)
            END;
            yLead := yBuf[yL - 1]; ySecond := yBuf[yL - 2]; j := xL;
            WHILE j >= yL DO
                IF x[j] # yLead THEN q := (x[j] * B + x[j - 1]) DIV yLead ELSE q := B - 1 END;
                WHILE ySecond * q > (x[j] * B + x[j - 1] - yLead * q) * B + x[j - 2] DO
                    DEC(q)
                END;
                ix := j - yL; iy := 0; h := 0;
                WHILE iy < yL DO
                    h := x[ix] - q * yBuf[iy] + h DIV B; x[ix] := SHORT(h MOD B); INC(ix); INC(iy)
                END;
                IF (-x[j]) # (h DIV B) THEN
                    ix := j - yL; iy := 0; h := 0;
                    WHILE iy < yL DO
                        h := h DIV B + x[ix] + yBuf[iy]; x[ix] := SHORT(h MOD B); INC(ix); INC(iy)
                    END;
                    x[j] := SHORT(q - 1)
                ELSE x[j] := SHORT(q)
                END;
                DEC(j)
            END;
            IF d # 1 THEN
                j := yL; h := 0;
                WHILE j # 0 DO DEC(j); h := h + x[j]; x[j] := SHORT(h DIV d); h := (h MOD d) * B END
            END
        END
    END DecomposeQuoRem;

    PROCEDURE GetQuoRem (x, y: Integer; xL, yL: Index; xNeg, yNeg: BOOLEAN;
                                                quo, rem: Integer; OUT quoL, remL: Index; OUT quoNeg, remNeg: BOOLEAN;
                                                doQuo, doRem: BOOLEAN);
        VAR i: Index; c: Digit; xBuf: Integer;
    BEGIN
        ASSERT(xL >= yL, 20);
        xBuf := CopyOf(x, xL + 1);
        DecomposeQuoRem(xBuf, y, xL, yL);
        i := xL;
        WHILE (i >= yL) & (xBuf[i] = 0) DO DEC(i) END;
        quoL := i - yL + 1;
        i := yL - 1;
        WHILE (i >= 0) & (xBuf[i] = 0) DO DEC(i) END;
        remL := i + 1;
        IF doQuo THEN
            quoNeg := xNeg # yNeg;
            IF quoNeg & (remL # 0) THEN
                i := 0; c := 1;
                WHILE (i # quoL) & (c # 0) DO
                    c := SHORT(c + xBuf[i + yL]); quo[i] := SHORT(c MOD B); c := SHORT(c DIV B);
                    INC(i)
                END;
                IF c = 0 THEN
                    WHILE i # quoL DO quo[i] := xBuf[i + yL]; INC(i) END
                ELSE quo[i] := c; INC(quoL)
                END
            ELSE
                i := 0;
                WHILE i # quoL DO quo[i] := xBuf[i + yL]; INC(i) END
            END
        END;
        IF doRem THEN
            remNeg := yNeg & (remL # 0);
            IF (xNeg # yNeg) & (remL # 0) THEN Subtract(y, xBuf, rem, yL, remL, remL)
            ELSE
                i := 0;
                WHILE i # remL DO rem[i] := xBuf[i]; INC(i) END
            END
        END
    END GetQuoRem;

    PROCEDURE BinPower (x: Integer; exp: INTEGER; y: Integer; xL: Index; OUT yL: Index);
        VAR zL: Index; b: INTEGER; z: Integer;
    BEGIN
        ASSERT(exp > 0, 20); ASSERT(xL # 0, 21);
        b := 1;
        WHILE 2 * b <= exp DO b := 2 * b END;
        y[0] := 1; yL := 1; NEW(z, LEN(y^));
        (* y^b * x^exp = const.) & (2 * b > exp) *)
        WHILE (exp # 0) OR (b # 1) DO
            IF exp >= b THEN
                exp := exp - b;
                IF xL <= yL THEN Multiply(x, y, z, xL, yL, zL) ELSE Multiply(y, x, z, yL, xL, zL) END
            ELSE b := b DIV 2; Multiply(y, y, z, yL, yL, zL)
            END;
            yL := zL;
            REPEAT DEC(zL); y[zL] := z[zL] UNTIL zL = 0
        END
    END BinPower;

    (* Data Format Support *)

    PROCEDURE New (nofDigits: Index): Integer;
        VAR x: Integer;
    BEGIN
        NEW(x, nofDigits + 2); RETURN x
    END New;

    PROCEDURE SetLength (x: Integer; len: Index; negative: BOOLEAN);
        VAR low, high: Digit;
    BEGIN
        ASSERT(len >= 0, 20); ASSERT(~negative OR (len # 0), 21);
        IF negative THEN len := -len END;
        low := SHORT(len MOD 10000H - 8000H); high := SHORT(len DIV 10000H);
        x[LEN(x^) - 1] := low; x[LEN(x^) - 2] := high
    END SetLength;

    PROCEDURE GetLength (x: Integer; OUT len: Index; OUT negative: BOOLEAN);
        VAR low, high: Digit;
    BEGIN
        low := x[LEN(x^) - 1]; high := x[LEN(x^) - 2];
        len := low + 8000H + high * 10000H;
        negative := len < 0; len := ABS(len)
    END GetLength;

    (* Exported Services *)

    PROCEDURE Long* (x: LONGINT): Integer;
        VAR i: Index; negative: BOOLEAN; int: Integer;
    BEGIN
        IF x # 0 THEN
            negative := x < 0; x := ABS(x);
            int := New(5); i := 0;
            REPEAT int[i] := SHORT(SHORT(x MOD B)); x := x DIV B; INC(i) UNTIL x = 0;
            SetLength(int, i, negative)
        ELSE int := zero
        END;
        RETURN int
    END Long;

    PROCEDURE Short* (x: Integer): LONGINT;
        VAR i: Index; res: LONGINT; negative: BOOLEAN;
    BEGIN
        res := 0; GetLength(x, i, negative);
        WHILE i # 0 DO DEC(i); res := res * B + x[i] END;
        IF negative THEN res := -res END;
        RETURN res
    END Short;

    PROCEDURE Entier* (x: REAL): Integer;
        VAR mL, yL, i: Index; mx: REAL; ex: INTEGER; neg: BOOLEAN; y, z: Integer;

        PROCEDURE Inc(m: Integer; VAR mL: Index);
            VAR i: Index;
        BEGIN
            i := 0;
            WHILE m[i] = B - 1 DO m[i] := 0; INC(i) END;
            INC(m[i]);
            IF i = mL THEN INC(mL); m[mL] := 0 END
        END Inc;

        PROCEDURE Double (m: Integer; VAR mL: Index);
            VAR i: Index; c: Digit;
        BEGIN
            i := 0; c := 0;
            WHILE i < mL DO
                c := SHORT(c + m[i] * 2); m[i] := SHORT(c MOD B); c := SHORT(c DIV B);
                INC(i)
            END;
            IF c # 0 THEN INC(mL); m[mL] := 0; m[i] := c END
        END Double;

    BEGIN
        IF (x >= 1) OR (x < 0) THEN
            neg := x < 0; x := ABS(x);
            mL := 0; buf6[0] := 0; mx := Math.Mantissa(x); ex := Math.Exponent(x);
            WHILE (mx # 0) & (ex > 0) DO    (* mx * 2^ex + m * 2^ex = const. *)
                IF ENTIER(mx) = 1 THEN Inc(buf6, mL); mx := mx - 1
                ELSE ASSERT(ENTIER(mx) = 0, 100)
                END;
                Double(buf6, mL); mx := 2 * mx; DEC(ex)
            END;
            IF (ENTIER(mx) = 1) & (ex = 0) THEN Inc(buf6, mL); mx := mx - 1 END;
            IF ex > 0 THEN
                y := New(mL + SHORT(ENTIER(Math.Ln(2) * ex / Math.Ln(B)) + 1));
                z := New(SHORT(ENTIER(Math.Ln(2) * ex / Math.Ln(B)) + 1));
                BinPower(two, ex, z, 1, yL);
                IF mL <= yL THEN Multiply(buf6, z, y, mL, yL, yL) ELSE Multiply(z, buf6, y, yL, mL, yL) END
            ELSE
                y := New(mL + 1); yL := mL;
                i := 0;
                WHILE i # mL DO y[i] := buf6[i]; INC(i) END
            END;
            IF neg & (mx # 0) THEN Inc(y, yL) END;
            SetLength(y, yL, neg)
        ELSE y := zero
        END;
        RETURN y
    END Entier;

    PROCEDURE Float* (x: Integer): REAL;
        VAR i: Index; y: REAL; negative: BOOLEAN;
    BEGIN
        y := 0; GetLength(x, i, negative);
        WHILE i # 0 DO DEC(i); y := y * B + x[i] END;
        IF negative THEN y := -y END;
        RETURN y
    END Float;

    PROCEDURE Sign* (x: Integer): INTEGER;
        VAR len: Index; negative: BOOLEAN;
    BEGIN
        GetLength(x, len, negative);
        IF len = 0 THEN RETURN 0
        ELSIF negative THEN RETURN -1
        ELSE RETURN 1
        END
    END Sign;

    PROCEDURE Abs* (x: Integer): Integer;
        VAR len: Index; negative: BOOLEAN; y: Integer;
    BEGIN
        GetLength(x, len, negative);
        IF negative THEN
            y := New(len); SetLength(y, len, FALSE);
            REPEAT DEC(len); y[len] := x[len] UNTIL len = 0
        ELSE y := x
        END;
        RETURN y
    END Abs;

    PROCEDURE Digits10Of* (x: Integer): INTEGER;
        VAR i, n: Index; d: Digit; negative: BOOLEAN;
    BEGIN
        GetLength(x, n, negative);
        IF n # 0 THEN
            d := x[n - 1]; i := 0;
            REPEAT INC(i); d := SHORT(d DIV 10) UNTIL d = 0;
            n := DecPerDig * (n - 1) + i
        END;
        RETURN n
    END Digits10Of;

    PROCEDURE ThisDigit10* (x: Integer; exp10: INTEGER): CHAR;
        VAR i, n: Index; d: Digit; negative: BOOLEAN;
    BEGIN
        ASSERT(exp10 >= 0, 20);
        GetLength(x, n, negative); i := exp10 DIV DecPerDig;
        IF n > i THEN
            d := x[i]; i := exp10 MOD DecPerDig;
            WHILE i # 0 DO d := SHORT(d DIV 10); DEC(i) END;
            d := SHORT(d MOD 10)
        ELSE d := 0
        END;
        RETURN CHR(ORD("0") + d)
    END ThisDigit10;

    PROCEDURE Compare* (x, y: Integer): INTEGER;
        VAR xL, yL: Index; res: INTEGER; xNeg, yNeg: BOOLEAN;
    BEGIN
        GetLength(x, xL, xNeg); GetLength(y, yL, yNeg);
        IF xNeg = yNeg THEN
            IF (xL = yL) & (xL # 0) THEN
                DEC(xL);
                WHILE (xL # 0) & (x[xL] = y[xL]) DO DEC(xL) END;
                IF x[xL] = y[xL] THEN res := 0 ELSIF (x[xL] < y[xL]) = xNeg THEN res := 1 ELSE res := -1 END
            ELSE
                IF xL = yL THEN res := 0 ELSIF (xL < yL) = xNeg THEN res := 1 ELSE res := -1 END
            END
        ELSIF xNeg THEN res := -1
        ELSE res := 1
        END;
        RETURN res
    END Compare;

    PROCEDURE AddOp (x, y: Integer; subtract: BOOLEAN): Integer;
        VAR i, d, xL, yL, intL: Index; xNeg, yNeg: BOOLEAN; int: Integer;
    BEGIN
        GetLength(x, xL, xNeg); GetLength(y, yL, yNeg);
        IF yL = 0 THEN int := x
        ELSIF xL = 0 THEN
            IF subtract THEN
                int := New(yL); SetLength(int, yL, ~yNeg);
                REPEAT DEC(yL); int[yL] := y[yL] UNTIL yL = 0
            ELSE int := y
            END
        ELSIF (xNeg = yNeg) # subtract THEN
            int := New(MAX(xL, yL) + 1); Add(x, y, int, xL, yL, intL); SetLength(int, intL, xNeg)
        ELSE
            d := xL - yL;
            IF d # 0 THEN i := MAX(xL, yL) - 1
            ELSE
                i := xL;
                REPEAT DEC(i); d := x[i] - y[i] UNTIL (i = 0) OR (d # 0)
            END;
            IF d > 0 THEN
                int := New(i + 1); Subtract(x, y, int, xL, yL, intL); SetLength(int, intL, xNeg)
            ELSIF d < 0 THEN
                int := New(i + 1); Subtract(y, x, int, yL, xL, intL); SetLength(int, intL, yNeg # subtract)
            ELSE int := zero
            END
        END;
        RETURN int
    END AddOp;

    PROCEDURE Sum* (x, y: Integer): Integer;
    BEGIN
        RETURN AddOp(x, y, FALSE)
    END Sum;

    PROCEDURE Difference*(x, y: Integer): Integer;
    BEGIN
        RETURN AddOp(x, y, TRUE)
    END Difference;

    PROCEDURE Product* (x, y: Integer): Integer;
        VAR xL, yL, intL: Index; neg, xNeg, yNeg: BOOLEAN; int: Integer;
    BEGIN
        GetLength(x, xL, xNeg); GetLength(y, yL, yNeg); neg := xNeg # yNeg;
        IF xL > yL THEN int := x; x := y; y := int; intL := xL; xL := yL; yL := intL; xNeg := yNeg END;
        (* x.nofDigits <= y.nofDigits - yNeg no more valid! *)
        IF xL = 0 THEN int := zero
        ELSIF (xL = 1) & (x[0] = 1) THEN
            IF xNeg THEN
                int := New(yL); SetLength(int, yL, neg);
                REPEAT DEC(yL); int[yL] := y[yL] UNTIL yL = 0
            ELSE int := y
            END
        ELSE
            int := New(xL + yL); Multiply(x, y, int, xL, yL, intL); SetLength(int, intL, neg)
        END;
        RETURN int
    END Product;

    PROCEDURE Quotient* (x, y: Integer): Integer;
        VAR xL, yL, intL, remL: Index; xNeg, yNeg, qNeg, rNeg: BOOLEAN;
            int: Integer;
    BEGIN    
        GetLength(x, xL, xNeg); GetLength(y, yL, yNeg);
        ASSERT(yL # 0, 20);
        IF xL < yL THEN int := zero
        ELSIF (yL = 1) & (y[0] = 1) THEN
            IF yNeg THEN
                int := New(xL); SetLength(int, xL, ~xNeg);
                REPEAT DEC(xL); int[xL] := x[xL] UNTIL xL = 0
            ELSE int := x
            END
        ELSE
            int := New(xL - yL + 2);
            GetQuoRem(x, y, xL, yL, xNeg, yNeg, int, NIL, intL, remL, qNeg, rNeg, TRUE, FALSE);
            SetLength(int, intL, qNeg)
        END;
        RETURN int
    END Quotient;

    PROCEDURE Remainder* (x, y: Integer): Integer;
        VAR xL, yL, intL, quoL: Index; xNeg, yNeg, qNeg, rNeg: BOOLEAN;
            int: Integer;
    BEGIN
        GetLength(x, xL, xNeg); GetLength(y, yL, yNeg);
        ASSERT(yL # 0, 20);
        IF xL < yL THEN int := x
        ELSIF (yL = 1) & (y[0] = 1) THEN int := zero
        ELSE
            int := New(yL);
            GetQuoRem(x, y, xL, yL, xNeg, yNeg, NIL, int, quoL, intL, qNeg, rNeg, FALSE, TRUE);
            SetLength(int, intL, rNeg)
        END;
        RETURN int
    END Remainder;

    PROCEDURE QuoRem* (x, y: Integer; OUT quo, rem: Integer);
        VAR xL, yL, quoL, remL: Index; xNeg, yNeg, qNeg, rNeg: BOOLEAN;
    BEGIN
        GetLength(x, xL, xNeg); GetLength(y, yL, yNeg);
        ASSERT(yL # 0, 20);
        IF xL < yL THEN quo := zero; rem := x
        ELSIF (yL = 1) & (y[0] = 1) THEN
            rem := zero;
            IF yNeg THEN
                quo := New(xL); SetLength(quo, xL, ~xNeg);
                REPEAT DEC(xL); quo[xL] := x[xL] UNTIL xL = 0
            ELSE quo := x
            END
        ELSE
            quo := New(xL - yL + 2); rem := New(yL);
            GetQuoRem(x, y, xL, yL, xNeg, yNeg, quo, rem, quoL, remL, qNeg, rNeg, TRUE, TRUE);
            SetLength(quo, quoL, qNeg); SetLength(rem, remL, rNeg)
        END
    END QuoRem;

    PROCEDURE GCD* (x, y: Integer): Integer;
        VAR xL, yL, i: Index; h: Digit; negative: BOOLEAN; xBuf, yBuf, int: Integer;
    BEGIN
        GetLength(x, xL, negative); GetLength(y, yL, negative);
        IF xL = 0 THEN int := y
        ELSIF yL = 0 THEN int := x
        ELSE
            IF xL >= yL THEN xBuf := CopyOf(x, xL + 1); yBuf := CopyOf(y, yL + 1)
            ELSE xBuf := CopyOf(y, yL + 1); yBuf := CopyOf(x, xL + 1); i := xL; xL := yL; yL := i
            END;
            WHILE yL # 0 DO
                DecomposeQuoRem(xBuf, yBuf, xL, yL);
                xL := yL;
                WHILE (xL # 0) & (xBuf[xL - 1] = 0) DO DEC(xL) END;
                i := yL;
                WHILE i # 0 DO DEC(i); h := xBuf[i]; xBuf[i] := yBuf[i]; yBuf[i] := h END;
                i := xL; xL := yL; yL := i
            END;
            int := New(xL); SetLength(int, xL, FALSE);
            WHILE xL # 0 DO DEC(xL); int[xL] := xBuf[xL] END
        END;
        RETURN int
    END GCD;

    PROCEDURE Power* (x: Integer; exp: INTEGER): Integer;
        VAR xL, intL: Index; negative: BOOLEAN; int: Integer;
    BEGIN
        ASSERT(exp >= 0, 20);
        GetLength(x, xL, negative);
        IF xL = 0 THEN int := zero
        ELSIF (xL = 1) & (x[0] = 1) THEN
            IF negative & ~ODD(exp) THEN
                int := New(xL); SetLength(int, xL, FALSE);
                REPEAT DEC(xL); int[xL] := x[xL] UNTIL xL = 0
            ELSE int := x
            END
        ELSIF exp = 0 THEN int := one
        ELSIF exp = 1 THEN int := x
        ELSE
            int := New(SHORT((xL - 1) * exp + ENTIER(Math.Ln(x[xL - 1] + 1) * exp / Math.Ln(B)) + 1));
            BinPower(x, exp, int, xL, intL); SetLength(int, intL, negative & ODD(exp))
        END;
        RETURN int
    END Power;

    (* Read from and Write to String and File *)

    PROCEDURE ConvertFromString* (IN s: ARRAY OF CHAR; OUT x: Integer);
        VAR i, j, k: INTEGER; dig, b: Digit; ch: CHAR; negative: BOOLEAN; new: Integer;
    BEGIN
        i := 0; ch := s[0];
        WHILE (ch # 0X) & (ch <= " ") DO INC(i); ch := s[i] END;
        negative := ch = "-";
        IF negative THEN INC(i); ch := s[i] END;
        IF ch = "+" THEN INC(i); ch := s[i] END;
        WHILE (ch # 0X) & (ch <= " ") DO INC(i); ch := s[i] END;
        ASSERT((ch >= "0") & (ch <= "9"), 20);
        WHILE ch = "0" DO INC(i); ch := s[i] END;
        IF (ch > "0") & (ch <= "9") THEN
            j := i;
            REPEAT INC(j); ch := s[j] UNTIL (ch < "0") OR (ch > "9");
            k := (j - i - 1) DIV DecPerDig + 2;
            new := New(k); SetLength(new, k - 1, negative);
            k := (j - i) MOD DecPerDig;
            IF k # 0 THEN
                b := 1; DEC(k);
                WHILE k # 0 DO DEC(k); b := SHORT(b * 10) END
            ELSE b := B DIV 10
            END;
            REPEAT
                dig := 0;
                WHILE b # 0 DO
                    dig := SHORT(dig + b * (ORD(s[i]) - ORD("0"))); b := SHORT(b DIV 10);
                    INC(i)
                END;
                new[(j - i) DIV DecPerDig] := dig; b := B DIV 10
            UNTIL i = j;
            x := new
        ELSE x := zero
        END
    END ConvertFromString;

    PROCEDURE ConvertToString* (x: Integer; OUT s: ARRAY OF CHAR);
        VAR j: Index; i: INTEGER; d, b: Digit; negative: BOOLEAN;
    BEGIN
        GetLength(x, j, negative);
        IF negative THEN s[0] := "-"; i := 1 ELSE i := 0 END;
        IF j # 0 THEN
            DEC(j); d := x[j]; b := B DIV 10;
            WHILE d DIV b = 0 DO b := SHORT(b DIV 10) END;
            REPEAT
                s[i] := CHR(d DIV b + ORD("0")); INC(i); d := SHORT(d MOD b); b := SHORT(b DIV 10)
            UNTIL b = 0;
            WHILE j # 0 DO
                DEC(j); d := x[j]; b := B DIV 10;
                REPEAT
                    s[i] := CHR(d DIV b + ORD("0")); INC(i); d := SHORT(d MOD b); b := SHORT(b DIV 10)
                UNTIL b = 0
            END
        ELSE s[i] := "0"; INC(i)
        END;
        s[i] := 0X
    END ConvertToString;

    PROCEDURE Internalize* (r: Files.Reader; OUT x: Integer);
        VAR len: Index; n, version: INTEGER; negative: BOOLEAN;
            new: Integer; buf: ARRAY 4 OF BYTE;
    BEGIN
        r.ReadByte(buf[0]); version := buf[0];
        ASSERT((version = 0) OR (version >= 128), 20);
        IF version = 0 THEN
            r.ReadBytes(buf, 0, 4);
            len := (((buf[0] MOD 128) * 256 + buf[1] MOD 256) * 256
                + buf[2] MOD 256) * 256 + buf[3] MOD 256;
            new := New(len); SetLength(new, len, buf[0] < 0);
            WHILE len # 0 DO
                DEC(len);
                r.ReadBytes(buf, 0, 2); new[len] := SHORT((buf[0] MOD 256) * 256 + buf[1] MOD 256)
            END;
            x := new
        ELSE (* version >= 128 *)
            r.ReadByte(buf[1]); n := (buf[0] MOD 256) * 256 + buf[1] MOD 256 - 32768;
            r.ReadBytes(buf, 0, 2); DEC(n);
            len := (buf[0] MOD 256) * 256 + buf[1] MOD 256; negative := len < 0; len := ABS(len);
            new := New(len); SetLength(new, len, negative);
            WHILE n # len DO DEC(n); r.ReadBytes(buf, 0, 2) END;
            WHILE len # 0 DO
                DEC(len);
                r.ReadBytes(buf, 0, 2); new[len] := SHORT((buf[0] MOD 256) * 256 + buf[1] MOD 256)
            END;
            x := new
        END
    END Internalize;

    PROCEDURE Externalize* (w: Files.Writer; x: Integer);
        VAR len, l: Index; d: Digit; i: INTEGER; negative: BOOLEAN; buf: ARRAY 4 OF BYTE;

        PROCEDURE Byte(x: INTEGER): BYTE;
        BEGIN
            ASSERT((x >= MIN(BYTE)) & (x <= MAX(BYTE) - MIN(BYTE)), 20);
            IF x > MAX(BYTE) THEN RETURN SHORT(SHORT(x - 256)) ELSE RETURN SHORT(SHORT(x)) END
        END Byte;

    BEGIN
        GetLength(x, len, negative); l := len; i := 4;
        REPEAT DEC(i); buf[i] := Byte(l MOD 256); l := l DIV 256 UNTIL i = 0;
        IF negative THEN buf[0] := Byte(128 + buf[0] MOD 256) END;
        w.WriteByte(0); w.WriteBytes(buf, 0, 4);
        WHILE len # 0 DO
            DEC(len);
            d := x[len]; buf[0] := Byte(d DIV 256); buf[1] := Byte(d MOD 256); w.WriteBytes(buf, 0, 2)
        END
    END Externalize;

BEGIN
    ASSERT(B <= BinBase, 20);
    zero := New(0); SetLength(zero, 0, FALSE);
    one := New(1); one[0] := 1; SetLength(one, 1, FALSE);
    two := New(1); two[0] := 2; SetLength(two, 1, FALSE);
    NEW(buf6, 6)
END Integers.
