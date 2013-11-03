﻿MODULE StdLoader;
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

    IMPORT S := SYSTEM, Kernel, Files;
    
    CONST
        done = Kernel.done;
        fileNotFound = Kernel.fileNotFound;
        syntaxError = Kernel.syntaxError;
        objNotFound = Kernel.objNotFound;
        illegalFPrint = Kernel.illegalFPrint;
        cyclicImport = Kernel.cyclicImport;
        noMem = Kernel.noMem;
        commNotFound = Kernel.commNotFound;
        commSyntaxError = Kernel.commSyntaxError;
        descNotFound = -1;

        OFdir = "Code";
        SYSdir = "System";
        initMod = "Init";
        OFtag = 6F4F4346H;
        
        (* meta interface consts *)
        mConst = 1; mTyp = 2; mVar = 3; mProc = 4; mField = 5;
        mBool = 1; mChar = 2; mLChar = 3; mSInt = 4; mInt = 5; mLInt = 6;
        mReal = 7; mLReal = 8; mSet = 9; mString = 10; mLString = 11;
        mRecord = 1; mArray = 2; mPointer = 3; mProctyp = 4;
        mInternal = 1; mReadonly = 2; mPrivate = 3; mExported = 4;
        
        (* fixup types *)
        absolute = 100; relative = 101; copy = 102; table = 103; tableend = 104; deref = 105; halfword = 106;
        
    TYPE
        Name = ARRAY 256 OF CHAR;
        ModSpec = POINTER TO RECORD
            next, link, imp: ModSpec;
            name: Name;
            file: Files.File;
            mod: Kernel.Module;
            hs, ms, ds, cs, vs, mad, dad: INTEGER
        END;
        
        Hook = POINTER TO RECORD (Kernel.LoaderHook) END;

    VAR
        res-: INTEGER;
        importing-, imported-, object-: Name;
        inp: Files.Reader;
        m: Kernel.Module;
    
    PROCEDURE Error (r: INTEGER; impd, impg: ModSpec);
    BEGIN
        res := r; imported := impd.name$;
        IF impg # NIL THEN importing := impg.name$ END;
    END Error;
    
    PROCEDURE Append (VAR s: ARRAY OF CHAR; t: ARRAY OF CHAR);
        VAR len, i, j: INTEGER; ch: CHAR;
    BEGIN
        len := LEN(s);
        i := 0; WHILE s[i] # 0X DO INC(i) END;
        j := 0; REPEAT ch := t[j]; s[i] := ch; INC(j); INC(i) UNTIL (ch = 0X) OR (i = len);
        s[len - 1] := 0X
    END Append;

    PROCEDURE ThisObjFile (VAR name: ARRAY OF CHAR): Files.File;
        VAR f: Files.File; loc: Files.Locator; dir, fname: Files.Name;
    BEGIN
        Kernel.SplitName(name, dir, fname);
        Kernel.MakeFileName(fname, Kernel.objType);
        loc := Files.dir.This(dir); loc := loc.This(OFdir);
        f := Files.dir.Old(loc, fname, TRUE);
        IF (f = NIL) & (dir = "") THEN
            loc := Files.dir.This(SYSdir); loc := loc.This(OFdir);
            f := Files.dir.Old(loc, fname, TRUE)
        END;
        RETURN f
    END ThisObjFile;
    
    PROCEDURE RWord (VAR x: INTEGER);
        VAR b: BYTE; y: INTEGER;
    BEGIN
        inp.ReadByte(b); y := b MOD 256;
        inp.ReadByte(b); y := y + 100H * (b MOD 256);
        inp.ReadByte(b); y := y + 10000H * (b MOD 256);
        inp.ReadByte(b); x := y + 1000000H * b
    END RWord;
    
    PROCEDURE RNum (VAR x: INTEGER);
        VAR b: BYTE; s, y: INTEGER;
    BEGIN
        s := 0; y := 0; inp.ReadByte(b);
        WHILE b < 0 DO INC(y, ASH(b + 128, s)); INC(s, 7); inp.ReadByte(b) END;
        x := ASH((b + 64) MOD 128 - 64, s) + y
    END RNum;
    
    PROCEDURE RName (VAR name: ARRAY OF CHAR);
        VAR b: BYTE; i, n: INTEGER;
    BEGIN
        i := 0; n := LEN(name) - 1; inp.ReadByte(b);
        WHILE (i < n) & (b # 0) DO name[i] := CHR(b MOD 256); INC(i); inp.ReadByte(b) END;
        WHILE b # 0 DO inp.ReadByte(b) END;
        name[i] := 0X
    END RName;

    PROCEDURE Fixup (adr: INTEGER; mod: ModSpec);
        VAR link, offset, linkadr, t, n, x, low, hi: INTEGER;
    BEGIN
        RNum(link);
        WHILE link # 0 DO
            RNum(offset);
            WHILE link # 0 DO
                IF link > 0 THEN linkadr := mod.mad + mod.ms + link
                ELSE link := -link;
                    IF link < mod.ms THEN linkadr := mod.mad + link
                    ELSE linkadr := mod.dad + link - mod.ms
                    END
                END;
                S.GET(linkadr, x); t := x DIV 1000000H;
                n := (x + 800000H) MOD 1000000H - 800000H;
                IF t = absolute THEN x := adr + offset
                ELSIF t = relative THEN x := adr + offset - linkadr - 4
                ELSIF t = copy THEN S.GET(adr + offset, x)
                ELSIF t = table THEN x := adr + n; n := link + 4
                ELSIF t = tableend THEN x := adr + n; n := 0
                ELSIF t = deref THEN S.GET(adr+2, x); INC(x, offset);
                ELSIF t = halfword THEN
                    x := adr + offset;
                    low := (x + 8000H) MOD 10000H - 8000H;
                    hi := (x - low) DIV 10000H;
                    S.GET(linkadr + 4, x);
                    S.PUT(linkadr + 4, x DIV 10000H * 10000H + low MOD 10000H);
                    x := x * 10000H + hi MOD 10000H
                ELSE Error(syntaxError, mod, NIL)
                END;
                S.PUT(linkadr, x); link := n
            END;
            RNum(link)
        END
    END Fixup;
    
    PROCEDURE ReadHeader (mod: ModSpec);
        VAR n, p: INTEGER; name: Name; imp, last: ModSpec;
    BEGIN
        mod.file := ThisObjFile(mod.name);
        IF (mod.file = NIL) & (mod.link # NIL) THEN    (* try closing importing obj file *)
            mod.link.file.Close; mod.link.file := NIL;
            mod.file := ThisObjFile(mod.name)
        END;
        IF mod.file # NIL THEN
            inp := mod.file.NewReader(inp);
            IF inp # NIL THEN
                inp.SetPos(0); RWord(n); RWord(p);
                IF (n = OFtag) & (p = Kernel.processor) THEN
                    RWord(mod.hs); RWord(mod.ms); RWord(mod.ds); RWord(mod.cs); RWord(mod.vs); 
                    RNum(n); RName(name);
                    IF name = mod.name THEN
                        mod.imp := NIL; last := NIL;
                        WHILE n > 0 DO
                            NEW(imp); RName(imp.name);
                            IF last = NIL THEN mod.imp := imp ELSE last.next := imp END;
                            last := imp; imp.next := NIL; DEC(n) 
                        END
                    ELSE Error(fileNotFound, mod, NIL)
                    END
                ELSE Error(syntaxError, mod, NIL)
                END
            ELSE Error(noMem, mod, NIL)
            END
        ELSE Error(fileNotFound, mod, NIL)
        END
    END ReadHeader;
    
    PROCEDURE ReadModule (mod: ModSpec);
        TYPE BlockPtr = POINTER TO ARRAY [1] 1000000H OF BYTE;
        VAR imptab, x, fp, ofp, opt, a: INTEGER;
            name: Name; dp, mp: BlockPtr; imp: ModSpec; obj: Kernel.Object; in, n: Kernel.Name;
    BEGIN
        IF mod.file = NIL THEN mod.file := ThisObjFile(mod.name) END;
        inp := mod.file.NewReader(inp);
        IF inp # NIL THEN
            inp.SetPos(mod.hs);
            Kernel.AllocModMem(mod.ds, mod.ms + mod.cs + mod.vs, mod.dad, mod.mad);
            IF (mod.dad # 0) & (mod.mad # 0) THEN
                dp := S.VAL(BlockPtr, mod.dad); mp := S.VAL(BlockPtr, mod.mad);
                inp.ReadBytes(mp^, 0, mod.ms);
                inp.ReadBytes(dp^, 0, mod.ds);
                inp.ReadBytes(mp^, mod.ms, mod.cs);
                mod.mod := S.VAL(Kernel.Module, mod.dad);
                Fixup(S.ADR(Kernel.NewRec), mod);
                Fixup(S.ADR(Kernel.NewArr), mod);
                Fixup(mod.mad, mod);
                Fixup(mod.dad, mod);
                Fixup(mod.mad + mod.ms, mod);
                Fixup(mod.mad + mod.ms + mod.cs, mod);
                imp := mod.imp; imptab := S.VAL(INTEGER, mod.mod.imports);
                WHILE (res = done) & (imp # NIL) DO
                    RNum(x);
                    WHILE (res <= done) & (x # 0) DO
                        RName(name); RNum(fp); opt := 0;
                        IF imp.mod # NIL THEN
                            IF name = "" THEN obj := Kernel.ThisDesc(imp.mod, fp)
                            ELSE n := SHORT(name$); obj := Kernel.ThisObject(imp.mod, n)
                            END;
                            IF (obj # NIL) & (obj.id MOD 16 = x) THEN
                                ofp := obj.fprint;
                                IF x = mTyp THEN
                                    RNum(opt);
                                    IF ODD(opt) THEN ofp := obj.offs END;
                                    IF (opt > 1) & (obj.id DIV 16 MOD 16 # mExported) THEN
                                        Error(objNotFound, imp, mod); object := name$
                                    END;
                                    Fixup(S.VAL(INTEGER, obj.struct), mod)
                                ELSIF x = mVar THEN
                                    Fixup(imp.mod.varBase + obj.offs, mod)
                                ELSIF x = mProc THEN
                                    Fixup(imp.mod.procBase + obj.offs, mod)
                                END;
                                IF ofp # fp THEN Error(illegalFPrint, imp, mod); object := name$ END
                            ELSIF name # "" THEN
                                Error(objNotFound, imp, mod); object := name$
                            ELSE
                                Error(descNotFound, imp, mod);    (* proceed to find failing named object *)
                                RNum(opt); Fixup(0, mod)
                            END
                        ELSE    (* imp is dll *)
                            IF x IN {mVar, mProc} THEN
                                in := SHORT(imp.name$); n := SHORT(name$);
                                a := Kernel.ThisDllObj(x, fp, in, n);
                                IF a # 0 THEN Fixup(a, mod)
                                ELSE Error(objNotFound, imp, mod); object := name$
                                END
                            ELSIF x = mTyp THEN
                                RNum(opt); RNum(x);
                                IF x # 0 THEN Error(objNotFound, imp, mod); object := name$ END
                            END
                        END;
                        RNum(x)
                    END;
                    S.PUT(imptab, imp.mod); INC(imptab, 4); imp := imp.next
                END;
                IF res # done THEN
                    Kernel.DeallocModMem(mod.ds, mod.ms + mod.cs + mod.vs, mod.dad, mod.mad); mod.mod := NIL
                END
            ELSE Error(noMem, mod, NIL)
            END
        ELSE Error(noMem, mod, NIL)
        END;
        mod.file.Close; mod.file := NIL
    END ReadModule;
    
    PROCEDURE LoadMod (mod: ModSpec);
        VAR i: ModSpec; ok: BOOLEAN; j: INTEGER; n: Kernel.Name;
    BEGIN
        importing := ""; imported := ""; object := ""; i := mod;
        WHILE (i.link # NIL) & (i.link.name # mod.name) DO i := i.link END;
        IF i.link = NIL THEN ReadHeader(mod)
        ELSE Error(cyclicImport, i, i.link)
        END;
        i := mod.imp;
        WHILE (res = done) & (i # NIL) DO    (* get imported module *)
            IF i.name = "$$" THEN i.name := "Kernel" END;
            IF i.name[0] = "$" THEN    (* dll *)
                j := 1;
                WHILE i.name[j] # 0X DO i.name[j - 1] := i.name[j]; INC(j) END;
                i.name[j - 1] := 0X; n := SHORT(i.name$);
                Kernel.LoadDll(n, ok);
                IF ~ok THEN Error(fileNotFound, i, NIL) END
            ELSE
                n := SHORT(i.name$);
                i.mod := Kernel.ThisLoadedMod(n);    (* loaded module *)
                IF i.mod = NIL THEN i.link := mod; LoadMod(i) END    (* new module *)
            END;
            i := i.next
        END;
        IF res = done THEN
            n := SHORT(mod.name$);
            mod.mod := Kernel.ThisLoadedMod(n);    (* guaranties uniqueness *)
            IF mod.mod = NIL THEN
                ReadModule(mod);
                IF res = done THEN
                    Kernel.RegisterMod(mod.mod);
                    res := done
                END
            END
        END;
        IF res = descNotFound THEN res := objNotFound; object := "<TypeDesc>" END;
        IF object # "" THEN Append(imported, "."); Append(imported, object); object := "" END
    END LoadMod;

    PROCEDURE (h: Hook) ThisMod (IN name: ARRAY OF SHORTCHAR): Kernel.Module;
        VAR m: Kernel.Module; ms: ModSpec;
    BEGIN
        res := done;
        m := Kernel.ThisLoadedMod(name);
        IF m = NIL THEN
            NEW(ms); ms.link := NIL; ms.name := name$;
            LoadMod(ms);
            m := ms.mod;
            inp := NIL    (* free last file *)
        END;
        h.res := res;
        h.importing := importing$;
        h.imported := imported$;
        h.object := object$;
        RETURN m
    END ThisMod;

    PROCEDURE Init;
        VAR h: Hook;
    BEGIN
        NEW(h); Kernel.SetLoaderHook(h)
    END Init;

BEGIN
    Init;
    m := Kernel.ThisMod("Init");
    IF res # 0 THEN
        CASE res OF
        | fileNotFound: Append(imported, ": code file not found")
        | syntaxError: Append(imported, ": corrupted code file")
        | objNotFound: Append(imported, " not found")
        | illegalFPrint: Append(imported, ": wrong fingerprint")
        | cyclicImport: Append(imported, ": cyclic import")
        | noMem: Append(imported, ": not enough memory")
        ELSE Append(imported, ": loader error")
        END;
        IF res IN {objNotFound, illegalFPrint, cyclicImport} THEN
            Append(imported, " (imported from "); Append(imported, importing); Append(imported, ")")
         END;
        Kernel.FatalError(res, imported)
    END
END StdLoader.

