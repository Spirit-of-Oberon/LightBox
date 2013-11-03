﻿MODULE TextModels;
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

(* re-check alien attributes: project to base attributes? *)
(* support *lists* of attribute extensions? *)
(* support for enumeration of texts within embedded views 
    - generally: support for enumeration of X-views within a recursive scheme?
    - however: Containers already provides a general iteration scheme
        -> could add recursion support to Reader later
*)

    IMPORT
        Files, Services, Fonts, Ports, Stores, Models, Views, Properties, Containers;

    (* text file format:

    text = 0                      CHAR
            textoffset            INTEGER (> 0)
            { run }
            -1                    CHAR
            { char }

    run = attrno                 BYTE (0..32)
            [ attr ]                attr.Internalize
            ( piece | lpiece | viewref )

    piece = length               INTEGER (> 0)

    lpiece = -length             INTEGER (< 0, length MOD 2 = 0)

    viewref = 0                   INTEGER
            w                      INTEGER
            h                       INTEGER
            view                   view.Internalize
    *)

    CONST
        (* unicode* = 1X; *)
        viewcode* = 2X;    (** code for embedded views **)
        tab* = 9X; line* = 0DX; para* = 0EX;    (** tabulator; line and paragraph separator **)
        zwspace* = 8BX; nbspace* = 0A0X; digitspace* = 8FX;
        hyphen* = 90X; nbhyphen* = 91X; softhyphen* = 0ADX;

        (** Pref.opts, options of text-aware views **)
        maskChar* = 0; hideable* = 1;

        (** Prop.known/valid/readOnly **)
        offset* = 0; code* = 1;

        (** InfoMsg.op **)
        store* = 0;

        (** UpdateMsg.op **)
        replace* = 0; insert* = 1; delete* = 2;

        (* EditOp.mode *)
        deleteRange = 0; moveBuf = 1; writeSChar = 2; writeChar = 3; writeView = 4;

        dictSize = 32;

        point = Ports.point;
        defW = 64 * point; defH = 32 * point;

        (* embedding limits - don't increase maxHeight w/o checking TextViews.StdView *)
        minWidth = 5 * point; maxWidth = MAX(INTEGER) DIV 2;
        minHeight = 5 * point; maxHeight = 1500 * point;

        minVersion = 0; maxAttrVersion = 0; maxModelVersion = 0;
        noLCharStdModelVersion = 0; maxStdModelVersion = 1;

        cacheWidth = 8; cacheLen = 4096; cacheLine = 128;

    TYPE
        Model* = POINTER TO ABSTRACT RECORD (Containers.Model) END;

        Attributes* = POINTER TO EXTENSIBLE RECORD (Stores.Store)
            init-: BOOLEAN;    (* immutable once init is set *)
            color-: Ports.Color;
            font-: Fonts.Font;
            offset-: INTEGER
        END;

        AlienAttributes* = POINTER TO RECORD (Attributes)
            store-: Stores.Alien
        END;

        Prop* = POINTER TO RECORD (Properties.Property)
            offset*: INTEGER;
            code*: CHAR
        END;


        Context* = POINTER TO ABSTRACT RECORD (Models.Context) END;

        Pref* = RECORD (Properties.Preference)
            opts*: SET;    (** preset to {} **)
            mask*: CHAR    (** valid if maskChar IN opts **)
        END;


        Reader* = POINTER TO ABSTRACT RECORD
            eot*: BOOLEAN;
            attr*: Attributes;
            char*: CHAR;
            view*: Views.View;
            w*, h*: INTEGER
        END;

        Writer* = POINTER TO ABSTRACT RECORD
            attr-: Attributes
        END;


        InfoMsg* = RECORD (Models.Message)
            op*: INTEGER
        END;

        UpdateMsg* = RECORD (Models.UpdateMsg)
            op*: INTEGER;
            beg*, end*, delta*: INTEGER    (** range: [beg, end); length = length' + delta **)
        END;


        Directory* = POINTER TO ABSTRACT RECORD
            attr-: Attributes
        END;


        Run = POINTER TO EXTENSIBLE RECORD
            prev, next: Run;
            len: INTEGER;
            attr: Attributes
        END;

        LPiece = POINTER TO EXTENSIBLE RECORD (Run)
            file: Files.File;
            org: INTEGER
        END;

        Piece = POINTER TO RECORD (LPiece) END;    (* u IS Piece => CHAR run *)

        ViewRef = POINTER TO RECORD (Run)    (* u IS ViewRef => View run *)
            w, h: INTEGER;
            view: Views.View    (* embedded view *)
        END;


        PieceCache = RECORD
            org: INTEGER;
            prev: Run    (* Org(prev.next) = org *)
        END;

        SpillFile = POINTER TO RECORD
            file: Files.File;    (* valid if file # NIL *)
            len: INTEGER;    (* len = file.Length() *)
            writer: Files.Writer    (* writer.Base() = file *)
        END;

        AttrDict = RECORD
            len: BYTE;
            attr: ARRAY dictSize OF Attributes
        END;

        StdModel = POINTER TO RECORD (Model)
            len: INTEGER;    (* len = sum(u : [trailer.next, trailer) : u.len) *)
            id: INTEGER;  (* unique (could use SYSTEM.ADR instead ...) *)
            era: INTEGER;    (* stable era >= k *)
            trailer: Run;    (* init => trailer # NIL *)
            pc: PieceCache;
            spill: SpillFile;    (* spill file, created lazily, shared with clones *)
            rd: Reader    (* reader cache *)
        END;

        StdContext = POINTER TO RECORD (Context)
            text: StdModel;
            ref: ViewRef
        END;

        StdReader = POINTER TO RECORD (Reader)
            base: StdModel;    (* base = Base() *)
            pos: INTEGER;    (* pos = Pos() *)
            era: INTEGER;
            run: Run;    (* era = base.era => Pos(run) + off = pos *)
            off: INTEGER;    (* era = base.era => 0 <= off < run.len *)
            reader: Files.Reader    (* file reader cache *)
        END;

        StdWriter = POINTER TO RECORD (Writer)
            base: StdModel;    (* base = Base() *)
            (* hasSequencer := base.Domain() = NIL  OR  base.Domain().GetSequencer() = NIL *)
            pos: INTEGER;    (* pos = Pos() *)
            era: INTEGER;    (* relevant iff hasSequencer *)
            run: Run    (* hasSequencer  &  era = base.era  =>  Pos(run) = pos *)
        END;

        StdDirectory = POINTER TO RECORD (Directory) END;


        MoveOp = POINTER TO RECORD (Stores.Operation)    (* MoveStretchFrom *)
            (* move src.[beg, end) to dest.pos *)
            src: StdModel;
            beg, end: INTEGER;
            dest: StdModel;
            pos: INTEGER
        END;

        EditOp = POINTER TO RECORD (Stores.Operation)    (* CopyStretchFrom, Delete, WriteXXX *)
            mode: INTEGER;
            canBunch: BOOLEAN;
            text: StdModel;
            beg, end: INTEGER;    (* op = deleteRange: move text.[beg, end) to <first, last> *)
            pos: INTEGER;
            first, last: Run;    (* op = moveBuf: move <first, last> to text.pos;
                                            op = writeView: insert <first> at text.pos*)
            len: INTEGER;    (* op = moveBuf: length of <first, last>;
                                            op = write[L]Char: length of spill file before writing new [long] char *)
            attr: Attributes    (* op = write[L]Char *)
        END;

        AttrList = POINTER TO RECORD
            next: AttrList;
            len: INTEGER;
            attr: Attributes
        END;

        SetAttrOp = POINTER TO RECORD (Stores.Operation)    (* SetAttr, Modify *)
            text: StdModel;
            beg: INTEGER;
            list: AttrList
        END;

        ResizeViewOp = POINTER TO RECORD (Stores.Operation)    (* ResizeView *)
            text: StdModel;
            pos: INTEGER;
            ref: ViewRef;
            w, h: INTEGER
        END;

        ReplaceViewOp = POINTER TO RECORD (Stores.Operation)    (* ReplaceView *)
            text: StdModel;
            pos: INTEGER;
            ref: ViewRef;
            new: Views.View
        END;

        TextCache = RECORD
            id: INTEGER;  (* id of the text block served by this cache block *)
            beg, end: INTEGER;  (* [beg .. end) cached, 0 <= end - beg < cacheLen *)
            buf: ARRAY cacheLen OF BYTE  (* [beg MOD cacheLen .. end MOD cacheLen) *)
        END;
        Cache = ARRAY cacheWidth OF TextCache;

    VAR
        dir-, stdDir-: Directory;

        stdProp: Properties.StdProp;    (* temp for NewColor, ... NewWeight *)
        prop: Prop;    (* temp for NewOffset *)
        nextId: INTEGER;
        cache: Cache;


    (** Model **)

    PROCEDURE (m: Model) Internalize- (VAR rd: Stores.Reader), EXTENSIBLE;
        VAR thisVersion: INTEGER;
    BEGIN
        m.Internalize^(rd); IF rd.cancelled THEN RETURN END;
        rd.ReadVersion(minVersion, maxModelVersion, thisVersion)
    END Internalize;

    PROCEDURE (m: Model) Externalize- (VAR wr: Stores.Writer), EXTENSIBLE;
    BEGIN
        m.Externalize^(wr);
        wr.WriteVersion(maxModelVersion)
    END Externalize;


    PROCEDURE (m: Model) Length* (): INTEGER, NEW, ABSTRACT;
    PROCEDURE (m: Model) NewReader* (old: Reader): Reader, NEW, ABSTRACT;
    PROCEDURE (m: Model) NewWriter* (old: Writer): Writer, NEW, ABSTRACT;
    PROCEDURE (m: Model) InsertCopy* (pos: INTEGER; m0: Model; beg0, end0: INTEGER), NEW, ABSTRACT;
    PROCEDURE (m: Model) Insert* (pos: INTEGER; m0: Model; beg0, end0: INTEGER), NEW, ABSTRACT;
    PROCEDURE (m: Model) Delete* (beg, end: INTEGER), NEW, ABSTRACT;
    PROCEDURE (m: Model) SetAttr* (beg, end: INTEGER; attr: Attributes), NEW, ABSTRACT;
    PROCEDURE (m: Model) Prop* (beg, end: INTEGER): Properties.Property, NEW, ABSTRACT;
    PROCEDURE (m: Model) Modify* (beg, end: INTEGER; old, p: Properties.Property), NEW, ABSTRACT;
    PROCEDURE (m: Model) ReplaceView* (old, new: Views.View), ABSTRACT;

    PROCEDURE (m: Model) Append* (m0: Model), NEW, ABSTRACT;
(*
    BEGIN
        ASSERT(m # m0, 20);
        m.Insert(m.Length(), m0, 0, m0.Length())
    END Append;
*)
    PROCEDURE (m: Model) Replace* (beg, end: INTEGER; m0: Model; beg0, end0: INTEGER),
        NEW, ABSTRACT;
(*
        VAR script: Stores.Operation; delta: INTEGER;
    BEGIN
        Models.BeginScript(m, "#System:Replacing", script);
        m.Delete(beg, end);
        IF beg0 > 
        m.Insert(beg, m0, beg0, end0);
        Models.EndScript(m, script)
    END Replace;
*)

    (** Attributes **)

    PROCEDURE (a: Attributes) CopyFrom- (source: Stores.Store), EXTENSIBLE;
    (** pre: ~a.init, source.init **)
    (** post: a.init **)
    BEGIN
        WITH source: Attributes DO
            ASSERT(~a.init, 20); ASSERT(source.init, 21); a.init := TRUE;
            a.color := source.color; a.font := source.font; a.offset := source.offset
        END
    END CopyFrom;

    PROCEDURE (a: Attributes) Internalize- (VAR rd: Stores.Reader), EXTENSIBLE;
    (** pre: ~a.init **)
    (** post: a.init **)
        VAR thisVersion: INTEGER;
            fprint: INTEGER; face: Fonts.Typeface; size: INTEGER; style: SET; weight: INTEGER;
    BEGIN
        ASSERT(~a.init, 20); a.init := TRUE;
        a.Internalize^(rd);
        IF rd.cancelled THEN RETURN END;
        rd.ReadVersion(minVersion, maxAttrVersion, thisVersion);
        IF rd.cancelled THEN RETURN END;
        rd.ReadInt(a.color);
        rd.ReadInt(fprint);
        rd.ReadXString(face); rd.ReadInt(size); rd.ReadSet(style); rd.ReadXInt(weight);
        a.font := Fonts.dir.This(face, size, style, weight);
        IF a.font.IsAlien() THEN Stores.Report("#System:AlienFont", face, "", "")
(*
        ELSIF a.font.Fingerprint() # fprint THEN Stores.Report("#System:AlienFontVersion", face, "", "")
*)
        END;
        rd.ReadInt(a.offset)
    END Internalize;

    PROCEDURE (a: Attributes) Externalize- (VAR wr: Stores.Writer), EXTENSIBLE;
    (** pre: a.init **)
        VAR f: Fonts.Font;
    BEGIN
        ASSERT(a.init, 20);
        a.Externalize^(wr);
        wr.WriteVersion(maxAttrVersion);
        wr.WriteInt(a.color);
        f := a.font;
(*
        wr.WriteInt(f.Fingerprint());
*)
        wr.WriteInt(0);
        wr.WriteXString(f.typeface); wr.WriteInt(f.size); wr.WriteSet(f.style); wr.WriteXInt(f.weight);
        wr.WriteInt(a.offset)
    END Externalize;

    PROCEDURE (a: Attributes) InitFromProp* (p: Properties.Property), NEW, EXTENSIBLE;
    (** pre: ~a.init **)
    (** post: a.init, x IN p.valid => x set in a, else x defaults in a **)
        VAR def: Fonts.Font; face: Fonts.Typeface; size: INTEGER; style: SET; weight: INTEGER;
    BEGIN
        ASSERT(~a.init, 20); a.init := TRUE;
        def := Fonts.dir.Default();
        face := def.typeface$; size := def.size; style := def.style; weight := def.weight;
        a.color := Ports.defaultColor; a.offset := 0;
        WHILE p # NIL DO
            WITH p: Properties.StdProp DO
                IF Properties.color IN p.valid THEN a.color := p.color.val END;
                IF Properties.typeface IN p.valid THEN face := p.typeface END;
                IF (Properties.size IN p.valid)
                & (Ports.point <= p.size) & (p.size <= 32767 * Ports.point) THEN
                    size := p.size
                END;
                IF Properties.style IN p.valid THEN
                    style := style - p.style.mask + p.style.val * p.style.mask
                END;
                IF (Properties.weight IN p.valid) & (1 <= p.weight) & (p.weight <= 1000) THEN
                    weight := p.weight
                END
            | p: Prop DO
                IF offset IN p.valid THEN a.offset := p.offset END
            ELSE
            END;
            p := p.next
        END;
        a.font := Fonts.dir.This(face, size, style, weight)
    END InitFromProp;

    PROCEDURE (a: Attributes) Equals* (b: Attributes): BOOLEAN, NEW, EXTENSIBLE;
    (** pre: a.init, b.init **)
    BEGIN
        ASSERT(a.init, 20); ASSERT((b # NIL) & b.init, 21);
        RETURN (a = b)
            OR   (Services.SameType(a, b))
                & (a.color = b.color) & (a.font = b.font) & (a.offset = b.offset)
    END Equals;

    PROCEDURE (a: Attributes) Prop* (): Properties.Property, NEW, EXTENSIBLE;
    (** pre: a.init **)
        VAR p: Properties.Property; sp: Properties.StdProp; tp: Prop;
    BEGIN
        ASSERT(a.init, 20);
        NEW(sp);
        sp.known := {Properties.color .. Properties.weight}; sp.valid := sp.known;
        sp.color.val := a.color;
        sp.typeface := a.font.typeface$;
        sp.size := a.font.size;
        sp.style.mask := {Fonts.italic, Fonts.underline, Fonts.strikeout};
        sp.style.val := a.font.style * sp.style.mask;
        sp.weight := a.font.weight;
        NEW(tp);
        tp.known := {offset}; tp.valid := tp.known;
        tp.offset := a.offset;
        Properties.Insert(p, tp); Properties.Insert(p, sp);
        RETURN p
    END Prop;

    PROCEDURE (a: Attributes) ModifyFromProp- (p: Properties.Property), NEW, EXTENSIBLE;
    (** pre: ~a.init **)
        VAR face: Fonts.Typeface; size: INTEGER; style: SET; weight: INTEGER;
            valid: SET;
    BEGIN
        face := a.font.typeface; size := a.font.size; 
        style := a.font.style; weight := a.font.weight;
        WHILE p # NIL DO
            valid := p.valid;
            WITH p: Properties.StdProp DO
                IF Properties.color IN valid THEN a.color := p.color.val END;
                IF Properties.typeface IN valid THEN
                    face := p.typeface
                END;
                IF (Properties.size IN valid)
                & (Ports.point <= p.size) & (p.size <= 32767 * Ports.point) THEN
                    size := p.size
                ELSE EXCL(valid, Properties.size)
                END;
                IF Properties.style IN valid THEN
                    style := style - p.style.mask + p.style.val * p.style.mask
                END;
                IF (Properties.weight IN valid) & (1 <= p.weight) & (p.weight <= 1000) THEN
                    weight := p.weight
                ELSE EXCL(valid, Properties.weight)
                END;
                IF valid - {Properties.typeface .. Properties.weight} # valid THEN
                    a.font := Fonts.dir.This(face, size, style, weight)
                END
            | p: Prop DO
                IF offset IN valid THEN a.offset := p.offset END
            ELSE
            END;
            p := p.next
        END
    END ModifyFromProp;


    PROCEDURE ReadAttr* (VAR rd: Stores.Reader; VAR a: Attributes);
        VAR st: Stores.Store; alien: AlienAttributes;
    BEGIN
        rd.ReadStore(st); ASSERT(st # NIL, 20);
        IF st IS Stores.Alien THEN
            NEW(alien); alien.store := st(Stores.Alien); Stores.Join(alien, alien.store);
            alien.InitFromProp(NIL); a := alien;
            Stores.Report("#Text:AlienAttributes", "", "", "")
        ELSE a := st(Attributes)
        END
    END ReadAttr;

    PROCEDURE WriteAttr* (VAR wr: Stores.Writer; a: Attributes);
    BEGIN
        ASSERT(a # NIL, 20); ASSERT(a.init, 21);
        WITH a: AlienAttributes DO wr.WriteStore(a.store) ELSE wr.WriteStore(a) END
    END WriteAttr;

    PROCEDURE ModifiedAttr* (a: Attributes; p: Properties.Property): Attributes;
    (** pre: a.init **)
    (** post: x IN p.valid => x in new attr set to value in p, else set to value in a **)
        VAR h: Attributes;
    BEGIN
        ASSERT(a.init, 20);
        h := Stores.CopyOf(a)(Attributes); h.ModifyFromProp(p);
        RETURN h
    END ModifiedAttr;


    (** AlienAttributes **)

    PROCEDURE (a: AlienAttributes) Externalize- (VAR wr: Stores.Writer);
    BEGIN
        HALT(100)
    END Externalize;

    PROCEDURE (a: AlienAttributes) CopyFrom- (source: Stores.Store);
    BEGIN
        a.CopyFrom^(source);
        a.store := Stores.CopyOf(source(AlienAttributes).store)(Stores.Alien);
        Stores.Join(a, a.store)
    END CopyFrom;

    PROCEDURE (a: AlienAttributes) Prop* (): Properties.Property;
    BEGIN
        RETURN NIL
    END Prop;

    PROCEDURE (a: AlienAttributes) ModifyFromProp- (p: Properties.Property);
    END ModifyFromProp;


    (** Prop **)

    PROCEDURE (p: Prop) IntersectWith* (q: Properties.Property; OUT equal: BOOLEAN);
        VAR valid: SET;
    BEGIN
        WITH q: Prop DO
            valid := p.valid * q.valid; equal := TRUE;
            IF p.offset # q.offset THEN EXCL(valid, offset) END;
            IF p.code # q.code THEN EXCL(valid, code) END;
            IF p.valid # valid THEN p.valid := valid; equal := FALSE END
        END
    END IntersectWith;


    (** Context **)

    PROCEDURE (c: Context) ThisModel* (): Model, ABSTRACT;
    PROCEDURE (c: Context) Pos* (): INTEGER, NEW, ABSTRACT;
    PROCEDURE (c: Context) Attr* (): Attributes, NEW, ABSTRACT;


    (** Reader **)

    PROCEDURE (rd: Reader) Base* (): Model, NEW, ABSTRACT;
    PROCEDURE (rd: Reader) SetPos* (pos: INTEGER), NEW, ABSTRACT;
    PROCEDURE (rd: Reader) Pos* (): INTEGER, NEW, ABSTRACT;
    PROCEDURE (rd: Reader) Read*, NEW, ABSTRACT;
    PROCEDURE (rd: Reader) ReadPrev*, NEW, ABSTRACT;

    PROCEDURE (rd: Reader) ReadChar* (OUT ch: CHAR), NEW, ABSTRACT;
(*
    BEGIN
        rd.Read; ch := rd.char
    END ReadChar;
*)
    PROCEDURE (rd: Reader) ReadPrevChar* (OUT ch: CHAR), NEW, ABSTRACT;
(*
    BEGIN
        rd.ReadPrev; ch := rd.char
    END ReadPrevChar;
*)
    PROCEDURE (rd: Reader) ReadView* (OUT v: Views.View), NEW, ABSTRACT;
(*
    BEGIN
        REPEAT rd.Read UNTIL (rd.view # NIL) OR rd.eot;
        v := rd.view
    END ReadView;
*)
    PROCEDURE (rd: Reader) ReadPrevView* (OUT v: Views.View), NEW, ABSTRACT;
(*
    BEGIN
        REPEAT rd.ReadPrev UNTIL (rd.view # NIL) OR rd.eot;
        v := rd.view
    END ReadPrevView;
*)
    PROCEDURE (rd: Reader) ReadRun* (OUT attr: Attributes), NEW, ABSTRACT;
    (** post: rd.eot OR a # NIL, rd.view = ViewAt(rd.Pos() - 1) **)
(*
        VAR a: Attributes;
    BEGIN
        a := rd.attr;
        REPEAT rd.Read UNTIL (rd.attr # a) OR (rd.view # NIL) OR rd.eot;
        IF rd.eot THEN attr := NIL ELSE attr := rd.attr END
    END ReadRun;
*)
    PROCEDURE (rd: Reader) ReadPrevRun* (OUT attr: Attributes), NEW, ABSTRACT;
    (** post: rd.eot OR a # NIL, rd.view = ViewAt(rd.Pos()) **)
(*
        VAR a: Attributes;
    BEGIN
        a := rd.attr;
        REPEAT rd.ReadPrev UNTIL (rd.attr # a) OR (rd.view # NIL) OR rd.eot;
        IF rd.eot THEN attr := NIL ELSE attr := rd.attr END
    END ReadPrevRun;
*)

    (** Writer **)

    PROCEDURE (wr: Writer) Base* (): Model, NEW, ABSTRACT;
    PROCEDURE (wr: Writer) SetPos* (pos: INTEGER), NEW, ABSTRACT;
    PROCEDURE (wr: Writer) Pos* (): INTEGER, NEW, ABSTRACT;
    (* PROCEDURE (wr: Writer) WriteSChar* (ch: SHORTCHAR), NEW, ABSTRACT; *)
    PROCEDURE (wr: Writer) WriteChar* (ch: CHAR), NEW, ABSTRACT;
    PROCEDURE (wr: Writer) WriteView* (view: Views.View; w, h: INTEGER), NEW, ABSTRACT;

    PROCEDURE (wr: Writer) SetAttr* (attr: Attributes), NEW(*, EXTENSIBLE*);
    BEGIN
        ASSERT(attr # NIL, 20); ASSERT(attr.init, 21); wr.attr := attr
    END SetAttr;


    (** Directory **)

    PROCEDURE (d: Directory) New* (): Model, NEW, ABSTRACT;

    PROCEDURE (d: Directory) NewFromString* (s: ARRAY OF CHAR): Model, NEW, EXTENSIBLE;
        VAR m: Model; w: Writer; i: INTEGER;
    BEGIN
        m := d.New(); w := m.NewWriter(NIL);
        i := 0; WHILE s[i] # 0X DO w.WriteChar(s[i]); INC(i) END;
        RETURN m
    END NewFromString;

    PROCEDURE (d: Directory) SetAttr* (attr: Attributes), NEW, EXTENSIBLE;
    BEGIN
        ASSERT(attr.init, 20); d.attr := attr
    END SetAttr;


    (* StdModel - foundation *)

    PROCEDURE OpenSpill (s: SpillFile);
    BEGIN
        s.file := Files.dir.Temp(); s.len := 0;
        s.writer := s.file.NewWriter(NIL)
    END OpenSpill;

    PROCEDURE Find (t: StdModel; VAR pos: INTEGER; VAR u: Run; VAR off: INTEGER);
    (* post: 0 <= pos <= t.len, 0 <= off < u.len, Pos(u) + off = pos *)
    (* Read/Write rely on Find to force pos into the legal range *)
        VAR v: Run; m: INTEGER;
    BEGIN
        IF pos < 0 THEN pos := 0 END;
        IF pos >= t.len THEN
            u := t.trailer; off := 0; t.pc.prev := t.trailer; t.pc.org := 0
        ELSE
            v := t.pc.prev.next; m := pos - t.pc.org;
            IF m >= 0 THEN
                WHILE m >= v.len DO DEC(m, v.len); v := v.next END
            ELSE
                WHILE m < 0 DO v := v.prev; INC(m, v.len) END
            END;
            u := v; off := m; t.pc.prev := v.prev; t.pc.org := pos - m
        END
    END Find;

    PROCEDURE Split (off: INTEGER; VAR u, un: Run);
    (* pre: 0 <= off <= u.len *)
    (* post: u.len = off, u.len + un.len = u'.len, Pos(u) + u.len = Pos(un) *)
        VAR lp: LPiece; sp: Piece;
    BEGIN
        IF off = 0 THEN un := u; u := un.prev    (* "split" at left edge of run *)
        ELSIF off < u.len THEN    (* u.len > 1 => u IS LPiece; true split *)
            WITH u: Piece DO
                NEW(sp); sp^ := u^; INC(sp.org, off);
                un := sp
            ELSE    (* u IS LPiece) & ~(u IS Piece) *)
                NEW(lp);
                lp.prev := u.prev; lp.next := u.next; lp.len := u.len; lp.attr := u.attr;
                lp.file := u(LPiece).file; lp.org := u(LPiece).org;
                INC(lp.org, 2 * off);
                un := lp
            END;
            DEC(un.len, off); DEC(u.len, un.len);
            un.prev := u; un.next := u.next; un.next.prev := un; u.next := un
        ELSIF off = u.len THEN un := u.next    (* "split" at right edge of run *)
        ELSE HALT(100)
        END
    END Split;

    PROCEDURE Merge (t: StdModel; u: Run; VAR v: Run);
        VAR p, q: LPiece;
    BEGIN
        WITH u: Piece DO
            IF (v IS Piece) & ((u.attr = v.attr) OR u.attr.Equals(v.attr)) THEN
                p := u; q := v(Piece);
                IF (p.file = q.file) & (p.org + p.len = q.org) THEN
                    IF t.pc.prev = p THEN INC(t.pc.org, q.len)
                    ELSIF t.pc.prev = q THEN t.pc.prev := t.trailer; t.pc.org := 0
                    END;
                    INC(p.len, q.len); v := v.next
                END
            END
        | u: LPiece DO    (* ~(u IS Piece) *)
            IF (v IS LPiece) & ~(v IS Piece) & ((u.attr = v.attr) OR u.attr.Equals(v.attr)) THEN
                p := u(LPiece); q := v(LPiece);
                IF (p.file = q.file) & (p.org + 2 * p.len = q.org) THEN
                    IF t.pc.prev = p THEN INC(t.pc.org, q.len)
                    ELSIF t.pc.prev = q THEN t.pc.prev := t.trailer; t.pc.org := 0
                    END;
                    INC(p.len, q.len); v := v.next
                END
            END
        ELSE    (* ignore: can't merge ViewRef runs *)
        END
    END Merge;

    PROCEDURE Splice (un, v, w: Run);    (* (u, un) -> (u, v ... w, un) *)
        VAR u: Run;
    BEGIN
        IF v # w.next THEN    (* non-empty stretch v ... w *)
            u := un.prev;
            u.next := v; v.prev := u; un.prev := w; w.next := un
        END
    END Splice;

    PROCEDURE NewContext (r: ViewRef; text: StdModel): StdContext;
        VAR c: StdContext;
    BEGIN
        NEW(c); c.text := text; c.ref := r; 
        Stores.Join(text, r.view);
        RETURN c
    END NewContext;

    PROCEDURE CopyOfPiece (p: LPiece): LPiece;
        VAR lp: LPiece; sp: Piece;
    BEGIN
        WITH p: Piece DO NEW(sp); sp^ := p^; RETURN sp
        ELSE
            NEW(lp);
            lp.prev := p.prev; lp.next := p.next; lp.len := p.len; lp.attr := p.attr;
            lp.file := p(LPiece).file; lp.org := p(LPiece).org; 
            RETURN lp
        END
    END CopyOfPiece;

    PROCEDURE CopyOfViewRef (r: ViewRef; text: StdModel): ViewRef;
        VAR v: ViewRef;
    BEGIN
        NEW(v); v^ := r^;
        v.view := Views.CopyOf(r.view, Views.deep);
        v.view.InitContext(NewContext(v, text));
        RETURN v
    END CopyOfViewRef;

    PROCEDURE InvalCache (t: StdModel; pos: INTEGER);
        VAR n: INTEGER;
    BEGIN
        n := t.id MOD cacheWidth;
        IF cache[n].id = t.id THEN
            IF pos <= cache[n].beg THEN cache[n].beg := 0; cache[n].end := 0
            ELSIF pos < cache[n].end THEN cache[n].end := pos
            END
        END
    END InvalCache;

    PROCEDURE StdInit (t: StdModel);
        VAR u: Run;
    BEGIN
        IF t.trailer = NIL THEN
            NEW(u); u.len := MAX(INTEGER); u.attr := NIL; u.next := u; u.prev := u;
            t.len := 0; t.id := nextId; INC(nextId); t.era := 0; t.trailer := u;
            t.pc.prev := u; t.pc.org := 0;
            IF t.spill = NIL THEN NEW(t.spill) END
        END
    END StdInit;

    PROCEDURE CopyOf (src: StdModel; beg, end: INTEGER; dst: StdModel): StdModel;
        VAR buf: StdModel; u, v, r, z, zn: Run; ud, vd: INTEGER;
    BEGIN
        ASSERT(beg < end, 20);
        buf := Containers.CloneOf(dst)(StdModel); 
        ASSERT(buf.Domain() = NIL, 100);
        Find(src, beg, u, ud); Find(src, end, v, vd);
        z := buf.trailer; r := u;
        WHILE r # v DO
            WITH r: LPiece DO    (* Piece or LPiece *)
                zn := CopyOfPiece(r); DEC(zn.len, ud);
                IF zn IS Piece THEN INC(zn(LPiece).org, ud) ELSE INC(zn(LPiece).org, 2 * ud) END
            | r: ViewRef DO
                zn := CopyOfViewRef(r, buf)
            ELSE (* ignore *)
            END;
            z.next := zn; zn.prev := z; z := zn; r := r.next; ud := 0
        END;
        IF vd > 0 THEN    (* v IS LPiece *)
            zn := CopyOfPiece(v(LPiece)); zn.len := vd - ud;
            IF zn IS Piece THEN INC(zn(LPiece).org, ud) ELSE INC(zn(LPiece).org, 2 * ud) END;
            z.next := zn; zn.prev := z; z := zn
        END;
        z.next := buf.trailer; buf.trailer.prev := z;
        buf.len := end - beg;
        RETURN buf
    END CopyOf;

    PROCEDURE ProjectionOf (src: Model; beg, end: INTEGER; dst: StdModel): StdModel;
    (* rider-conversion to eliminate covariance conflicts in binary operations *)
        VAR buf: StdModel; rd: Reader; wr: Writer;
    BEGIN
        rd := src.NewReader(NIL); rd.SetPos(beg);
        buf := Containers.CloneOf(dst)(StdModel); ASSERT(buf.Domain() = NIL, 100);
        wr := buf.NewWriter(NIL);
        WHILE beg < end DO
            INC(beg);
            rd.Read; wr.SetAttr(rd.attr);
            IF rd.view # NIL THEN
                wr.WriteView(Views.CopyOf(rd.view, Views.deep), rd.w, rd.h)
            ELSE
                wr.WriteChar(rd.char)
            END
        END;
        RETURN buf
    END ProjectionOf;

    PROCEDURE Move (src: StdModel; beg, end: INTEGER; dest: StdModel; pos: INTEGER);
        VAR pc: PieceCache; view: Views.View;
            u, un, v, vn, w, wn: Run; ud, vd, wd: INTEGER;
            (*initDom: BOOLEAN; newDom, dom: Stores.Domain;*)
            upd: UpdateMsg; neut: Models.NeutralizeMsg;
    BEGIN
        Models.Broadcast(src, neut);
        Find(src, beg, u, ud); Split(ud, u, un); pc := src.pc;
        Find(src, end, v, vd); Split(vd, v, vn); src.pc := pc;
        Merge(src, u, vn); u.next := vn; vn.prev := u;
        DEC(src.len, end - beg);
        InvalCache(src, beg);
        INC(src.era);
        upd.op := delete; upd.beg := beg; upd.end := beg + 1; upd.delta := beg - end;
        Models.Broadcast(src, upd);
        IF src = dest THEN
            IF pos > end THEN DEC(pos, end - beg) END
        ELSE
            (*newDom := dest.Domain(); initDom := (src.Domain() = NIL) & (newDom # NIL);*)
            w := un;
            WHILE w # vn DO
                (*
                IF initDom THEN
                    dom := w.attr.Domain();
                    IF (dom # NIL) & (dom # newDom) THEN w.attr := Stores.CopyOf(w.attr)(Attributes) END;
                    Stores.InitDomain(w.attr, newDom)
                END;
                *)
                IF ~Stores.Joined(dest, w.attr) THEN
                    IF ~Stores.Unattached(w.attr) THEN w.attr := Stores.CopyOf(w.attr)(Attributes) END;
                    Stores.Join(dest, w.attr)
                END;
                WITH w: ViewRef DO
                    view := w.view;
                    (*IF initDom THEN Stores.InitDomain(view, newDom) END;*)
                    Stores.Join(dest, view);
                    view.context(StdContext).text := dest
                ELSE
                END;
                w := w.next
            END
        END;
        Find(dest, pos, w, wd); Split(wd, w, wn); Splice(wn, un, v);
        v := wn.prev; Merge(dest, v, wn); v.next := wn; wn.prev := v;
        wn := w.next; Merge(dest, w, wn); w.next := wn; wn.prev := w;
        INC(dest.len, end - beg);
        InvalCache(dest, pos);
        INC(dest.era);
        upd.op := insert; upd.beg := pos; upd.end := pos + end - beg; upd.delta := end - beg;
        Models.Broadcast(dest, upd)
    END Move;


    (* StdModel - operations *)

    PROCEDURE (op: MoveOp) Do;
        VAR src, dest: StdModel; beg, end, pos: INTEGER; neut: Models.NeutralizeMsg;
    BEGIN
        src := op.src; beg := op.beg; end := op.end; dest := op.dest; pos := op.pos;
        IF src = dest THEN
            IF pos < beg THEN
                op.pos := end; op.beg := pos; op.end := pos + end - beg
            ELSE
                op.pos := beg; op.beg := pos - (end - beg); op.end := pos
            END
        ELSE
            Models.Broadcast(op.src, neut);    (* destination is neutralized by sequencer *)
            op.dest := src; op.src := dest;
            op.pos := beg; op.beg := pos; op.end := pos + end - beg
        END;
        Move(src, beg, end, dest, pos)
    END Do;

    PROCEDURE DoMove (name: Stores.OpName;
        src: StdModel; beg, end: INTEGER;
        dest: StdModel; pos: INTEGER
    );
        VAR op: MoveOp;
    BEGIN
        IF (beg < end) & ((src # dest) OR ~((beg <= pos) & (pos <= end))) THEN
            NEW(op);
            op.src := src; op.beg := beg; op.end := end;
            op.dest := dest; op.pos := pos;
            Models.Do(dest, name, op)
        END
    END DoMove;


    PROCEDURE (op: EditOp) Do;
        VAR text: StdModel; (*newDom, dom: Stores.Domain;*) pc: PieceCache;
            u, un, v, vn: Run; sp: Piece; lp: LPiece; r: ViewRef;
            ud, vd, beg, end, pos, len: INTEGER; w, h: INTEGER;
            upd: UpdateMsg;
    BEGIN
        text := op.text;
        CASE op.mode OF
          deleteRange:
            beg := op.beg; end := op.end; len := end - beg;
            Find(text, beg, u, ud); Split(ud, u, un); pc := text.pc;
            Find(text, end, v, vd); Split(vd, v, vn); text.pc := pc;
            Merge(text, u, vn); u.next := vn; vn.prev := u;
            DEC(text.len, len);
            InvalCache(text, beg);
            INC(text.era);
            op.mode := moveBuf; op.canBunch := FALSE;
            op.pos := beg; op.first := un; op.last := v; op.len := len;
            upd.op := delete; upd.beg := beg; upd.end := beg + 1; upd.delta := -len;
            Models.Broadcast(text, upd)
        | moveBuf:
            pos := op.pos;
            Find(text, pos, u, ud); Split(ud, u, un); Splice(un, op.first, op.last);
            INC(text.len, op.len);
            InvalCache(text, pos);
            INC(text.era);
            op.mode := deleteRange;
            op.beg := pos; op.end := pos + op.len;
            upd.op := insert; upd.beg := pos; upd.end := pos + op.len; upd.delta := op.len;
            Models.Broadcast(text, upd)
        | writeSChar:
            pos := op.pos;
            InvalCache(text, pos);
            Find(text, pos, u, ud); Split(ud, u, un);
            IF (u.attr = op.attr) & (u IS Piece) & (u(Piece).file = text.spill.file)
            & (u(Piece).org + u.len = op.len) THEN
                INC(u.len);
                IF text.pc.org >= pos THEN INC(text.pc.org) END
            ELSE
                (*
                newDom := text.Domain();
                IF newDom # NIL THEN
                    dom := op.attr.Domain();
                    IF (dom # NIL) & (dom # newDom) THEN
                        op.attr := Stores.CopyOf(op.attr)(Attributes)
                    END;
                    Stores.InitDomain(op.attr, newDom)
                END;
                *)
                IF ~Stores.Joined(text, op.attr) THEN
                    IF ~Stores.Unattached(op.attr) THEN op.attr := Stores.CopyOf(op.attr)(Attributes) END;
                    Stores.Join(text, op.attr)
                END;
                NEW(sp); u.next := sp; sp.prev := u; sp.next := un; un.prev := sp;
                sp.len := 1; sp.attr := op.attr;
                sp.file := text.spill.file; sp.org := op.len;
                IF text.pc.org > pos THEN INC(text.pc.org) END
            END;
            INC(text.len); INC(text.era);
            op.mode := deleteRange;
            upd.op := insert; upd.beg := pos; upd.end := pos + 1; upd.delta := 1;
            Models.Broadcast(text, upd)
        | writeChar:
            pos := op.pos;
            InvalCache(text, pos);
            Find(text, pos, u, ud); Split(ud, u, un);
            IF (u.attr = op.attr) & (u IS LPiece) & ~(u IS Piece) & (u(LPiece).file = text.spill.file)
            & (u(LPiece).org + 2 * u.len = op.len) THEN
                INC(u.len);
                IF text.pc.org >= pos THEN INC(text.pc.org) END
            ELSE
                (*
                newDom := text.Domain();
                IF newDom # NIL THEN
                    dom := op.attr.Domain();
                    IF (dom # NIL) & (dom # newDom) THEN
                        op.attr := Stores.CopyOf(op.attr)(Attributes)
                    END;
                    Stores.InitDomain(op.attr, newDom)
                END;
                *)
                IF ~Stores.Joined(text, op.attr) THEN
                    IF ~Stores.Unattached(op.attr) THEN op.attr := Stores.CopyOf(op.attr)(Attributes) END;
                    Stores.Join(text, op.attr)
                END;
                NEW(lp); u.next := lp; lp.prev := u; lp.next := un; un.prev := lp;
                lp.len := 1; lp.attr := op.attr;
                lp.file := text.spill.file; lp.org := op.len;
                IF text.pc.org > pos THEN INC(text.pc.org) END
            END;
            INC(text.len); INC(text.era);
            op.mode := deleteRange;
            upd.op := insert; upd.beg := pos; upd.end := pos + 1; upd.delta := 1;
            Models.Broadcast(text, upd)
        | writeView:
            pos := op.pos; r := op.first(ViewRef);
            InvalCache(text, pos);
            Find(text, pos, u, ud); Split(ud, u, un);
            u.next := r; r.prev := u; r.next := un; un.prev := r;
            INC(text.len); INC(text.era);
            r.view.InitContext(NewContext(r, text));
            (* Stores.InitDomain(r.view, text.Domain()); *)
            Stores.Join(text, r.view);
            w := r.w; h := r.h; r.w := defW; r.h := defH;
            Properties.PreferredSize(r.view, minWidth, maxWidth, minHeight, maxHeight, defW, defH,
                w, h
            );
            r.w := w; r.h := h;
            op.mode := deleteRange;
            upd.op := insert; upd.beg := pos; upd.end := pos + 1; upd.delta := 1;
            Models.Broadcast(text, upd)
        END
    END Do;

    PROCEDURE GetWriteOp (t: StdModel; pos: INTEGER; VAR op: EditOp; VAR bunch: BOOLEAN);
        VAR last: Stores.Operation;
    BEGIN
        last := Models.LastOp(t);
        IF (last # NIL) & (last IS EditOp) THEN
            op := last(EditOp);
            bunch := op.canBunch & (op.end = pos)
        ELSE bunch := FALSE
        END;
        IF bunch THEN
            INC(op.end)
        ELSE
            NEW(op); op.canBunch := TRUE;
            op.text := t; op.beg := pos; op.end := pos + 1
        END;
        op.pos := pos
    END GetWriteOp;


    PROCEDURE SetPreferredSize (t: StdModel; v: Views.View);
        VAR minW, maxW, minH, maxH, w, h: INTEGER;
    BEGIN
        t.GetEmbeddingLimits(minW, maxW, minH, maxH);
        v.context.GetSize(w, h);
        Properties.PreferredSize(v, minW, maxW, minH, maxH, w, h, w, h);
        v.context.SetSize(w, h)
    END SetPreferredSize;

    PROCEDURE (op: SetAttrOp) Do;
        VAR t: StdModel; attr: Attributes; z: AttrList; (*checkDom: BOOLEAN;*)
            pc: PieceCache; u, un, v, vn: Run; ud, vd, pos, next: INTEGER;
            upd: UpdateMsg;
    BEGIN
        t := op.text; z := op.list; pos := op.beg; (*checkDom := t.Domain() # NIL;*)
        WHILE z # NIL DO
            next := pos + z.len;
            IF z.attr # NIL THEN
                Find(t, pos, u, ud); Split(ud, u, un); pc := t.pc;
                Find(t, next, v, vd); Split(vd, v, vn); t.pc := pc;
                attr := un.attr;
                WHILE un # vn DO
                    un.attr := z.attr;
                    (*
                    IF checkDom & (un.attr.Domain() # t.Domain()) THEN
                        IF un.attr.Domain() # NIL THEN un.attr := Stores.CopyOf(un.attr)(Attributes) END;
                        Stores.InitDomain(un.attr, t.Domain())
                    END;
                    *)
                    IF ~Stores.Joined(t, un.attr) THEN
                        IF ~Stores.Unattached(un.attr) THEN un.attr := Stores.CopyOf(un.attr)(Attributes) END;
                        Stores.Join(t, un.attr)
                    END;
                    Merge(t, u, un);
                    WITH un: ViewRef DO SetPreferredSize(t, un.view) ELSE END;
                    IF u.next = un THEN u := un; un := un.next ELSE u.next := un; un.prev := u END
                END;
                Merge(t, u, un); u.next := un; un.prev := u;
                z.attr := attr
            END;
            pos := next; z := z.next
        END;
        INC(t.era);
        upd.op := replace; upd.beg := op.beg; upd.end := pos; upd.delta := 0;
        Models.Broadcast(t, upd)
    END Do;


    PROCEDURE (op: ResizeViewOp) Do;
        VAR r: ViewRef; w, h: INTEGER; upd: UpdateMsg;
    BEGIN
        r := op.ref;
        w := op.w; h := op.h;  op.w := r.w; op.h := r.h;  r.w := w; r.h := h;
        INC(op.text.era);
        upd.op := replace; upd.beg := op.pos; upd.end := op.pos + 1; upd.delta := 0;
        Models.Broadcast(op.text, upd)
    END Do;


    PROCEDURE (op: ReplaceViewOp) Do;
        VAR new: Views.View; upd: UpdateMsg;
    BEGIN
        new := op.new; op.new := op.ref.view; op.ref.view := new;
        INC(op.text.era);
        upd.op := replace; upd.beg := op.pos; upd.end := op.pos + 1; upd.delta := 0;
        Models.Broadcast(op.text, upd)
    END Do;


    (* StdModel *)

    PROCEDURE (t: StdModel) InitFrom (source: Containers.Model);
    BEGIN
        WITH source: StdModel DO
            ASSERT(source.trailer # NIL, 20);
            t.spill := source.spill;    (* reduce no of temp files: share spill files among clones *)
            StdInit(t)
        END
    END InitFrom;

    PROCEDURE WriteCharacters (t: StdModel; VAR wr: Stores.Writer);
        VAR r: Files.Reader; u: Run; len: INTEGER;
(*
            sp: Properties.StorePref;
*)
            buf: ARRAY 1024 OF BYTE;
    BEGIN
        r := NIL;
        u := t.trailer.next;
        WHILE u # t.trailer DO
            WITH u: Piece DO
                r := u.file.NewReader(r); r.SetPos(u.org);
                len := u.len;
                WHILE len > LEN(buf) DO
                    r.ReadBytes(buf, 0, LEN(buf)); wr.rider.WriteBytes(buf, 0, LEN(buf));
                    DEC(len, LEN(buf))
                END;
                r.ReadBytes(buf, 0, len); wr.rider.WriteBytes(buf, 0, len)
            | u: LPiece DO    (* ~(u IS Piece) *)
                r := u.file.NewReader(r); r.SetPos(u.org);
                len := 2 * u.len;
                WHILE len > LEN(buf) DO
                    r.ReadBytes(buf, 0, LEN(buf)); wr.rider.WriteBytes(buf, 0, LEN(buf));
                    DEC(len, LEN(buf))
                END;
                r.ReadBytes(buf, 0, len); wr.rider.WriteBytes(buf, 0, len)
            | u: ViewRef DO
(*
                sp.view := u.view; Views.HandlePropMsg(u.view, sp);
                IF sp.view # NIL THEN wr.WriteSChar(viewcode) END
*)
                IF Stores.ExternalizeProxy(u.view) # NIL THEN
                    wr.WriteSChar(viewcode)
                END
            END;
            u := u.next
        END
    END WriteCharacters;

    PROCEDURE WriteAttributes (VAR wr: Stores.Writer; t: StdModel;
        a: Attributes; VAR dict: AttrDict
    );
        VAR k, len: BYTE;
    BEGIN
        len := dict.len; k := 0; WHILE (k # len) & ~a.Equals(dict.attr[k]) DO INC(k) END;
        wr.WriteByte(k);
        IF k = len THEN
            IF len < dictSize THEN dict.attr[len] := a; INC(dict.len) END;
            (* ASSERT(Stores.Joined(t, a)); but bkwd-comp: *)
            (* IF a.Domain() # d THEN always copy: bkwd-comp hack to avoid link *)
                a := Stores.CopyOf(a)(Attributes); (* Stores.InitDomain(a, d); *) Stores.Join(t, a);
            (* END; *)
            WriteAttr(wr, a)
        END
    END WriteAttributes;

    PROCEDURE (t: StdModel) Externalize (VAR wr: Stores.Writer);
        VAR (*dom: Stores.Domain;*) u, v, un: Run;
            attr: Attributes; dict: AttrDict;
            org, runlen, pos: INTEGER; lchars: BOOLEAN;
            inf: InfoMsg;
    BEGIN
        t.Externalize^(wr);
        StdInit(t); (*dom := t.Domain();*)
        wr.WriteVersion(0);
        wr.WriteInt(0); org := wr.Pos();
        u := t.trailer.next; v := t.trailer; dict.len := 0; lchars := FALSE;
        WHILE u # v DO
            attr := u.attr;
            WITH u: Piece DO
                runlen := u.len; un := u.next;
                WHILE (un IS Piece) & un.attr.Equals(attr) DO
                    INC(runlen, un.len); un := un.next
                END;
                WriteAttributes(wr, t, attr, dict); wr.WriteInt(runlen)
            | u: LPiece DO    (* ~(u IS Piece) *)
                runlen := 2 * u.len; un := u.next;
                WHILE (un IS LPiece) & ~(un IS Piece) & un.attr.Equals(attr) DO
                    INC(runlen, 2 * un.len); un := un.next
                END;
                WriteAttributes(wr, t, attr, dict); wr.WriteInt(-runlen);
                lchars := TRUE
            | u: ViewRef DO
                IF Stores.ExternalizeProxy(u.view) # NIL THEN
                    WriteAttributes(wr, t, attr, dict); wr.WriteInt(0);
                    wr.WriteInt(u.w); wr.WriteInt(u.h); Views.WriteView(wr, u.view)
                END;
                un := u.next
            END;
            u := un
        END;
        wr.WriteByte(-1);
        pos := wr.Pos();
        wr.SetPos(org - 5);
        IF lchars THEN wr.WriteVersion(maxStdModelVersion)
        ELSE wr.WriteVersion(noLCharStdModelVersion)    (* version 0 did not support LONGCHAR *)
        END;
        wr.WriteInt(pos - org);
        wr.SetPos(pos);
        WriteCharacters(t, wr);
        inf.op := store; Models.Broadcast(t, inf)
    END Externalize;

    PROCEDURE (t: StdModel) Internalize (VAR rd: Stores.Reader);
        VAR u, un: Run; sp: Piece; lp: LPiece; v: ViewRef;
            org, len: INTEGER; ano: BYTE; thisVersion: INTEGER;
            attr: Attributes; dict: AttrDict;
    BEGIN
        ASSERT(t.Domain() = NIL, 20); ASSERT(t.len = 0, 21);
        t.Internalize^(rd); IF rd.cancelled THEN RETURN END;
        rd.ReadVersion(minVersion, maxStdModelVersion, thisVersion);
        IF rd.cancelled THEN RETURN END;
        StdInit(t);
        dict.len := 0; u := t.trailer;
        rd.ReadInt(len); org := rd.Pos() + len;
        rd.ReadByte(ano);
        WHILE ano # -1 DO
            IF ano = dict.len THEN
                ReadAttr(rd, attr); Stores.Join(t, attr);
                IF dict.len < dictSize THEN dict.attr[dict.len] := attr; INC(dict.len) END
            ELSE
                attr := dict.attr[ano]
            END;
            rd.ReadInt(len);
            IF len > 0 THEN    (* piece *)
                NEW(sp); sp.len := len; sp.attr := attr;
                sp.file := rd.rider.Base(); sp.org := org; un := sp;
                INC(org, len)
            ELSIF len < 0 THEN    (* longchar piece *)
                len := -len; ASSERT(~ODD(len), 100);
                NEW(lp); lp.len := len DIV 2; lp.attr := attr;
                lp.file := rd.rider.Base(); lp.org := org; un := lp;
                INC(org, len)
            ELSE    (* len = 0  =>  embedded view *)
                NEW(v); v.len := 1; v.attr := attr;
                rd.ReadInt(v.w); rd.ReadInt(v.h); Views.ReadView(rd, v.view);
                v.view.InitContext(NewContext(v, t));
                un := v; INC(org)
            END;
            INC(t.len, un.len); u.next := un; un.prev := u; u := un;
            rd.ReadByte(ano)
        END;
        rd.SetPos(org);
        u.next := t.trailer; t.trailer.prev := u
    END Internalize;

(*
    PROCEDURE (t: StdModel) PropagateDomain;
        VAR u: Run; dom: Stores.Domain;
    BEGIN
        IF t.Domain() # NIL THEN
            u := t.trailer.next;
            WHILE u # t.trailer DO
                dom := u.attr.Domain();
                IF (dom # NIL) & (dom # t.Domain()) THEN u.attr := Stores.CopyOf(u.attr)(Attributes) END;
                Stores.InitDomain(u.attr, t.Domain());
                WITH u: ViewRef DO Stores.InitDomain(u.view, t.Domain()) ELSE END;
                u := u.next
            END
        END
    END PropagateDomain;
*)

    PROCEDURE (t: StdModel) GetEmbeddingLimits (OUT minW, maxW, minH, maxH: INTEGER);
    BEGIN
        minW := minWidth; maxW := maxWidth; minH := minHeight; maxH := maxHeight
    END GetEmbeddingLimits;


    PROCEDURE (t: StdModel) Length (): INTEGER;
    BEGIN
        StdInit(t);
        RETURN t.len
    END Length;

    PROCEDURE (t: StdModel) NewReader (old: Reader): Reader;
        VAR rd: StdReader;
    BEGIN
        StdInit(t);
        IF (old # NIL) & (old IS StdReader) THEN rd := old(StdReader) ELSE NEW(rd) END;
        IF rd.base # t THEN
            rd.base := t; rd.era := -1; rd.SetPos(0)
        ELSIF rd.pos > t.len THEN
            rd.SetPos(t.len)
        END;
        rd.eot := FALSE;
        RETURN rd
    END NewReader;

    PROCEDURE (t: StdModel) NewWriter (old: Writer): Writer;
        VAR wr: StdWriter;
    BEGIN
        StdInit(t);
        IF (old # NIL) & (old IS StdWriter) THEN wr := old(StdWriter) ELSE NEW(wr) END;
        IF (wr.base # t) OR (wr.pos > t.len) THEN
            wr.base := t; wr.era := -1; wr.SetPos(t.len)
        END;
        wr.SetAttr(dir.attr);
        RETURN wr
    END NewWriter;

    PROCEDURE (t: StdModel) InsertCopy (pos: INTEGER; t0: Model; beg0, end0: INTEGER);
        VAR buf: StdModel;
    BEGIN
        StdInit(t);
        ASSERT(0 <= pos, 21); ASSERT(pos <= t.len, 22);
        ASSERT(0 <= beg0, 23); ASSERT(beg0 <= end0, 24); ASSERT(end0 <= t0.Length(), 25);
        IF beg0 < end0 THEN
            WITH t0: StdModel DO buf := CopyOf(t0, beg0, end0, t)
            ELSE buf := ProjectionOf(t0, beg0, end0, t)
            END;
            (* IF t.Domain() # NIL THEN Stores.InitDomain(buf,t.Domain()) END; *)
            Stores.Join(t, buf);
            DoMove("#System:Copying", buf, 0, buf.len, t, pos)
        END
    END InsertCopy;

    PROCEDURE (t: StdModel) Insert (pos: INTEGER; t0: Model; beg, end: INTEGER);
    BEGIN
        StdInit(t);
        ASSERT(0 <= pos, 21); ASSERT(pos <= t.len, 22);
        ASSERT(0 <= beg, 23); ASSERT(beg <= end, 24); ASSERT(end <= t0.Length(), 25);
        IF beg < end THEN
            IF (t.Domain() # NIL) & (t0 IS StdModel) & (t0.Domain() = t.Domain()) THEN
                DoMove("#System:Moving", t0(StdModel), beg, end, t, pos)
            ELSE    (* moving across domains *)
                t.InsertCopy(pos, t0, beg, end); t0.Delete(beg, end)
            END
        END
    END Insert;

    PROCEDURE (t: StdModel) Append (t0: Model);
        VAR len0: INTEGER;
    BEGIN
        StdInit(t);
        ASSERT(t # t0, 20);
        len0 := t0.Length();
        IF len0 > 0 THEN
            IF (t.Domain() # NIL) & (t0 IS StdModel) & (t0.Domain() = t.Domain()) THEN
                DoMove("#Text:Appending", t0(StdModel), 0, len0, t, t.len)
            ELSE    (* moving across domains *)
                t.InsertCopy(t.len, t0, 0, len0); t0.Delete(0, len0)
            END
        END
    END Append;

    PROCEDURE (t: StdModel) Delete (beg, end: INTEGER);
        VAR op: EditOp;
    BEGIN
        StdInit(t);
        ASSERT(0 <= beg, 20); ASSERT(beg <= end, 21); ASSERT(end <= t.len, 22);
        IF beg < end THEN
            NEW(op); op.mode := deleteRange; op.canBunch := FALSE;
            op.text := t; op.beg := beg; op.end := end;
            Models.Do(t, "#System:Deleting", op)
        END
    END Delete;

    PROCEDURE (t: StdModel) SetAttr (beg, end: INTEGER; attr: Attributes);
        VAR op: SetAttrOp; zp, z: AttrList;
            u, v, w: Run; ud, vd: INTEGER; modified: BOOLEAN;
    BEGIN
        StdInit(t);
        ASSERT(0 <= beg, 20); ASSERT(beg <= end, 21); ASSERT(end <= t.len, 22);
        IF beg < end THEN
            NEW(op); op.text := t; op.beg := beg;
            Find(t, beg, u, ud); Find(t, end, v, vd);
            IF vd > 0 THEN w := v.next ELSE w := v END;
            zp := NIL; modified := FALSE;
            WHILE u # w DO
                IF u = v THEN INC(ud, v.len - vd) END;
                NEW(z); z.len := u.len - ud; z.attr := attr;
                IF zp = NIL THEN op.list := z ELSE zp.next:= z END;
                zp := z;
                modified := modified OR ~u.attr.Equals(attr);
                u := u.next; ud := 0
            END;
            IF modified THEN Models.Do(t, "#Text:AttributeChange", op) END
        END
    END SetAttr;

    PROCEDURE (t: StdModel) Prop (beg, end: INTEGER): Properties.Property;
        VAR p, q: Properties.Property; tp: Prop;
            u, v, w: Run; ud, vd: INTEGER; equal: BOOLEAN;
            rd: Reader;
    BEGIN
        StdInit(t);
        ASSERT(0 <= beg, 20); ASSERT(beg <= end, 21); ASSERT(end <= t.len, 22);
        IF beg < end THEN
            Find(t, beg, u, ud); Find(t, end, v, vd);
            IF vd > 0 THEN w := v.next ELSE w := v END;
            p := u.attr.Prop();
            u := u.next;
            WHILE u # w DO
                Properties.Intersect(p, u.attr.Prop(), equal);
                u := u.next
            END;
            IF beg + 1 = end THEN
                t.rd := t.NewReader(t.rd); rd := t.rd;
                rd.SetPos(beg); rd.Read;
                IF (rd.view = NIL) OR (rd.char # viewcode) THEN
                    q := p; WHILE (q # NIL) & ~(q IS Prop) DO q := q.next END;
                    IF q # NIL THEN
                        tp := q(Prop)
                    ELSE NEW(tp); Properties.Insert(p, tp)
                    END;
                    INCL(tp.valid, code); INCL(tp.known, code); INCL(tp.readOnly, code);
                    tp.code := rd.char
                END
            END
        ELSE p := NIL
        END;
        RETURN p
    END Prop;

    PROCEDURE (t: StdModel) Modify (beg, end: INTEGER; old, p: Properties.Property);
        VAR op: SetAttrOp; zp, z: AttrList;
            u, v, w: Run; ud, vd: INTEGER; equal, modified: BOOLEAN;
            q: Properties.Property;
    BEGIN
        StdInit(t);
        ASSERT(0 <= beg, 20); ASSERT(beg <= end, 21); ASSERT(end <= t.len, 22);
        IF (beg < end) & (p # NIL) THEN
            NEW(op); op.text := t; op.beg := beg;
            Find(t, beg, u, ud); Find(t, end, v, vd);
            IF vd > 0 THEN w := v.next ELSE w := v END;
            zp := NIL; modified := FALSE;
            WHILE u # w DO
                IF u = v THEN INC(ud, v.len - vd) END;
                IF old # NIL THEN
                    q := u.attr.Prop();
                    Properties.Intersect(q, old, equal);    (* q := q * old *)
                    Properties.Intersect(q, old, equal)    (* equal := q = old *)
                END;
                NEW(z); z.len := u.len - ud;
                IF (old = NIL) OR equal THEN
                    z.attr := ModifiedAttr(u.attr, p);
                    modified := modified OR ~u.attr.Equals(z.attr)
                END;
                IF zp = NIL THEN op.list := z ELSE zp.next := z END;
                zp := z;
                u := u.next; ud := 0
            END;
            IF modified THEN Models.Do(t, "#System:Modifying", op) END
        END
    END Modify;

    PROCEDURE (t: StdModel) ReplaceView (old, new: Views.View);
        VAR c: StdContext; op: ReplaceViewOp;
    BEGIN
        StdInit(t);
        ASSERT(old.context # NIL, 20); ASSERT(old.context IS StdContext, 21);
        ASSERT(old.context(StdContext).text = t, 22);
        ASSERT((new.context = NIL) OR (new.context = old.context), 24);
        IF new # old THEN
            c := old.context(StdContext);
            IF new.context = NIL THEN new.InitContext(c) END;
            (* Stores.InitDomain(new, t.Domain()); *)
            Stores.Join(t, new);
            NEW(op); op.text := t; op.pos := c.Pos(); op.ref := c.ref; op.new := new;
            Models.Do(t, "#System:Replacing", op)
        END
    END ReplaceView;

    PROCEDURE (t: StdModel) CopyFrom- (source: Stores.Store);
    BEGIN
        StdInit(t);
        WITH source: StdModel DO t.InsertCopy(0, source, 0, source.len) END
    END CopyFrom;

    PROCEDURE (t: StdModel) Replace (beg, end: INTEGER; t0: Model; beg0, end0: INTEGER);
        VAR script: Stores.Operation;
    BEGIN
        StdInit(t);
        ASSERT(0 <= beg, 20); ASSERT(beg <= end, 21); ASSERT(end <= t.len, 22);
        ASSERT(0 <= beg0, 23); ASSERT(beg0 <= end0, 24); ASSERT(end0 <= t0.Length(), 25);
        ASSERT(t # t0, 26);
        Models.BeginScript(t, "#System:Replacing", script);
        t.Delete(beg, end); t.Insert(beg, t0, beg0, end0);
        Models.EndScript(t, script)
    END Replace;


    (* StdContext *)

    PROCEDURE (c: StdContext) ThisModel (): Model;
    BEGIN
        RETURN c.text
    END ThisModel;

    PROCEDURE (c: StdContext) GetSize (OUT w, h: INTEGER);
    BEGIN
        w := c.ref.w; h := c.ref.h
    END GetSize;

    PROCEDURE (c: StdContext) SetSize (w, h: INTEGER);
        VAR t: StdModel; r: ViewRef; op: ResizeViewOp;
    BEGIN
        t := c.text; r := c.ref;
        IF w = Views.undefined THEN w := r.w END;
        IF h = Views.undefined THEN h := r.h END;
        Properties.PreferredSize(r.view, minWidth, maxWidth, minHeight, maxHeight, r.w, r.h, w, h);
        IF (w # r.w) OR (h # r.h) THEN
            NEW(op); op.text := t; op.pos := c.Pos(); op.ref := r; op.w := w; op.h := h;
            Models.Do(t, "#System:Resizing", op)
        END
    END SetSize;

    PROCEDURE (c: StdContext) Normalize (): BOOLEAN;
    BEGIN
        RETURN FALSE
    END Normalize;

    PROCEDURE (c: StdContext) Pos (): INTEGER;
        VAR t: StdModel; u, r, w: Run; pos: INTEGER;
    BEGIN
        t := c.text; r := c.ref;
        IF t.pc.prev.next # r THEN
            u := t.trailer.next; w := t.trailer; pos := 0;
            WHILE (u # r) & (u # w) DO INC(pos, u.len); u := u.next END;
            ASSERT(u = r, 20);
            t.pc.prev := r.prev; t.pc.org := pos
        END;
        RETURN t.pc.org
    END Pos;

    PROCEDURE (c: StdContext) Attr (): Attributes;
    BEGIN
        RETURN c.ref.attr
    END Attr;


    (* StdReader *)

    PROCEDURE RemapView (rd: StdReader);
        VAR p: Pref;
    BEGIN
        p.opts := {}; Views.HandlePropMsg(rd.view, p);
        IF maskChar IN p.opts THEN rd.char := p.mask ELSE rd.char := viewcode END
    END RemapView;

    PROCEDURE Reset (rd: StdReader);
        VAR t: StdModel;
    BEGIN
        t := rd.base;
        Find(t, rd.pos, rd.run, rd.off); rd.era := t.era
    END Reset;


    PROCEDURE (rd: StdReader) Base (): Model;
    BEGIN
        RETURN rd.base
    END Base;

    PROCEDURE (rd: StdReader) SetPos (pos: INTEGER);
    BEGIN
        ASSERT(pos >= 0, 20); ASSERT(rd.base # NIL, 21); ASSERT(pos <= rd.base.len, 22);
        rd.eot := FALSE; rd.attr := NIL; rd.char := 0X; rd.view := NIL;
        IF (rd.pos # pos) OR (rd.run = rd.base.trailer) THEN
            rd.pos := pos; rd.era := -1
        END
    END SetPos;

    PROCEDURE (rd: StdReader) Pos (): INTEGER;
    BEGIN
        RETURN rd.pos
    END Pos;

    PROCEDURE (rd: StdReader) Read;
        VAR t: StdModel; u: Run; n, pos, len: INTEGER; lc: ARRAY 2 OF BYTE;
    BEGIN
        t := rd.base;
        n := t.id MOD cacheWidth;
        IF rd.era # t.era THEN Reset(rd) END;
        u := rd.run;
        WITH u: Piece DO
            rd.attr := u.attr;
            pos := rd.pos MOD cacheLen;
            IF ~((cache[n].id = t.id) & (cache[n].beg <= rd.pos) & (rd.pos < cache[n].end)) THEN
                (* cache miss *)
                IF cache[n].id # t.id THEN cache[n].id := t.id; cache[n].beg := 0; cache[n].end := 0 END;
                len := cacheLine;
                IF len > cacheLen - pos THEN len := cacheLen - pos END;
                IF len > u.len - rd.off THEN len := u.len - rd.off END;
                rd.reader := u.file.NewReader(rd.reader); rd.reader.SetPos(u.org + rd.off);
                rd.reader.ReadBytes(cache[n].buf, pos, len);
                IF rd.pos = cache[n].end THEN
cache[n].end := rd.pos + len;
(*
                    INC(cache[n].end, len);
*)
                    IF cache[n].end - cache[n].beg >= cacheLen THEN
                        cache[n].beg := cache[n].end - (cacheLen - 1)
                    END
                ELSE cache[n].beg := rd.pos; cache[n].end := rd.pos + len
                END
            END;
            rd.char := CHR(cache[n].buf[pos] MOD 256); rd.view := NIL;
            INC(rd.pos); INC(rd.off);
            IF rd.off = u.len THEN rd.run := u.next; rd.off := 0 END
        | u: LPiece DO    (* ~(u IS Piece) *)
            rd.attr := u.attr;
            rd.reader := u.file.NewReader(rd.reader); rd.reader.SetPos(u.org + rd.off * 2);
            rd.reader.ReadBytes(lc, 0, 2);
            rd.char := CHR(lc[0] MOD 256 + 256 * (lc[1] + 128)); rd.view := NIL;
            IF (cache[n].id = t.id) & (rd.pos = cache[n].end) THEN
cache[n].end := cache[n].end + 1;
IF cache[n].end - cache[n].beg >= cacheLen THEN cache[n].beg := cache[n].beg + 1 END;
(*
                INC(cache[n].end);
                IF cache[n].end - cache[n].beg >= cacheLen THEN INC(cache[n].beg) END
*)
            END;
            INC(rd.pos); INC(rd.off);
            IF rd.off = u.len THEN rd.run := u.next; rd.off := 0 END
        | u: ViewRef DO
            rd.attr := u.attr;
            rd.view := u.view; rd.w := u.w; rd.h := u.h; RemapView(rd);
            IF (cache[n].id = t.id) & (rd.pos = cache[n].end) THEN
cache[n].end := cache[n].end + 1;
IF cache[n].end - cache[n].beg >= cacheLen THEN cache[n].beg := cache[n].beg + 1 END;
(*
                INC(cache[n].end);
                IF cache[n].end - cache[n].beg >= cacheLen THEN INC(cache[n].beg) END
*)
            END;
            INC(rd.pos); rd.run := u.next; rd.off := 0
        ELSE
            rd.eot := TRUE; rd.attr := NIL; rd.char := 0X; rd.view := NIL
        END
    END Read;

    PROCEDURE (rd: StdReader) ReadPrev;
        VAR t: StdModel; u: Run; n, pos, len: INTEGER; lc: ARRAY 2 OF BYTE;
    BEGIN
        t := rd.base;
        n := t.id MOD cacheWidth;
        IF rd.era # t.era THEN Reset(rd) END;
        IF rd.off > 0 THEN DEC(rd.off)
        ELSIF rd.pos > 0 THEN
            rd.run := rd.run.prev; rd.off := rd.run.len - 1
        ELSE rd.run := t.trailer
        END;
        u := rd.run;
        WITH u: Piece DO
            rd.attr := u.attr;
            DEC(rd.pos);
            pos := rd.pos MOD cacheLen;
            IF ~((cache[n].id = t.id) & (cache[n].beg <= rd.pos) & (rd.pos < cache[n].end)) THEN
                (* cache miss *)
                IF cache[n].id # t.id THEN cache[n].id := t.id; cache[n].beg := 0; cache[n].end := 0 END;
                len := cacheLine;
                IF len > pos + 1 THEN len := pos + 1 END;
                IF len > rd.off + 1 THEN len := rd.off + 1 END;
                rd.reader := u.file.NewReader(rd.reader);
                rd.reader.SetPos(u.org + rd.off - (len - 1));
                rd.reader.ReadBytes(cache[n].buf, pos - (len - 1), len);
                IF rd.pos = cache[n].beg - 1 THEN
cache[n].beg := cache[n] .beg - len;
(*
                    DEC(cache[n].beg, len);
*)
                    IF cache[n].end - cache[n].beg >= cacheLen THEN
                        cache[n].end := cache[n].beg + (cacheLen - 1)
                    END
                ELSE cache[n].beg := rd.pos - (len - 1); cache[n].end := rd.pos + 1
                END
            END;
            rd.char := CHR(cache[n].buf[pos] MOD 256); rd.view := NIL
        | u: LPiece DO    (* ~(u IS Piece) *)
            rd.attr := u.attr;
            rd.reader := u.file.NewReader(rd.reader);
            rd.reader.SetPos(u.org + 2 * rd.off);
            rd.reader.ReadBytes(lc, 0, 2);
            rd.char := CHR(lc[0] MOD 256 + 256 * (lc[1] + 128)); rd.view := NIL;
            IF (cache[n].id = t.id) & (rd.pos = cache[n].beg) THEN
cache[n].beg := cache[n].beg - 1;
IF cache[n].end - cache[n].beg >= cacheLen THEN cache[n].end := cache[n].end - 1 END
(*
                DEC(cache[n].beg);
                IF cache[n].end - cache[n].beg >= cacheLen THEN DEC(cache[n].end) END
*)
            END;
            DEC(rd.pos)
        | u: ViewRef DO
            rd.attr := u.attr;
            rd.view := u.view; rd.w := u.w; rd.h := u.h; RemapView(rd);
            IF (cache[n].id = t.id) & (rd.pos = cache[n].beg) THEN
cache[n].beg := cache[n].beg - 1;
IF cache[n].end - cache[n].beg >= cacheLen THEN cache[n].end := cache[n].end - 1 END
(*
                DEC(cache[n].beg);
                IF cache[n].end - cache[n].beg >= cacheLen THEN DEC(cache[n].end) END
*)
            END;
            DEC(rd.pos)
        ELSE
            rd.eot := TRUE; rd.attr := NIL; rd.char := 0X; rd.view := NIL
        END
    END ReadPrev;

    PROCEDURE (rd: StdReader) ReadChar (OUT ch: CHAR);
    BEGIN
        rd.Read; ch := rd.char
    END ReadChar;

    PROCEDURE (rd: StdReader) ReadPrevChar (OUT ch: CHAR);
    BEGIN
        rd.ReadPrev; ch := rd.char
    END ReadPrevChar;

    PROCEDURE (rd: StdReader) ReadView (OUT v: Views.View);
        VAR t: StdModel; u: Run;
    BEGIN
        t := rd.base;
        IF rd.era # t.era THEN Reset(rd) END;
        DEC(rd.pos, rd.off);
        u := rd.run;
        WHILE u IS LPiece DO INC(rd.pos, u.len); u := u.next END;
        WITH u: ViewRef DO
            INC(rd.pos); rd.run := u.next; rd.off := 0;
            rd.attr := u.attr; rd.view := u.view; rd.w := u.w; rd.h := u.h; RemapView(rd)
        ELSE    (* u = t.trailer *)
            ASSERT(u = t.trailer, 100);
            rd.run := u; rd.off := 0;
            rd.eot := TRUE; rd.attr := NIL; rd.char := 0X; rd.view := NIL
        END;
        v := rd.view
    END ReadView;

    PROCEDURE (rd: StdReader) ReadPrevView (OUT v: Views.View);
        VAR t: StdModel; u: Run;
    BEGIN
        t := rd.base;
        IF rd.era # t.era THEN Reset(rd) END;
        DEC(rd.pos, rd.off);
        u := rd.run.prev;
        WHILE u IS LPiece DO DEC(rd.pos, u.len); u := u.prev END;
        rd.run := u; rd.off := 0;
        WITH u: ViewRef DO
            DEC(rd.pos);
            rd.attr := u.attr; rd.view := u.view; rd.w := u.w; rd.h := u.h; RemapView(rd)
        ELSE    (* u = t.trailer *)
            ASSERT(u = t.trailer, 100);
            rd.eot := TRUE; rd.attr := NIL; rd.char := 0X; rd.view := NIL
        END;
        v := rd.view
    END ReadPrevView;

    PROCEDURE (rd: StdReader) ReadRun (OUT attr: Attributes);
        VAR t: StdModel; a0: Attributes; u, trailer: Run; pos: INTEGER;
    BEGIN
        t := rd.base;
        IF rd.era # t.era THEN Reset(rd) END;
        a0 := rd.attr; u := rd.run; pos := rd.pos - rd.off; trailer := t.trailer;
        WHILE (u.attr = a0) & ~(u IS ViewRef) & (u # trailer) DO
            INC(pos, u.len); u := u.next
        END;
        rd.run := u; rd.pos := pos; rd.off := 0;
        rd.Read;
        attr := rd.attr
    END ReadRun;
    
    PROCEDURE (rd: StdReader) ReadPrevRun (OUT attr: Attributes);
        VAR t: StdModel; a0: Attributes; u, trailer: Run; pos: INTEGER;
    BEGIN
        t := rd.base;
        IF rd.era # t.era THEN Reset(rd) END;
        a0 := rd.attr; u := rd.run; pos := rd.pos - rd.off; trailer := t.trailer;
        IF u # trailer THEN u := u.prev; DEC(pos, u.len) END;
        WHILE (u.attr = a0) & ~(u IS ViewRef) & (u # trailer) DO
            u := u.prev; DEC(pos, u.len)
        END;
        IF u # trailer THEN
            rd.run := u.next; rd.pos := pos + u.len; rd.off := 0
        ELSE
            rd.run := trailer; rd.pos := 0; rd.off := 0
        END;
        rd.ReadPrev;
        attr := rd.attr
    END ReadPrevRun;


    (* StdWriter *)

    PROCEDURE WriterReset (wr: StdWriter);
        VAR t: StdModel; u: Run; uo: INTEGER;
    BEGIN
        t := wr.base;
        Find(t, wr.pos, u, uo); Split(uo, u, wr.run); wr.era := t.era
    END WriterReset;

    PROCEDURE (wr: StdWriter) Base (): Model;
    BEGIN
        RETURN wr.base
    END Base;

    PROCEDURE (wr: StdWriter) SetPos (pos: INTEGER);
    BEGIN
        ASSERT(pos >= 0, 20); ASSERT(wr.base # NIL, 21); ASSERT(pos <= wr.base.len, 22);
        IF wr.pos # pos THEN
            wr.pos := pos; wr.era := -1
        END
    END SetPos;

    PROCEDURE (wr: StdWriter) Pos (): INTEGER;
    BEGIN
        RETURN wr.pos
    END Pos;

    PROCEDURE WriteSChar (wr: StdWriter; ch: SHORTCHAR);
        VAR t: StdModel; u, un: Run; p: Piece; pos, spillPos: INTEGER;
            op: EditOp; bunch: BOOLEAN;
    BEGIN
        t := wr.base; pos := wr.pos;
        IF t.spill.file = NIL THEN OpenSpill(t.spill) END;
        t.spill.writer.WriteByte(SHORT(ORD(ch))); spillPos := t.spill.len; t.spill.len := spillPos + 1;
        IF (t.Domain() = NIL) OR (t.Domain().GetSequencer() = NIL) THEN
            (* optimized for speed - writing to unbound text *)
            InvalCache(t, pos);
            IF wr.era # t.era THEN WriterReset(wr) END;
            un := wr.run; u := un.prev;
            IF (u.attr # NIL) & u.attr.Equals(wr.attr) & (u IS Piece) & (u(Piece).file = t.spill.file)
            & (u(Piece).org + u.len = spillPos) THEN
                INC(u.len);
                IF t.pc.org >= pos THEN INC(t.pc.org) END
            ELSE
                NEW(p); u.next := p; p.prev := u; p.next := un; un.prev := p;
                p.len := 1; p.attr := wr.attr;
                p.file := t.spill.file; p.org := spillPos;
                IF t.pc.org > pos THEN INC(t.pc.org) END;
                IF ~Stores.Joined(t, p.attr) THEN
                    IF ~Stores.Unattached(p.attr) THEN p.attr := Stores.CopyOf(p.attr)(Attributes) END;
                    Stores.Join(t, p.attr)
                END
            END;
            INC(t.era); INC(t.len);
            INC(wr.era)
        ELSE
            GetWriteOp(t, pos, op, bunch);
            IF (op.attr = NIL) OR ~op.attr.Equals(wr.attr) THEN op.attr := wr.attr END;
            op.mode := writeSChar; (*op.attr := wr.attr;*) op.len := spillPos;
            IF bunch THEN Models.Bunch(t) ELSE Models.Do(t, "#System:Inserting", op) END
        END;
        wr.pos := pos + 1
    END WriteSChar;

    PROCEDURE (wr: StdWriter) WriteChar (ch: CHAR);
        VAR t: StdModel; u, un: Run; lp: LPiece; pos, spillPos: INTEGER;
            fw: Files.Writer; op: EditOp; bunch: BOOLEAN;
    BEGIN
        IF (ch >= 20X) & (ch < 7FX)
        OR (ch = tab) OR (ch = line) OR (ch = para)
        OR (ch = zwspace) OR (ch = digitspace)
        OR (ch = hyphen) OR (ch = nbhyphen) OR (ch >= 0A0X) & (ch < 100X) THEN
            WriteSChar(wr, SHORT(ch))    (* could inline! *)
        ELSIF ch = 200BX THEN wr.WriteChar(zwspace)
        ELSIF ch = 2010X THEN wr.WriteChar(hyphen)
        ELSIF ch = 2011X THEN wr.WriteChar(nbhyphen)
        ELSIF ch >= 100X THEN
            t := wr.base; pos := wr.pos;
            IF t.spill.file = NIL THEN OpenSpill(t.spill) END;
            fw := t.spill.writer;
            fw.WriteByte(SHORT(SHORT(ORD(ch))));
            fw.WriteByte(SHORT(SHORT(ORD(ch) DIV 256 - 128)));
            spillPos := t.spill.len; t.spill.len := spillPos + 2;
            IF (t.Domain() = NIL) OR (t.Domain().GetSequencer() = NIL) THEN
                (* optimized for speed - writing to unbound text *)
                InvalCache(t, pos);
                IF wr.era # t.era THEN WriterReset(wr) END;
                un := wr.run; u := un.prev;
                IF (u.attr # NIL) & u.attr.Equals(wr.attr) & (u IS LPiece) & ~(u IS Piece) & (u(LPiece).file = t.spill.file)
                & (u(LPiece).org + 2 * u.len = spillPos) THEN
                    INC(u.len);
                    IF t.pc.org >= pos THEN INC(t.pc.org) END
                ELSE
                    NEW(lp); u.next := lp; lp.prev := u; lp.next := un; un.prev := lp;
                    lp.len := 1; lp.attr := wr.attr;
                    lp.file := t.spill.file; lp.org := spillPos;
                    IF t.pc.org > pos THEN INC(t.pc.org) END;
                    IF ~Stores.Joined(t, lp.attr) THEN
                        IF ~Stores.Unattached(lp.attr) THEN lp.attr := Stores.CopyOf(lp.attr)(Attributes) END;
                        Stores.Join(t, lp.attr)
                    END
                END;
                INC(t.era); INC(t.len);
                INC(wr.era)
            ELSE
                GetWriteOp(t, pos, op, bunch);
                IF (op.attr = NIL) OR ~op.attr.Equals(wr.attr) THEN op.attr := wr.attr END;
                op.mode := writeChar; (*op.attr := wr.attr;*) op.len := spillPos;
                IF bunch THEN Models.Bunch(t) ELSE Models.Do(t, "#System:Inserting", op) END
            END;
            wr.pos := pos + 1
        END
    END WriteChar;

    PROCEDURE (wr: StdWriter) WriteView (view: Views.View; w, h: INTEGER);
        VAR t: StdModel; u, un: Run; r: ViewRef; pos: INTEGER;
            op: EditOp; bunch: BOOLEAN;
    BEGIN
        ASSERT(view # NIL, 20); ASSERT(view.context = NIL, 21);
        t := wr.base; pos := wr.pos;
        Stores.Join(t, view);
        IF (t.Domain() = NIL) OR (t.Domain().GetSequencer() = NIL) THEN    
                                                                                    (* optimized for speed - writing to unbound text *)
            IF wr.era # t.era THEN WriterReset(wr) END;
            InvalCache(t, pos);
            NEW(r); r.len := 1; r.attr := wr.attr; r.view := view; r.w := defW; r.h := defH;
            un := wr.run; u := un.prev; u.next := r; r.prev := u; r.next := un; un.prev := r;
            IF t.pc.org > pos THEN INC(t.pc.org) END;
            INC(t.era); INC(t.len);
            view.InitContext(NewContext(r, t));
            Properties.PreferredSize(view, minWidth, maxWidth, minHeight, maxHeight, defW, defH,
                w, h
            );
            r.w := w; r.h := h;
            INC(wr.era)
        ELSE
            NEW(r); r.len := 1; r.attr := wr.attr; r.view := view; r.w := w; r.h := h;
            GetWriteOp(t, pos, op, bunch);
            op.mode := writeView; op.first := r;
            IF bunch THEN Models.Bunch(t) ELSE Models.Do(t, "#System:Inserting", op) END
        END;
        INC(wr.pos)
    END WriteView;


    (* StdDirectory *)

    PROCEDURE (d: StdDirectory) New (): Model;
        VAR t: StdModel;
    BEGIN
        NEW(t); StdInit(t); RETURN t
    END New;


    (** miscellaneous procedures **)
(*
    PROCEDURE DumpRuns* (t: Model);
        VAR u: Run; n, i, beg, end: INTEGER; name: ARRAY 64 OF CHAR; r: Files.Reader; b: BYTE;
    BEGIN
        Sub.synch := FALSE;
        WITH t: StdModel DO
            u := t.trailer.next;
            REPEAT
                WITH u: Piece DO
                    Sub.String("short");
                    Sub.Int(u.len);
                    Sub.Char(" "); Sub.IntForm(SYSTEM.ADR(u.file^), 16, 8, "0", FALSE);
                    Sub.Int(u.org); Sub.Char(" ");
                    r := u.file.NewReader(NIL); r.SetPos(u.org); i := 0;
                    WHILE i < 16 DO r.ReadByte(b); Sub.Char(CHR(b)); INC(i) END;
                    Sub.Ln
                | u: LPiece DO    (* ~(u IS Piece) *)
                    Sub.String("long");
                    Sub.Int(-u.len);
                    Sub.Char(" "); Sub.IntForm(SYSTEM.ADR(u.file^), 16, 8, "0", FALSE);
                    Sub.Int(u.org); Sub.Char(" ");
                    r := u.file.NewReader(NIL); r.SetPos(u.org); i := 0;
                    WHILE i < 16 DO r.ReadByte(b); Sub.Char(CHR(b)); INC(i) END;
                    Sub.Ln
                | u: ViewRef DO
                    Sub.String("view");
                    Services.GetTypeName(u.view, name);
                    Sub.String(name); Sub.Int(u.w); Sub.Int(u.h); Sub.Ln
                ELSE
                    Sub.Char("?"); Sub.Ln
                END;
                u := u.next
            UNTIL u = t.trailer;
            n := t.id MOD cacheWidth;
            IF cache[n].id = t.id THEN
                beg := cache[n].beg; end := cache[n].end;
                Sub.Int(beg); Sub.Int(end); Sub.Ln;
                Sub.Char("{");
                WHILE beg < end DO Sub.Char(CHR(cache[n].buf[beg MOD cacheLen])); INC(beg) END;
                Sub.Char("}"); Sub.Ln
            ELSE Sub.String("not cached"); Sub.Ln
            END
        END
    END DumpRuns;
*)

    PROCEDURE NewColor* (a: Attributes; color: Ports.Color): Attributes;
    BEGIN
        ASSERT(a # NIL, 20); ASSERT(a.init, 21);
        stdProp.valid := {Properties.color}; stdProp.color.val := color;
        RETURN ModifiedAttr(a, stdProp)
    END NewColor;

    PROCEDURE NewFont* (a: Attributes; font: Fonts.Font): Attributes;
    BEGIN
        ASSERT(a # NIL, 20); ASSERT(a.init, 21);
        stdProp.valid := {Properties.typeface .. Properties.weight};
        stdProp.typeface := font.typeface$;
        stdProp.size := font.size;
        stdProp.style.val := font.style;
        stdProp.style.mask := {Fonts.italic, Fonts.underline, Fonts.strikeout};
        stdProp.weight := font.weight;
        RETURN ModifiedAttr(a, stdProp)
    END NewFont;

    PROCEDURE NewOffset* (a: Attributes; offset: INTEGER): Attributes;
    BEGIN
        ASSERT(a # NIL, 20); ASSERT(a.init, 21);
        prop.valid := {0 (*global constant offset masked by param :-( *)}; prop.offset := offset;
        RETURN ModifiedAttr(a, prop)
    END NewOffset;

    PROCEDURE NewTypeface* (a: Attributes; typeface: Fonts.Typeface): Attributes;
    BEGIN
        ASSERT(a # NIL, 20); ASSERT(a.init, 21);
        stdProp.valid := {Properties.typeface}; stdProp.typeface := typeface;
        RETURN ModifiedAttr(a, stdProp)
    END NewTypeface;

    PROCEDURE NewSize* (a: Attributes; size: INTEGER): Attributes;
    BEGIN
        ASSERT(a # NIL, 20); ASSERT(a.init, 21);
        stdProp.valid := {Properties.size}; stdProp.size := size;
        RETURN ModifiedAttr(a, stdProp)
    END NewSize;

    PROCEDURE NewStyle* (a: Attributes; style: SET): Attributes;
    BEGIN
        ASSERT(a # NIL, 20); ASSERT(a.init, 21);
        stdProp.valid := {Properties.style}; stdProp.style.val := style; stdProp.style.mask := -{};
        RETURN ModifiedAttr(a, stdProp)
    END NewStyle;

    PROCEDURE NewWeight* (a: Attributes; weight: INTEGER): Attributes;
    BEGIN
        ASSERT(a # NIL, 20); ASSERT(a.init, 21);
        stdProp.valid := {Properties.weight}; stdProp.weight := weight;
        RETURN ModifiedAttr(a, stdProp)
    END NewWeight;


    PROCEDURE WriteableChar* (ch: CHAR): BOOLEAN;
    (* must be identical to test in (StdWriter)WriteChar - inlined there for efficiency *)
    BEGIN
        RETURN
            (ch >= 20X) & (ch < 7FX) OR
            (ch = tab) OR (ch = line) OR (ch = para) OR
            (ch = zwspace) OR (ch = digitspace) OR
            (ch = hyphen) OR (ch = nbhyphen) OR
            (ch >= 0A0X)    (* need to augment with test for valid Unicode *)
    END WriteableChar;


    PROCEDURE CloneOf* (source: Model): Model;
    BEGIN
        ASSERT(source # NIL, 20);
        RETURN Containers.CloneOf(source)(Model)
    END CloneOf;


    PROCEDURE SetDir* (d: Directory);
    BEGIN
        ASSERT(d # NIL, 20); ASSERT(d.attr # NIL, 21); ASSERT(d.attr.init, 22);
        dir := d
    END SetDir;


    PROCEDURE Init;
        VAR d: StdDirectory; a: Attributes;
    BEGIN
        NEW(a); a.InitFromProp(NIL);
        NEW(stdProp); stdProp.known := -{};
        NEW(prop); prop.known := -{};
        NEW(d); stdDir := d; dir := d; d.SetAttr(a)
    END Init;

BEGIN
    Init
END TextModels.
