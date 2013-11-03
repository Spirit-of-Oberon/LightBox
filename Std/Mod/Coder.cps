﻿MODULE StdCoder;
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

    IMPORT
        Kernel, Files, Converters, Stores, Views, Controllers, Dialog, Documents, Windows,
        TextModels, TextViews, TextControllers, TextMappers,
        StdCmds;

    CONST
        N = 16384;
        LineLength = 74;
        OldVersion = 0; ThisVersion = 1;
        Tag = "StdCoder.Decode";    (* first letter of Tag must not to appear within Tag again *)
        Separator = "/";
        View = 1; File = 2; List = 3;

    TYPE
        FileList = POINTER TO RECORD
            next: FileList;
            file: Files.File;
            type: Files.Type;
            name:Dialog.String
        END;

        ParList* = RECORD
            list*: Dialog.Selection;
            storeAs*: Dialog.String;
            files: FileList
        END;

    VAR
        par*: ParList;
        code: ARRAY 64 OF CHAR;
        revCode: ARRAY 256 OF BYTE;
        table: ARRAY N OF BYTE;
        stdDocuType: Files.Type;

    PROCEDURE NofSelections(IN list: Dialog.Selection): INTEGER;
        VAR i, n: INTEGER;
    BEGIN
        i := 0; n := 0;
        WHILE i # list.len DO
            IF list.In(i) THEN INC(n) END;
            INC(i)
        END;
        RETURN n
    END NofSelections;

    PROCEDURE ShowError(n: INTEGER; par: ARRAY OF CHAR);
    BEGIN
        Dialog.Beep;
        CASE n OF
         1: Dialog.ShowParamMsg("#Std:bad characters", par, "", "")
        | 2: Dialog.ShowParamMsg("#Std:checksum error", par, "", "")
        | 3: Dialog.ShowParamMsg("#Std:incompatible version", par, "", "")
        | 4: Dialog.ShowParamMsg("#Std:filing error", par, "", "")
        | 5: Dialog.ShowParamMsg("#Std:directory ^0 not found", par, "", "")
        | 6: Dialog.ShowParamMsg("#Std:file ^0 not found", par, "", "")
        | 7: Dialog.ShowParamMsg("#Std:illegal path", par, "", "")
        | 8: Dialog.ShowParamMsg("#Std:no tag", par, "", "")
        | 9: Dialog.ShowParamMsg("#Std:disk write protected", par, "", "")
        | 10: Dialog.ShowParamMsg("#Std:io error", par, "", "")
        END
    END ShowError;

    PROCEDURE ShowSizeMsg(x: INTEGER);
        VAR i, j: INTEGER; ch: CHAR; s: ARRAY 20 OF CHAR;
    BEGIN
        ASSERT(x >= 0, 20);
        i := 0;
        REPEAT s[i] := CHR(ORD("0") + x MOD 10); INC(i); x := x DIV 10 UNTIL x = 0;
        s[i] := 0X;
        DEC(i); j := 0;
        WHILE j < i DO ch := s[j]; s[j] := s[i]; s[i] := ch; INC(j); DEC(i) END;
        Dialog.ShowParamStatus("#Std:^0 characters coded", s, "", "")
    END ShowSizeMsg;

    PROCEDURE Write(dest: TextModels.Writer; x: INTEGER; VAR n: INTEGER);
    BEGIN
        dest.WriteChar(code[x]); INC(n);
        IF n = LineLength THEN dest.WriteChar(0DX); dest.WriteChar(" "); n := 0 END
    END Write;

    PROCEDURE WriteHeader(dest: TextModels.Writer; VAR n: INTEGER;
        name: ARRAY OF CHAR; type: BYTE
    );
        VAR byte, bit, i: INTEGER; ch: CHAR; tag: ARRAY 16 OF CHAR;
    BEGIN
        tag := Tag; i := 0; ch := tag[0];
        WHILE ch # 0X DO dest.WriteChar(ch); INC(n); INC(i); ch := tag[i] END;
        dest.WriteChar(" "); INC(n);
        bit := 0; byte := 0; i := 0;
        REPEAT
            ch := name[i]; INC(byte, ASH(ORD(ch), bit)); INC(bit, 8);
            WHILE bit >= 6 DO Write(dest, byte MOD 64, n); byte := byte DIV 64; DEC(bit, 6) END;
            INC(i)
        UNTIL ch = 0X;
        IF bit # 0 THEN Write(dest, byte, n) END;
        Write(dest, ThisVersion, n); Write(dest, type, n)
    END WriteHeader;

    PROCEDURE WriteFileType(dest: TextModels.Writer; VAR n: INTEGER; t: Files.Type);
        VAR byte, bit, i: INTEGER; ch: CHAR;
    BEGIN
        IF t = Kernel.docType THEN t := stdDocuType END;
        bit := 0; byte := 0; i := 0; dest.WriteChar(" ");
        REPEAT
            ch := t[i]; INC(byte, ASH(ORD(ch), bit)); INC(bit, 8);
            WHILE bit >= 6 DO Write(dest, byte MOD 64, n); byte := byte DIV 64; DEC(bit, 6) END;
            INC(i)
        UNTIL ch = 0X;
        IF bit # 0 THEN Write(dest, byte, n) END
    END WriteFileType;

    PROCEDURE WriteFile(dest: TextModels.Writer; VAR n: INTEGER; f: Files.File);
        VAR hash, byte, bit, i, j, sum, len: INTEGER; src: Files.Reader; b: BYTE;
    BEGIN
        len := f.Length(); j := len; i := 6;
        WHILE i # 0 DO Write(dest, j MOD 64, n); j := j DIV 64; DEC(i) END;
        i := 0;
        REPEAT table[i] := 0; INC(i) UNTIL i = N;
        hash := 0; bit := 0; byte := 0; sum := 0; src := f.NewReader(NIL);
        WHILE len # 0 DO
            src.ReadByte(b); DEC(len);
            sum := (sum + b MOD 256) MOD (16 * 1024);
            IF table[hash] = b THEN INC(bit)    (* 0 bit for correct prediction *)
            ELSE    (* Incorrect prediction -> 1'xxxx'xxxx bits *)
                table[hash] := b; INC(byte, ASH(1, bit)); INC(bit);
                INC(byte, ASH(b MOD 256, bit)); INC(bit, 8)
            END;
            WHILE bit >= 6 DO Write(dest, byte MOD 64, n); byte := byte DIV 64; DEC(bit, 6) END;
            hash := (16 * hash + b MOD 256) MOD N
        END;
        IF bit # 0 THEN Write(dest, byte, n) END;
        i := 6;
        WHILE i # 0 DO Write(dest, sum MOD 64, n); sum := sum DIV 64; DEC(i) END;
        IF n # 0 THEN dest.WriteChar(0DX); n := 0 END
    END WriteFile;

    PROCEDURE Read(src: TextModels.Reader; VAR x: INTEGER; VAR res: INTEGER);
        VAR ch: CHAR;
    BEGIN
        IF res = 0 THEN
            REPEAT src.ReadChar(ch); x := revCode[ORD(ch)] UNTIL (x >= 0) OR src.eot;
            IF src.eot THEN res := 1 END
        END;
        IF res # 0 THEN x := 0 END
    END Read;

    PROCEDURE ReadHeader(src: TextModels.Reader; VAR res: INTEGER;
        VAR name: ARRAY OF CHAR; VAR type: BYTE
    );
        VAR x, bit, i, j: INTEGER; ch: CHAR; tag: ARRAY 16 OF CHAR;
    BEGIN
        tag := Tag; i := 0;
        WHILE ~src.eot & (tag[i] # 0X) DO
            src.ReadChar(ch);
            IF ch = tag[i] THEN INC(i) ELSIF ch = tag[0] THEN i := 1 ELSE i := 0 END
        END;
        IF ~src.eot THEN
            res := 0; i := 0; bit := 0; x := 0;
            REPEAT
                WHILE (res = 0) & (bit < 8) DO Read(src, j, res); INC(x, ASH(j, bit)); INC(bit, 6) END;
                IF res = 0 THEN
                    ch := CHR(x MOD 256); x := x DIV 256; DEC(bit, 8); name[i] := ch; INC(i)
                END
            UNTIL (res # 0) OR (ch = 0X);
            Read(src, j, res);
            IF res = 0 THEN
                IF (j = ThisVersion) OR (j = OldVersion) THEN
                    Read(src, j, res); type := SHORT(SHORT(j))
                ELSE res := 3
                END
            END
        ELSE res := 8
        END
    END ReadHeader;

    PROCEDURE ReadFileType(src: TextModels.Reader; VAR res: INTEGER; VAR ftype: Files.Type);
        VAR x, bit, i, j: INTEGER; ch: CHAR;
    BEGIN
        res := 0; i := 0; bit := 0; x := 0;
        REPEAT
            WHILE (res = 0) & (bit < 8) DO Read(src, j, res); INC(x, ASH(j, bit)); INC(bit, 6) END;
            IF res = 0 THEN ch := CHR(x MOD 256); x := x DIV 256; DEC(bit, 8); ftype[i] := ch; INC(i) END
        UNTIL (res # 0) OR (ch = 0X);
        IF ftype = stdDocuType THEN ftype := Kernel.docType END
    END ReadFileType;

    PROCEDURE ReadFile(src: TextModels.Reader; VAR res: INTEGER; f: Files.File);
        VAR hash, x, bit, i, j, len, sum, s: INTEGER; byte: BYTE; dest: Files.Writer;
    BEGIN
        res := 0; i := 0; len := 0;
        REPEAT Read(src, x, res); len := len + ASH(x, 6 * i); INC(i) UNTIL (res # 0) OR (i = 6);
        i := 0;
        REPEAT table[i] := 0; INC(i) UNTIL i = N;
        bit := 0; hash := 0; sum := 0; dest := f.NewWriter(NIL);
        WHILE (res = 0) & (len # 0) DO
            IF bit = 0 THEN Read(src, x, res); bit := 6 END;
            IF ODD(x) THEN    (* Incorrect prediction -> 1'xxxx'xxxx *)
                x := x DIV 2; DEC(bit);
                WHILE (res = 0) & (bit < 8) DO Read(src, j, res); INC(x, ASH(j, bit)); INC(bit, 6) END;
                i := x MOD 256;
                IF i > MAX(BYTE) THEN i := i - 256 END;
                byte := SHORT(SHORT(i)); x := x DIV 256; DEC(bit, 8);
                table[hash] := byte
            ELSE byte := table[hash]; x := x DIV 2; DEC(bit)    (* correct prediction *)
            END;
            hash := (16 * hash + byte MOD 256) MOD N;
            dest.WriteByte(byte); sum := (sum + byte MOD 256) MOD (16 * 1024); DEC(len)
        END;
        IF res = 0 THEN
            i := 0; s := 0;
            REPEAT Read(src, x, res); s := s + ASH(x, 6 * i); INC(i) UNTIL (res # 0) OR (i = 6);
            IF (res = 0) & (s # sum) THEN res := 2 END
        END
    END ReadFile;

    PROCEDURE ShowText (t: TextModels.Model);
        VAR l: INTEGER; v: Views.View; wr: TextMappers.Formatter; conv: Converters.Converter;
    BEGIN
        l := t.Length();
        wr.ConnectTo(t); wr.SetPos(l); wr.WriteString(" --- end of encoding ---");
        ShowSizeMsg(l);
        v := TextViews.dir.New(t);
        conv := Converters.list;
        WHILE (conv # NIL) & (conv.imp # "HostTextConv.ImportText") DO conv := conv.next END;
        Views.Open(v, NIL, "", conv);
        Views.SetDirty(v)
    END ShowText;

    PROCEDURE EncodedView*(v: Views.View): TextModels.Model;
        VAR n: INTEGER; f: Files.File; wrs: Stores.Writer; t: TextModels.Model; wr: TextModels.Writer;
    BEGIN
        f := Files.dir.Temp(); wrs.ConnectTo(f); Views.WriteView(wrs, v);
        t := TextModels.dir.New(); wr := t.NewWriter(NIL);
        n := 0; WriteHeader(wr, n, "", View); WriteFileType(wr, n, f.type); WriteFile(wr, n, f);
        RETURN t
    END EncodedView;

    PROCEDURE EncodeDocument*;
        VAR v: Views.View; w: Windows.Window;
    BEGIN
        w := Windows.dir.First();
        IF w # NIL THEN
            v := w.doc.OriginalView();
            IF (v.context # NIL) & (v.context IS Documents.Context) THEN
                v := v.context(Documents.Context).ThisDoc()
            END;
            IF v # NIL THEN ShowText(EncodedView(v)) END
        END
    END EncodeDocument;

    PROCEDURE EncodeFocus*;
        VAR v: Views.View;
    BEGIN
        v := Controllers.FocusView();
        IF v # NIL THEN ShowText(EncodedView(v)) END
    END EncodeFocus;

    PROCEDURE EncodeSelection*;
        VAR beg, end: INTEGER; t: TextModels.Model; c: TextControllers.Controller;
    BEGIN
        c := TextControllers.Focus();
        IF (c # NIL) & c.HasSelection() THEN
            c.GetSelection(beg, end);
            t := TextModels.CloneOf(c.text); t.InsertCopy(0, c.text, beg, end);
            ShowText(EncodedView(TextViews.dir.New(t)))
        END
    END EncodeSelection;

    PROCEDURE EncodeFile*;
        VAR n: INTEGER; loc: Files.Locator; name: Files.Name; f: Files.File;
            t: TextModels.Model; wr: TextModels.Writer;
    BEGIN
        Dialog.GetIntSpec("", loc, name);
        IF loc # NIL THEN
            f := Files.dir.Old(loc, name, TRUE);
            IF f # NIL THEN
                t := TextModels.dir.New(); wr := t.NewWriter(NIL);
                n := 0; WriteHeader(wr, n, name, File); WriteFileType(wr, n, f.type); WriteFile(wr, n, f);
                ShowText(t)
            END
        END
    END EncodeFile;

    PROCEDURE GetFile(VAR path: ARRAY OF CHAR; VAR loc: Files.Locator; VAR name: Files.Name);
        VAR i, j: INTEGER; ch: CHAR;
    BEGIN
        i := 0; ch := path[0]; loc := Files.dir.This("");
        WHILE (ch # 0X) & (loc # NIL) DO
            j := 0;
            WHILE (ch # 0X) & (ch # Separator) DO name[j] := ch; INC(j); INC(i); ch := path[i] END;
            name[j] := 0X;
            IF ch = Separator THEN loc := loc.This(name); INC(i); ch := path[i] END;
            IF loc.res # 0 THEN loc := NIL END
        END;
        path[i] := 0X
    END GetFile;

    PROCEDURE ReadPath(rd: TextModels.Reader; VAR path: ARRAY OF CHAR; VAR len: INTEGER);
        VAR i, l: INTEGER; ch: CHAR;
    BEGIN
        i := 0; l := LEN(path) - 1;
        REPEAT rd.ReadChar(ch) UNTIL rd.eot OR (ch > " ");
        WHILE ~rd.eot & (ch > " ") & (i < l) DO path[i] := ch; INC(i); rd.ReadChar(ch) END;
        path[i] := 0X; len := i
    END ReadPath;
    
    PROCEDURE WriteString(w: Files.Writer; IN str: ARRAY OF CHAR; len: INTEGER);
        VAR i: INTEGER;
    BEGIN
        i := 0;
        WHILE i < len DO
            IF ORD(str[i]) > MAX(BYTE) THEN w.WriteByte(SHORT(SHORT(ORD(str[i]) - 256)))
            ELSE w.WriteByte(SHORT(SHORT(ORD(str[i]))))
            END;
            INC(i)
        END
    END WriteString;

    PROCEDURE EncodeFileList*;
        TYPE
            FileList = POINTER TO RECORD
                next: FileList;
                f: Files.File
            END;
        VAR
            beg, end, i, j, n: INTEGER; err: BOOLEAN;
            files, last: FileList;
            list, f: Files.File; w: Files.Writer; loc: Files.Locator;
            rd: TextModels.Reader; wr: TextModels.Writer; t: TextModels.Model;
            c: TextControllers.Controller;
            name: Files.Name; path, next: ARRAY 2048 OF CHAR;
    BEGIN
        c := TextControllers.Focus();
        IF (c # NIL) & c.HasSelection() THEN c.GetSelection(beg, end);
            rd := c.text.NewReader(NIL); rd.SetPos(beg); err := FALSE;
            list := Files.dir.Temp(); w := list.NewWriter(NIL); files := NIL; last := NIL;
            ReadPath(rd, path, i);
            WHILE (path # "") & (rd.Pos() - i < end) & ~err DO
                GetFile(path, loc, name);
                IF loc # NIL THEN
                    f := Files.dir.Old(loc, name, TRUE); err := f = NIL;
                    IF ~err THEN
                        IF last = NIL THEN NEW(last); files := last ELSE NEW(last.next); last := last.next END;
                        last.f := f;
                        ReadPath(rd, next, j);
                        IF (next = "=>") & (rd.Pos() - j < end) THEN
                            ReadPath(rd, next, j);
                            IF next # "" THEN WriteString(w, next, j + 1); ReadPath(rd, next, j)
                            ELSE err := TRUE
                            END
                        ELSE WriteString(w, path, i + 1)
                        END;
                        path := next; i := j
                    END
                ELSE err := TRUE
                END
            END;
            IF ~err & (files # NIL) THEN
                t := TextModels.dir.New(); wr := t.NewWriter(NIL);
                n := 0; WriteHeader(wr, n, "", List);
                WriteFileType(wr, n, list.type); WriteFile(wr, n, list);
                WHILE files # NIL DO
                    WriteFileType(wr, n, files.f.type); WriteFile(wr, n, files.f); files := files.next
                END;
                ShowText(t)
            ELSIF err THEN
                IF path = "" THEN ShowError(7, path)
                ELSIF loc # NIL THEN ShowError(6, path)
                ELSE ShowError(5, path)
                END
            END
        END
    END EncodeFileList;

    PROCEDURE DecodeView(rd: TextModels.Reader; name: Files.Name);
        VAR res: INTEGER; f: Files.File; ftype: Files.Type; rds: Stores.Reader; v: Views.View;
    BEGIN
        ReadFileType(rd, res, ftype);
        IF res = 0 THEN
            f := Files.dir.Temp(); ReadFile(rd, res, f);
            IF res = 0 THEN
                rds.ConnectTo(f); Views.ReadView(rds, v); Views.Open(v, NIL, name, NIL);
                Views.SetDirty(v)
            ELSE ShowError(res, "")
            END
        ELSE ShowError(res, "")
        END
    END DecodeView;

    PROCEDURE DecodeFile(rd: TextModels.Reader; name: Files.Name);
        VAR res: INTEGER; ftype: Files.Type; loc: Files.Locator; f: Files.File;
    BEGIN
        ReadFileType(rd, res, ftype);
        IF res = 0 THEN
            Dialog.GetExtSpec(name, ftype, loc, name);
            IF loc # NIL THEN
                f := Files.dir.New(loc, Files.ask);
                IF f # NIL THEN
                    ReadFile(rd, res, f);
                    IF res = 0 THEN
                        f.Register(name, ftype, Files.ask, res);
                        IF res # 0 THEN ShowError(4, "") END
                    ELSE ShowError(res, "")
                    END
                ELSIF loc.res = 4 THEN ShowError(9, "")
                ELSIF loc.res = 5 THEN ShowError(10, "")
                END
            END
        ELSE ShowError(res, "")
        END
    END DecodeFile;

    PROCEDURE DecodeFileList (rd: TextModels.Reader; VAR files: FileList; VAR len, res: INTEGER);
        VAR i, n: INTEGER; b: BYTE; p: FileList;
            ftype: Files.Type; f: Files.File; frd: Files.Reader; path: Dialog.String;
    BEGIN
        ReadFileType(rd, res, ftype);
        IF res = 0 THEN
            f := Files.dir.Temp(); ReadFile(rd, res, f);
            IF res = 0 THEN
                files := NIL; p := NIL; n := 0;
                frd := f.NewReader(NIL); frd.ReadByte(b);
                WHILE ~frd.eof & (res = 0) DO
                    INC(n); i := 0;
                    WHILE ~frd.eof & (b # 0) DO path[i] := CHR(b MOD 256); INC(i); frd.ReadByte(b) END;
                    IF (i > 4) & (path[i - 4] = ".") & (CAP(path[i - 3]) = "O")
                        & (CAP(path[i - 2]) = "D") & (CAP(path[i - 1]) = "C")
                    THEN path[i - 4] := 0X
                    ELSE path[i] := 0X
                    END;
                    IF ~frd.eof THEN
                        IF p = NIL THEN NEW(p); files := p ELSE NEW(p.next); p := p.next END;
                        p.name := path;
                        frd.ReadByte(b)
                    ELSE res := 1
                    END
                END;
                p := files; len := n;
                WHILE (res = 0) & (p # NIL) DO
                    ReadFileType(rd, res, p.type);
                    IF res = 0 THEN p.file := Files.dir.Temp(); ReadFile(rd, res, p.file) END;
                    p := p.next
                END
            END
        END
    END DecodeFileList;

    PROCEDURE OpenDialog(files: FileList; len: INTEGER);
        VAR i: INTEGER; p: FileList;
    BEGIN
        par.files := files; par.list.SetLen(len);
        p := files; i := 0;
        WHILE p # NIL DO par.list.SetItem(i, p.name); INC(i); p := p.next END;
        par.storeAs := "";
        Dialog.Update(par); Dialog.UpdateList(par.list);
        StdCmds.OpenAuxDialog("Std/Rsrc/Coder", "Decode")
    END OpenDialog;

    PROCEDURE CloseDialog*;
    BEGIN
        par.files := NIL; par.list.SetLen(0); par.storeAs := "";
        Dialog.UpdateList(par.list); Dialog.Update(par)
    END CloseDialog;

    PROCEDURE Select*(op, from, to: INTEGER);
        VAR p: FileList; i: INTEGER;
    BEGIN
        IF (op = Dialog.included) OR (op = Dialog.excluded) OR (op = Dialog.set) THEN
            IF NofSelections(par.list) = 1 THEN
                i := 0; p := par.files;
                WHILE ~par.list.In(i) DO INC(i); p := p.next END;
                par.storeAs := p.name
            ELSE par.storeAs := ""
            END;
            Dialog.Update(par)
        END
    END Select;

    PROCEDURE CopyFile(from: Files.File; loc: Files.Locator; name: Files.Name; type: Files.Type);
        CONST BufSize = 4096;
        VAR res, k, l: INTEGER; f: Files.File; r: Files.Reader; w: Files.Writer;
            buf: ARRAY BufSize OF BYTE;
    BEGIN
        f := Files.dir.New(loc, Files.ask);
        IF f # NIL THEN
            r := from.NewReader(NIL); w := f.NewWriter(NIL); l := from.Length();
            WHILE l # 0 DO
                IF l <= BufSize THEN k := l ELSE k := BufSize END;
                r.ReadBytes(buf, 0, k); w.WriteBytes(buf, 0, k);
                l := l - k
            END;
            f.Register(name, type, Files.ask, res);
            IF res # 0 THEN ShowError(4, "") END
        ELSIF loc.res = 4 THEN ShowError(9, "")
        ELSIF loc.res = 5 THEN ShowError(10, "")
        END
    END CopyFile;

    PROCEDURE StoreSelection*;
        VAR i, n: INTEGER; p: FileList; loc: Files.Locator; name: Files.Name;
    BEGIN
        n := NofSelections(par.list);
        IF n > 1 THEN
            i := 0; p := par.files;
            WHILE n # 0 DO
                WHILE ~par.list.In(i) DO INC(i); p := p.next END;
                GetFile(p.name, loc, name); CopyFile(p.file, loc, name, p.type);
                DEC(n); INC(i); p := p.next
            END
        ELSIF (n = 1) & (par.storeAs # "") THEN
            i := 0; p := par.files;
            WHILE ~par.list.In(i) DO INC(i); p := p.next END;
            GetFile(par.storeAs, loc, name); CopyFile(p.file, loc, name, p.type)
        END
    END StoreSelection;

    PROCEDURE StoreSelectionGuard*(VAR p: Dialog.Par);
        VAR n: INTEGER;
    BEGIN
        n := NofSelections(par.list);
        p.disabled := (n = 0) OR ((n = 1) & (par.storeAs = ""))
    END StoreSelectionGuard;

    PROCEDURE StoreSingle*;
        VAR i: INTEGER; p: FileList; loc: Files.Locator; name: Files.Name;
    BEGIN
        IF NofSelections(par.list) = 1 THEN
            i := 0; p := par.files;
            WHILE ~par.list.In(i) DO INC(i); p := p.next END;
            GetFile(p.name, loc, name);
            Dialog.GetExtSpec(name, p.type, loc, name);
            IF loc # NIL THEN CopyFile(p.file, loc, name, p.type) END
        END
    END StoreSingle;

    PROCEDURE StoreSingleGuard*(VAR p: Dialog.Par);
    BEGIN
        p.disabled := NofSelections(par.list) # 1
    END StoreSingleGuard;

    PROCEDURE StoreAllFiles(files: FileList);
        VAR loc: Files.Locator; name: Files.Name;
    BEGIN
        WHILE files # NIL DO
            GetFile(files.name, loc, name); CopyFile(files.file, loc, name, files.type); files := files.next
        END
    END StoreAllFiles;

    PROCEDURE StoreAll*;
    BEGIN
        StoreAllFiles(par.files)
    END StoreAll;

    PROCEDURE DecodeAllFromText*(text: TextModels.Model; beg: INTEGER; ask: BOOLEAN);
        VAR res, i: INTEGER; type: BYTE; name: Files.Name; rd: TextModels.Reader; files: FileList;
    BEGIN
        CloseDialog;
        rd := text.NewReader(NIL); rd.SetPos(beg);
        ReadHeader(rd, res, name, type);
        i := 0;
        WHILE name[i] # 0X DO INC(i) END;
        IF (i > 4) & (name[i - 4] = ".") & (CAP(name[i - 3]) = "O")
            & (CAP(name[i - 2]) = "D") & (CAP(name[i - 1]) = "C")
        THEN name[i - 4] := 0X
        END;
        IF res = 0 THEN
            IF type = View THEN DecodeView(rd, name)
            ELSIF type = File THEN DecodeFile(rd, name)
            ELSIF type = List THEN
                DecodeFileList(rd, files, i, res);
                IF res = 0 THEN
                    IF ask THEN OpenDialog(files, i) ELSE StoreAllFiles(files) END
                ELSE ShowError(res, "")
                END
            ELSE ShowError(3, "")
            END
        ELSE ShowError(res, "")
        END
    END DecodeAllFromText;

    PROCEDURE Decode*;
        VAR beg, end: INTEGER; c: TextControllers.Controller;
    BEGIN
        CloseDialog;
        c := TextControllers.Focus();
        IF c # NIL THEN
            IF c.HasSelection() THEN c.GetSelection(beg, end) ELSE beg := 0 END;
            DecodeAllFromText(c.text, beg, TRUE)
        END
    END Decode;

    PROCEDURE ListFiles(rd: TextModels.Reader; VAR wr: TextMappers.Formatter);
        VAR i, n, res: INTEGER; b: BYTE;
            ftype: Files.Type; f: Files.File; frd: Files.Reader; path: Dialog.String;
    BEGIN
        ReadFileType(rd, res, ftype);
        IF res = 0 THEN
            f := Files.dir.Temp(); ReadFile(rd, res, f);
            IF res = 0 THEN
                n := 0;
                frd := f.NewReader(NIL); frd.ReadByte(b);
                WHILE ~frd.eof & (res = 0) DO
                    INC(n); i := 0;
                    WHILE ~frd.eof & (b # 0) DO path[i] := CHR(b MOD 256); INC(i); frd.ReadByte(b) END;
                    IF (i > 4) & (path[i - 4] = ".") & (CAP(path[i - 3]) = "O")
                        & (CAP(path[i - 2]) = "D") & (CAP(path[i - 1]) = "C")
                    THEN path[i - 4] := 0X
                    ELSE path[i] := 0X
                    END;
                    IF ~frd.eof THEN wr.WriteString(path); wr.WriteLn; frd.ReadByte(b) ELSE res := 1 END
                END
            ELSE ShowError(res, "")
            END
        ELSE ShowError(res, "")
        END
    END ListFiles;

    PROCEDURE ListSingleton(type, name: ARRAY OF CHAR; VAR wr: TextMappers.Formatter);
    BEGIN
        wr.WriteString(type);
        IF name # "" THEN wr.WriteString(": '"); wr.WriteString(name); wr.WriteChar("'") END;
        wr.WriteLn
    END ListSingleton;

    PROCEDURE EncodedInText*(text: TextModels.Model; beg: INTEGER): TextModels.Model;
        VAR res, i: INTEGER; type: BYTE; name: Files.Name;
            rd: TextModels.Reader; report: TextModels.Model; wr: TextMappers.Formatter;
    BEGIN
        report := TextModels.dir.New(); wr.ConnectTo(report);
        rd := text.NewReader(NIL); rd.SetPos(beg);
        ReadHeader(rd, res, name, type);
        i := 0;
        WHILE name[i] # 0X DO INC(i) END;
        IF (i > 4) & (name[i - 4] = ".") & (CAP(name[i - 3]) = "O")
            & (CAP(name[i - 2]) = "D") & (CAP(name[i - 1]) = "C")
        THEN name[i - 4] := 0X
        END;
        IF res = 0 THEN
            IF type = View THEN ListSingleton("View", name, wr)
            ELSIF type = File THEN ListSingleton("File", name, wr)
            ELSIF type = List THEN ListFiles(rd, wr)
            ELSE ShowError(3, "")
            END
        ELSE ShowError(res, "")
        END;
        RETURN report
    END EncodedInText;

    PROCEDURE ListEncodedMaterial*;
        VAR beg, end: INTEGER; c: TextControllers.Controller;
    BEGIN
        c := TextControllers.Focus();
        IF c # NIL THEN
            IF c.HasSelection() THEN c.GetSelection(beg, end) ELSE beg := 0 END;
            Views.OpenView(TextViews.dir.New(EncodedInText(c.text, beg)))
        END
    END ListEncodedMaterial;

    PROCEDURE InitCodes;
        VAR i: BYTE; j: INTEGER;
    BEGIN
        j := 0;
        WHILE j # 256 DO revCode[j] := -1; INC(j) END;
        code[0] := "."; revCode[ORD(".")] := 0; code[1] := ","; revCode[ORD(",")] := 1;
        i := 2; j := ORD("0");
        WHILE j <= ORD("9") DO code[i] := CHR(j); revCode[j] := i; INC(i); INC(j) END;
        j := ORD("A");
        WHILE j <= ORD("Z") DO code[i] := CHR(j); revCode[j] := i; INC(i); INC(j) END;
        j := ORD("a");
        WHILE j <= ORD("z") DO code[i] := CHR(j); revCode[j] := i; INC(i); INC(j) END;
        ASSERT(i = 64, 60)
    END InitCodes;

BEGIN
    InitCodes;
    stdDocuType[0] := 3X; stdDocuType[1] := 3X; stdDocuType[2] := 3X; stdDocuType[3] := 0X
END StdCoder.
