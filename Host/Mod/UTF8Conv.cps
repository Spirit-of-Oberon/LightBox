MODULE HostUTF8Conv;

    (*
    Converter for Import/Export filter for 8-bit Unicode Transformation Format
    Copyright © 2005-2014, by Helmut Zinn
    *)

    IMPORT
        Files, Stores, TextModels, TextViews;

    CONST
        CR = 0DX; LF = 0AX;

        (*
        font1 = "Arial Unicode MS";
        font2 = "Lucida Sans Unicode";
        *)
        unicodefont = "Consolas";
        
    VAR
        BOM: ARRAY 3 OF SHORTCHAR;

    PROCEDURE SetFont (md: TextModels.Model);
        VAR at: TextModels.Attributes; beg, end: INTEGER;
    BEGIN
        beg := 0; end := md.Length();
        NEW(at); at.InitFromProp(md.Prop(beg, end));
        at := TextModels.NewTypeface(at, unicodefont);
        md.SetAttr(beg, end, at);
    END SetFont;

    PROCEDURE ReadChar (VAR rd: Stores.Reader; VAR ch: CHAR);
        VAR
            c1, c2, c3: BYTE;
    BEGIN    (* UTF-8 format *)
        rd.ReadByte(c1);
        ch := CHR(c1);
        IF c1 < 0 THEN (* c1 < 0 &  c1 > -64 = C0 = 110x xxxx *)
            rd.ReadByte(c2);
            ch := CHR(64 * (c1 MOD 32) + (c2 MOD 64));
            IF c1 >=  - 32 THEN (* c1 < 0 & c1 >= -32 = E0 = 1110 xxxxx *)
                rd.ReadByte(c3);
                ch := CHR(4096 * (c1 MOD 16) + 64 * (c2 MOD 64) + (c3 MOD 64));
            END;
        END;
    END ReadChar;

    PROCEDURE WriteChar (VAR wr: Stores.Writer; ch: CHAR);
    BEGIN    (* UTF-8 format *)
        IF ch <= 7FX THEN
            wr.WriteByte(SHORT(SHORT(ORD(ch))))
        ELSIF ch <= 7FFX THEN
            wr.WriteByte(SHORT(SHORT( - 64 + ORD(ch) DIV 64)));
            wr.WriteByte(SHORT(SHORT( - 128 + ORD(ch) MOD 64)))
        ELSE
            wr.WriteByte(SHORT(SHORT( - 32 + ORD(ch) DIV 4096)));
            wr.WriteByte(SHORT(SHORT( - 128 + ORD(ch) DIV 64 MOD 64)));
            wr.WriteByte(SHORT(SHORT( - 128 + ORD(ch) MOD 64)))
        END
    END WriteChar;

    PROCEDURE SkipBOM(rd: Stores.Reader): CHAR;
        VAR
            i: INTEGER;
            ch: SHORTCHAR;
    BEGIN
        i := 0;
        rd.ReadSChar(ch);
        WHILE (i < 3) & (BOM[i] = ch) DO
            rd.ReadSChar(ch);
            INC(i);
        END;
        RETURN ch;
    END SkipBOM;

    PROCEDURE ImportText* (f: Files.File; OUT s: Stores.Store);
        VAR
            rd: Stores.Reader;
            md: TextModels.Model;
            wr: TextModels.Writer;
            ch, last_ch: CHAR;
    BEGIN
        ASSERT(f # NIL, 20);
        md := TextModels.dir.New();
        wr := md.NewWriter(NIL);
        rd.ConnectTo(f);
        rd.SetPos(0);
        ch := SkipBOM(rd);
        last_ch := 0X;
        WHILE ~rd.rider.eof DO
            IF (ch = LF) & (last_ch # CR) THEN
                wr.WriteChar(CR);
            END;
            wr.WriteChar(ch);
            last_ch := ch;
            ReadChar(rd, ch);
        END;
        SetFont(md);
        s := TextViews.dir.New(md)
    END ImportText;
    
    PROCEDURE EmitBOM*(VAR wr: Stores.Writer);
        VAR i: INTEGER;
    BEGIN
        FOR i := 0 TO 2 DO
            wr.WriteSChar(BOM[i]);
        END;        
    END EmitBOM;
    
    PROCEDURE ExportText* (s: Stores.Store; f: Files.File);
        VAR
            wr: Stores.Writer;
            md: TextModels.Model;
            rd: TextModels.Reader;
    BEGIN
        ASSERT(s # NIL, 20); ASSERT(f # NIL, 21);
        wr.ConnectTo(f); wr.SetPos(0);
        md := s(TextViews.View).ThisModel();
        IF md # NIL THEN
            EmitBOM(wr);
            rd := md.NewReader(NIL);
            rd.SetPos(0);    
            rd.Read;
            WHILE ~rd.eot DO
                IF rd.char # TextModels.viewcode THEN
                    WriteChar(wr, rd.char);
                    IF rd.char = CR THEN WriteChar(wr, LF) END;
                END;
                rd.Read;
            END
        END
    END ExportText;

BEGIN
    BOM[0] := 0EFX;
    BOM[1] := 0BBX;
    BOM[2] := 0BFX;
END HostUTF8Conv.
