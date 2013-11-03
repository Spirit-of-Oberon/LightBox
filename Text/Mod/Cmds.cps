﻿MODULE TextCmds;
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

(* could eliminate ReplList/ReplOp and use Models.Begin/EndScript instead (as already done for shifting) *)
(* move ListAlienViews to StdCmds and generalize accordingly? *)


    IMPORT
        Strings, Ports, Stores, Models, Views, Controllers, Properties, Dialog, Containers,
        TextModels, TextMappers, TextRulers, TextSetters, TextViews, TextControllers;

    CONST
        (* ShiftOp.left *)
        left = TRUE; right = FALSE;

        (* PreparePat, FindPat *)
        leftTerm = 3X; rightTerm = 4X;

        (* DoReplace mode *)
        replace = 0; replaceAndFind = 1; replaceAll = 2;

        (* FindIn first *)
        first = TRUE; again = FALSE;

        mm = Ports.mm; point = Ports.point; maxPat = 256;
        viewcode = TextModels.viewcode;
        tab = TextModels.tab; line = TextModels.line; para = TextModels.para;
        nbspace = TextModels.nbspace; digitspace = TextModels.digitspace;
        hyphen = TextModels.hyphen;
        nbhyphen = TextModels.nbhyphen; softhyphen = TextModels.softhyphen;

        posKey = "#Text:Position";
        searchAliensKey = "#Text:SearchForAlienViews";    (* dormant code option *)
        alienTypeKey = "#Text:AlienViewType";
        noAliensKey = "#Text:NoAlienViewsFound";
        noRulerKey = "#Text:NoRulerSelected";
        noMatchKey = "#Text:SelectionDoesNotMatch";
        noTargetKey = "#Text:NoTargetFound";
        noSelectionKey = "#Text:NoSelectionFound";
        noPatternKey = "#Text:PatternNotSpecified";
        notFoundKey = "#Text:PatternNotFound";    (* not used *)
        replacingKey = "#System:Replacing";
        shiftingKey = "#Text:Shifting";
        showMarksKey = "#Text:ShowMarks";
        hideMarksKey = "#Text:HideMarks";
        replaceSelectionKey = "#Text:ReplaceAllInSelection";
        replaceAllKey = "#Text:ReplaceAll";


    TYPE
        FindSpec = RECORD
            valid, ignoreCase, wordBeginsWith, wordEndsWith, reverse: BOOLEAN;
            start: INTEGER;
            find: ARRAY maxPat OF CHAR
        END;

        ReplList = POINTER TO RECORD
            next: ReplList;
            beg, end: INTEGER;
            buf: TextModels.Model
        END;

        ReplOp = POINTER TO RECORD (Stores.Operation)
            text: TextModels.Model;
            list, last: ReplList;
            find: FindSpec
        END;


    VAR
        find*: RECORD
            find*: ARRAY maxPat OF CHAR;
            replace*: ARRAY maxPat OF CHAR;
            ignoreCase*, wordBeginsWith*, wordEndsWith*: BOOLEAN;
            reverseOrientation*: BOOLEAN
        END;

        ruler*: RECORD
            pageBreaks*: RECORD
                notInside*, joinPara*: BOOLEAN
            END
        END;


    PROCEDURE Show (t: TextModels.Model; beg, end: INTEGER);
    BEGIN
        TextViews.ShowRange(t, beg, end, TextViews.focusOnly);
        IF beg = end THEN
            TextControllers.SetCaret(t, beg)
        ELSE
            TextControllers.SetSelection(t, beg, end)
        END
    END Show;

    PROCEDURE NoShow (t: TextModels.Model; pos: INTEGER);
    BEGIN
        TextControllers.SetSelection(t, pos, pos);
        TextControllers.SetCaret(t, pos)
    END NoShow;

    PROCEDURE Ruler (): TextRulers.Ruler;
        VAR r: TextRulers.Ruler;
    BEGIN
        r := TextRulers.dir.New(NIL);
        TextRulers.AddTab(r, 4*mm); TextRulers.AddTab(r, 20*mm);
        RETURN r
    END Ruler;


    (* search & replace *)

    PROCEDURE LeftTerminator (ch: CHAR): BOOLEAN;
    BEGIN
        IF ch < 100X THEN
            CASE ch OF
                viewcode, tab, line, para, " ",
                "(", "[", "{", "=",
                hyphen, softhyphen: RETURN TRUE
            ELSE RETURN FALSE
            END
        ELSE RETURN TRUE
        END
    END LeftTerminator;

    PROCEDURE RightTerminator (ch: CHAR): BOOLEAN;
    BEGIN
        IF ch < 100X THEN
            CASE ch OF
                0X, viewcode, tab, line, para, " ",
                "!", "(", ")", ",", ".", ":", ";", "?", "[", "]", "{", "}",
                hyphen, softhyphen: RETURN TRUE
            ELSE RETURN FALSE
            END
        ELSE RETURN TRUE
        END
    END RightTerminator;

    PROCEDURE PreparePat (spec: FindSpec;
                                VAR pat: ARRAY OF CHAR; VAR n: INTEGER;
                                VAR wordBeg, wordEnd: BOOLEAN);
        VAR i: INTEGER; ch: CHAR;
    BEGIN
        i := 0; ch := spec.find[0];
        wordBeg := spec.wordBeginsWith & ~LeftTerminator(ch);
        IF wordBeg THEN pat[0] := leftTerm; n := 1 ELSE n := 0 END;
        WHILE ch # 0X DO
            IF ch # softhyphen THEN
                IF spec.ignoreCase THEN pat[n] := Strings.Upper(ch) ELSE pat[n] := ch END;
                INC(n)
            END;
            INC(i); ch := spec.find[i]
        END;
        wordEnd := spec.wordEndsWith & ~RightTerminator(pat[n - 1]);
        IF wordEnd THEN pat[n] := rightTerm; INC(n) END
    END PreparePat;

    PROCEDURE FindPat (t: TextModels.Model; spec: FindSpec; VAR beg, end: INTEGER);
    (* post: beg < end => t[beg, end) = spec.find, start <= beg; else beg = end *)
        VAR r: TextModels.Reader; start: INTEGER;
            i, j, b, e, n: INTEGER; ch0, ch, ch1: CHAR; wordBeg, wordEnd, icase: BOOLEAN;
            pat, ref: ARRAY maxPat OF CHAR;    (* ref [b..e) is readback buffer *)
            pos0, pos1, absStart: INTEGER;
            orientation: INTEGER;
    BEGIN
        IF spec.reverse THEN
            orientation := -1; absStart := t.Length();
            PreparePat(spec, ref, n, wordEnd, wordBeg);
            i := n; j := 0; REPEAT DEC(i); pat[j] := ref[i]; INC(j) UNTIL i = 0    (* Just reverse the pattern... *)
        ELSE
            orientation := 1; absStart := 0;
            PreparePat(spec, pat, n, wordBeg, wordEnd)
        END;
        start := spec.start; icase := spec.ignoreCase;
        r := t.NewReader(NIL); i := 0;
        IF wordBeg THEN
            IF start # absStart THEN
                DEC(start, orientation)
            ELSE
                r.SetPos(absStart);
                IF spec.reverse THEN r.ReadPrevChar(ch) ELSE r.ReadChar(ch) END;
                IF ~LeftTerminator(ch) THEN i := 1 END
            END
        END;
        r.SetPos(start); IF spec.reverse THEN r.ReadPrevChar(ch) ELSE r.ReadChar(ch) END;
        pos0 := start; pos1 := start;
        IF icase THEN ch := Strings.Upper(ch) END;
        ref[0] := ch; ch0 := ch; j := 0; b := 0; e := 1;
        WHILE ~r.eot & (i < n) DO
            ch1 := pat[i];
            IF (ch1 = ch)
            OR (ch1 = leftTerm) & LeftTerminator(ch)
            OR (ch1 = rightTerm) & RightTerminator(ch) THEN
                INC(i); j := (j + 1) MOD maxPat
            ELSIF ch = softhyphen THEN
                j := (j + 1) MOD maxPat
            ELSE
                i := 0; INC(pos0, orientation); b := (b + 1) MOD maxPat; j := b
            END;
            IF j # e THEN
                ch := ref[j]
            ELSE
                INC(pos1, orientation);
                IF spec.reverse THEN r.ReadPrevChar(ch) ELSE r.ReadChar(ch) END;
                IF icase THEN ch := Strings.Upper(ch) END;
                ref[j] := ch; e := (e + 1) MOD maxPat
            END
        END;
        IF wordEnd & ~((i + 1 = n) & r.eot) THEN DEC(pos1, orientation) END;
        IF (n > 0) & ((i = n) OR wordEnd & (i + 1 = n) & r.eot) THEN
            IF wordBeg & ((pos0 # absStart) OR LeftTerminator(ch0)) THEN INC(pos0, orientation) END
        ELSE
            pos0 := pos1
        END;
        IF spec.reverse THEN
            beg := pos1; end := pos0
        ELSE
            beg := pos0; end := pos1
        END
    END FindPat;

    PROCEDURE OverrideSpecWithOption (VAR spec: FindSpec; option: ARRAY OF CHAR);
        VAR i: INTEGER; choice: BOOLEAN; ch: CHAR;
    BEGIN
        choice := TRUE; i := 0; ch := option[i];
        WHILE ch # 0X DO
            CASE option[i] OF
                '~': choice := ~choice
            |    'I', 'i': spec.ignoreCase := choice; choice := TRUE
            |    'B', 'b': spec.wordBeginsWith := choice; choice := TRUE
            |    'E', 'e': spec.wordEndsWith := choice; choice := TRUE
            |    'R', 'r': spec.reverse := choice; choice := TRUE
            ELSE choice := TRUE
            END;
            INC(i); ch := option[i]
        END
    END OverrideSpecWithOption;

    PROCEDURE SetSpec (VAR spec: FindSpec; pos0, pos1: INTEGER; option: ARRAY OF CHAR);
    BEGIN
        ASSERT(find.find # "", 20);
        spec.valid := TRUE;
        spec.ignoreCase := find.ignoreCase;
        spec.wordBeginsWith := find.wordBeginsWith;
        spec.wordEndsWith := find.wordEndsWith;
        spec.reverse := find.reverseOrientation;
        OverrideSpecWithOption(spec, option);
        IF spec.reverse THEN spec.start := pos1
        ELSE spec.start := pos0
        END;
        spec.find := find.find$
    END SetSpec;

    PROCEDURE SetFindSpec (c: TextControllers.Controller; first: BOOLEAN; option: ARRAY OF CHAR;
        VAR spec: FindSpec
    );
        VAR (*start,*) pos0, pos1, beg, end: INTEGER;
    BEGIN
        IF first THEN pos0 := 0; pos1 := pos0
        ELSIF c.HasCaret() THEN pos0 := c.CaretPos(); pos1 := pos0
        ELSIF c.HasSelection() THEN c.GetSelection(beg, end); pos0 := beg + 1; pos1 := end - 1
        ELSE pos0 := 0; pos1 := pos0
        END;
        SetSpec(spec, pos0, pos1, option);
        IF spec.reverse THEN
            IF spec.start = 0 THEN spec.start := c.text.Length() END
        ELSE
            IF spec.start = c.text.Length() THEN spec.start := 0 END
        END
    END SetFindSpec;


    PROCEDURE ReplBuf (target: TextModels.Model; pos: INTEGER): TextModels.Model;
        VAR buf: TextModels.Model; attr: TextModels.Attributes; rd: TextModels.Reader;
            out: TextModels.Writer; i: INTEGER;
    BEGIN
        rd := target.NewReader(NIL); rd.SetPos(pos); rd.ReadRun(attr);
        buf := TextModels.CloneOf(target); out := buf.NewWriter(NIL); out.SetPos(0);
        IF attr # NIL THEN out.SetAttr(attr) END;
        i := 0; WHILE find.replace[i] # 0X DO out.WriteChar(find.replace[i]); INC(i) END;
        RETURN buf
    END ReplBuf;


    (* operations *)

    PROCEDURE (op: ReplOp) Do;
        VAR u, v: ReplList; text, save: TextModels.Model; beg, end, delta, len: INTEGER;
    BEGIN
        text := op.text;
        u := op.list; v := NIL; delta := 0;
        WHILE u # NIL DO
            INC(u.beg, delta); INC(u.end, delta);
            IF u.end > u.beg THEN
                save := TextModels.CloneOf(text); save.Insert(0, text, u.beg, u.end);
                DEC(delta, u.end - u.beg)
            ELSE
                save := NIL
            END;
            IF u.buf # NIL THEN
                len := u.buf.Length();
                text.Insert(u.beg, u.buf, 0, len);
                u.end := u.beg + len;
                INC(delta, len)
            ELSE
                u.end := u.beg
            END;
            u.buf := save;
            v := u; u := u.next
        END;
        IF op.find.valid THEN
            FindPat(text, op.find, beg, end); op.find.valid := FALSE;
            IF beg = end THEN Dialog.Beep END
        ELSIF v # NIL THEN
            beg := v.beg; end := v.end
        ELSE
            beg := 0; end := 0
        END;
        IF end > beg THEN Show(text, beg, end) ELSE NoShow(text, beg) END
    END Do;

    PROCEDURE AddRepl (op: ReplOp; beg, end: INTEGER; reverse: BOOLEAN);
        VAR u: ReplList;
    BEGIN
        NEW(u); u.beg := beg; u.end := end; u.buf := ReplBuf(op.text, beg);
        IF reverse THEN    (* append *)
            u.next := op.list; op.list := u
        ELSE    (* prepend *)
            IF op.list = NIL THEN op.list := u ELSE op.last.next := u END;
            op.last := u
        END
    END AddRepl;

    PROCEDURE DoReplaceThis ( 
        t: TextModels.Model; mode: INTEGER;
        firstBeg, firstEnd: INTEGER;
        rngBeg, rngEnd: INTEGER;
        option: ARRAY OF CHAR
    );
        VAR op: ReplOp; spec: FindSpec; beg, end, len: INTEGER;
    BEGIN
        NEW(op); op.text := t; op.list := NIL;
        beg := firstBeg; end := firstEnd;
        IF mode IN {replace, replaceAndFind} THEN
            AddRepl(op, firstBeg, firstEnd, spec.reverse)
        END;
        IF mode = replaceAndFind THEN
            SetSpec(op.find, firstBeg + (* LEN(find.replace$) *) ReplBuf(t, 0).Length(), firstBeg, option)
        ELSE
            op.find.valid := FALSE
        END;
        IF mode = replaceAll THEN
            len := LEN(find.find$);
            SetSpec(spec, 0, t.Length(), option);
            WHILE (rngBeg <= beg) & (beg < end) & (end <= rngEnd)  DO
                AddRepl(op, beg, end, spec.reverse);
                IF spec.reverse THEN spec.start := beg ELSE spec.start := beg + len END;
                FindPat(t, spec, beg, end)
            END
        END;
        Models.Do(t, replacingKey, op)
    END DoReplaceThis;

    PROCEDURE DoReplace (c: TextControllers.Controller; mode: INTEGER; option: ARRAY OF CHAR);
        VAR t: TextModels.Model; spec: FindSpec;
            selBeg, selEnd, beg, end, len0: INTEGER; hasSel0: BOOLEAN;
    BEGIN
        IF c # NIL THEN
            t := c.text; len0 := t.Length(); hasSel0 := c.HasSelection();
            IF hasSel0 THEN
                c.GetSelection(selBeg, selEnd);
                IF selEnd < len0 THEN
                    SetSpec(spec, selBeg, selEnd + 1, option)
                ELSE SetSpec(spec, selBeg, selEnd, option)
                END
            ELSE
                selBeg := 0; selEnd := len0;
                SetFindSpec(c, (* again *) mode = replaceAll, option, spec)
            END;
            FindPat(t, spec, beg, end);
            IF mode = replaceAll THEN
                IF (selBeg <= beg) & (beg < end) & (end <= selEnd) THEN
                    DoReplaceThis(t, mode, beg, end, selBeg, selEnd, option);
                    IF hasSel0 THEN Show(c.text, selBeg, selEnd + t.Length() - len0) END
                ELSE NoShow(c.text, 0); Dialog.Beep
                END
            ELSIF hasSel0 THEN
                IF (beg = selBeg) & (end = selEnd) THEN
                    DoReplaceThis(t, mode, selBeg, selEnd, 0, len0, option)
                ELSE Dialog.ShowParamMsg(noMatchKey, spec.find, "", "")
                END
            ELSE Dialog.ShowMsg(noSelectionKey)
            END
        ELSE Dialog.ShowMsg(noTargetKey)
        END
    END DoReplace;

    PROCEDURE DoShift (c: TextControllers.Controller; left: BOOLEAN);
        VAR script: Stores.Operation;
            t: TextModels.Model; st: TextSetters.Setter;
            rd: TextModels.Reader; wr: TextModels.Writer;
            box: TextSetters.LineBox; beg, pos, end: INTEGER; ch: CHAR;
    BEGIN
        IF (c # NIL) & (c.HasSelection() OR c.HasCaret()) THEN
            t := c.text;
            IF c.HasSelection() THEN c.GetSelection(beg, end) ELSE beg := c.CaretPos(); end := beg END;
            st := c.view.ThisSetter(); beg := st.ThisSequence(beg); pos := beg;
            rd := t.NewReader(NIL); rd.SetPos(pos);
            IF ~left THEN wr := t.NewWriter(NIL) END;
            Models.BeginScript(t, shiftingKey, script);
            REPEAT
                rd.ReadChar(ch);
                IF rd.view # NIL THEN
                    st.GetLine(pos, box);
                    IF box.rbox THEN ch := para END
                END;
                IF left & ((ch = tab) OR (ch = " ") OR (ch = digitspace) OR (ch = nbspace)) THEN
                    t.Delete(pos, pos + 1); rd.SetPos(pos); DEC(end)
                ELSIF ~left & (ch # line) & (ch # para) THEN
                    wr.SetPos(pos);
                    IF (ch = " ") OR (ch = digitspace) OR (ch = nbspace) THEN
                        wr.WriteChar(ch)
                    ELSE wr.WriteChar(tab)
                    END;
                    INC(pos); INC(end)
                ELSE INC(pos)
                END;
                WHILE ~rd.eot & (ch # line) & (ch # para) DO
                    INC(pos); rd.ReadChar(ch)
                END
            UNTIL rd.eot OR (pos >= end);
            Models.EndScript(t, script);
            IF end > beg THEN TextControllers.SetSelection(t, beg, end) END
        END
    END DoShift;

    (** commands **)

    PROCEDURE ListAlienViews*;
        VAR t: TextModels.Model; v: TextViews.View; wr: TextMappers.Formatter;
            rd: TextModels.Reader; view: Views.View;
            type: Stores.TypeName; none: BOOLEAN;
    BEGIN
        t := TextViews.FocusText();
        IF t # NIL THEN
            wr.ConnectTo(TextModels.dir.New());
            rd := t.NewReader(NIL); rd.ReadView(view); none := TRUE;
            WHILE view # NIL DO
                IF view IS Views.Alien THEN
                    IF none THEN
                        wr.WriteTab; wr.WriteMsg(posKey);
                        wr.WriteTab; wr.WriteMsg(alienTypeKey); wr.WriteLn
                    END;
                    none := FALSE;
                    type := view(Views.Alien).store.path[0]$;
                    wr.WriteTab;
                    wr.WriteIntForm(rd.Pos() - 1,
                        TextMappers.decimal, 5, nbspace, TextMappers.hideBase);
                    wr.WriteTab; wr.WriteString(type); wr.WriteLn
                END;
                rd.ReadView(view)
            END;
            IF none THEN wr.WriteString(noAliensKey); wr.WriteLn END;
            v := TextViews.dir.New(wr.rider.Base());
            v.SetDefaults(Ruler(), TextViews.dir.defAttr);
            Views.OpenView(v)
        END
    END ListAlienViews;


    PROCEDURE ToggleMarksGuard* (VAR par: Dialog.Par);
        VAR v: TextViews.View;
    BEGIN
        v := TextViews.Focus();
        IF (v # NIL) & v.HidesMarks() THEN par.label := showMarksKey
        ELSE par.label := hideMarksKey
        END
    END ToggleMarksGuard;

    PROCEDURE ToggleMarks*;
        VAR v: TextViews.View;
    BEGIN
        v := TextViews.Focus();
        IF v # NIL THEN v.DisplayMarks(~v.HidesMarks()) END
    END ToggleMarks;

    PROCEDURE ShowMarks*;
        VAR v: TextViews.View;
    BEGIN
        v := TextViews.Focus();
        IF (v # NIL) & v.HidesMarks() THEN v.DisplayMarks(TextViews.show) END
    END ShowMarks;

    PROCEDURE HideMarks*;
        VAR v: TextViews.View;
    BEGIN
        v := TextViews.Focus();
        IF (v # NIL) & ~v.HidesMarks() THEN v.DisplayMarks(TextViews.hide) END
    END HideMarks;

    PROCEDURE MakeDefaultRulerGuard* (VAR par: Dialog.Par);
        VAR c: TextControllers.Controller; v: Views.View;
    BEGIN
        c := TextControllers.Focus();
        IF c # NIL THEN
            v := c.Singleton();
            IF (v = NIL) OR ~(v IS TextRulers.Ruler) THEN par.disabled := TRUE END
        ELSE par.disabled := TRUE
        END
    END MakeDefaultRulerGuard;

    PROCEDURE MakeDefaultRuler*;
        VAR c: TextControllers.Controller; rd: TextModels.Reader;
            r: TextRulers.Ruler; a: TextModels.Attributes;
            beg, end: INTEGER;
    BEGIN
        c := TextControllers.Focus();
        IF c # NIL THEN
            IF c.HasSelection() THEN
                c.GetSelection(beg, end);
                rd := c.text.NewReader(NIL); rd.SetPos(beg); rd.Read;
                IF (rd.view # NIL) & (rd.view IS TextRulers.Ruler) THEN
                    c.view.PollDefaults(r, a);
                    c.view.SetDefaults(rd.view(TextRulers.Ruler), a)
                ELSE Dialog.ShowMsg(noRulerKey)
                END
            ELSE Dialog.ShowMsg(noSelectionKey)
            END
        ELSE Dialog.ShowMsg(noTargetKey)
        END
    END MakeDefaultRuler;

    PROCEDURE MakeDefaultAttributes*;
        VAR c: TextControllers.Controller; rd: TextModels.Reader;
            r: TextRulers.Ruler; a: TextModels.Attributes;
            beg, end: INTEGER;
    BEGIN
        c := TextControllers.Focus();
        IF c # NIL THEN
            IF c.HasSelection() THEN
                c.GetSelection(beg, end);
                rd := c.text.NewReader(NIL); rd.SetPos(beg); rd.Read;
                c.view.PollDefaults(r, a);
                c.view.SetDefaults(r, rd.attr)
            ELSE Dialog.ShowMsg(noSelectionKey)
            END
        ELSE Dialog.ShowMsg(noTargetKey)
        END
    END MakeDefaultAttributes;

    PROCEDURE ShiftLeft*;
    BEGIN
        DoShift(TextControllers.Focus(), left)
    END ShiftLeft;

    PROCEDURE ShiftRight*;
    BEGIN
        DoShift(TextControllers.Focus(), right)
    END ShiftRight;


    PROCEDURE Subscript*;
        VAR q, p0: Properties.Property; p: TextModels.Prop;
    BEGIN
        Properties.CollectProp(q);
        p0 := q; WHILE (p0 # NIL) & ~(p0 IS TextModels.Prop) DO p0 := p0.next END;
        NEW(p); p.valid := {TextModels.offset};
        IF (p0 # NIL) & (TextModels.offset IN p0.valid) THEN
            p.offset := p0(TextModels.Prop).offset - point
        ELSE p.offset := -point
        END;
        Properties.EmitProp(NIL, p)
    END Subscript;

    PROCEDURE Superscript*;
        VAR q, p0: Properties.Property; p: TextModels.Prop;
    BEGIN
        Properties.CollectProp(q);
        p0 := q; WHILE (p0 # NIL) & ~(p0 IS TextModels.Prop) DO p0 := p0.next END;
        NEW(p); p.valid := {TextModels.offset};
        IF (p0 # NIL) & (TextModels.offset IN p0.valid) THEN
            p.offset := p0(TextModels.Prop).offset + point
        ELSE p.offset := point
        END;
        Properties.EmitProp(NIL, p)
    END Superscript;


    PROCEDURE ForceToNewLine (c: TextControllers.Controller);
        VAR st: TextSetters.Setter; pos, start: INTEGER; msg: Controllers.EditMsg;
    BEGIN
        IF c.HasCaret() THEN
            pos := c.CaretPos();
            st := c.view.ThisSetter(); start := st.ThisLine(pos);
            IF pos # start THEN
                msg.op := Controllers.pasteChar; msg.char := line;
                Controllers.Forward(msg)
            END
        END
    END ForceToNewLine;

    PROCEDURE InsertParagraph*;
        VAR c: TextControllers.Controller; script: Stores.Operation; msg: Controllers.EditMsg;
    BEGIN
        c := TextControllers.Focus();
        IF c # NIL THEN
            Models.BeginScript(c.text, "#Text:InsertParagraph", script);
            ForceToNewLine(c);
            msg.op := Controllers.pasteChar; msg.char := para;
            Controllers.Forward(msg);
            Models.EndScript(c.text, script)
        END
    END InsertParagraph;

    PROCEDURE InsertRuler*;
        VAR c: TextControllers.Controller; script: Stores.Operation;
            rd: TextModels.Reader; r: TextRulers.Ruler;
            pos, end: INTEGER;
    BEGIN
        c := TextControllers.Focus();
        IF c # NIL THEN
            r := NIL;
            IF c.HasSelection() THEN
                c.GetSelection(pos, end);
                rd := c.text.NewReader(NIL); rd.SetPos(pos); rd.Read;
                IF (rd.view # NIL) & (rd.view IS TextRulers.Ruler) THEN
                    r := rd.view(TextRulers.Ruler)
                END
            ELSE pos := c.CaretPos()
            END;
            IF r = NIL THEN r := TextViews.ThisRuler(c.view, pos) END;
            r := TextRulers.CopyOf(r, Views.deep);
            Models.BeginScript(c.text, "#Text:InsertRuler", script);
            ForceToNewLine(c);
            c.view.DisplayMarks(TextViews.show);
            Controllers.PasteView(r, Views.undefined, Views.undefined, FALSE);
            Models.EndScript(c.text, script)
        END
    END InsertRuler;

    PROCEDURE InsertSoftHyphen*;
        VAR msg: Controllers.EditMsg;
    BEGIN
        msg.op := Controllers.pasteChar; msg.char := softhyphen;
        Controllers.Forward(msg)
    END InsertSoftHyphen;

    PROCEDURE InsertNBHyphen*;
        VAR msg: Controllers.EditMsg;
    BEGIN
        msg.op := Controllers.pasteChar; msg.char := nbhyphen;
        Controllers.Forward(msg)
    END InsertNBHyphen;

    PROCEDURE InsertNBSpace*;
        VAR msg: Controllers.EditMsg;
    BEGIN
        msg.op := Controllers.pasteChar; msg.char := nbspace;
        Controllers.Forward(msg)
    END InsertNBSpace;

    PROCEDURE InsertDigitSpace*;
        VAR msg: Controllers.EditMsg;
    BEGIN
        msg.op := Controllers.pasteChar; msg.char := digitspace;
        Controllers.Forward(msg)
    END InsertDigitSpace;


    PROCEDURE GetFindPattern (c: TextControllers.Controller);
        VAR r: TextModels.Reader; beg, end: INTEGER; i: INTEGER; ch: CHAR;
            new: ARRAY maxPat OF CHAR;
    BEGIN
        IF (c # NIL) & c.HasSelection() THEN
            c.GetSelection(beg, end);
            r := c.text.NewReader(NIL); r.SetPos(beg); r.ReadChar(ch); i := 0;
            WHILE (r.Pos() <= end) & (i < maxPat - 1) DO
                new[i] := ch; INC(i); r.ReadChar(ch)
            END;
            new[i] := 0X;
            IF (new # "") & (new # find.find) THEN
                find.find := new$;
                find.ignoreCase := FALSE;
                find.wordBeginsWith := FALSE; find.wordEndsWith := FALSE;
                Dialog.Update(find)
            END
        END
    END GetFindPattern;

    PROCEDURE FindIn (c: TextControllers.Controller; first: BOOLEAN; option: ARRAY OF CHAR);
        VAR spec: FindSpec; beg, end: INTEGER;
    BEGIN
        IF c # NIL THEN
            IF find.find # "" THEN
                SetFindSpec(c, first, option, spec);
                FindPat(c.text, spec, beg, end);
                IF end > beg THEN Show(c.text, beg, end) ELSE NoShow(c.text, 0); Dialog.Beep END
            ELSE Dialog.ShowMsg(noPatternKey)
            END
        ELSE Dialog.ShowMsg(noTargetKey)
        END
    END FindIn;


    PROCEDURE FindGuard* (VAR par: Dialog.Par);
        VAR c: TextControllers.Controller;
    BEGIN
        c := TextControllers.Focus();
        IF (c = NIL) OR (find.find = "") THEN par.disabled := TRUE END
    END FindGuard;

    PROCEDURE FindFirst* (option: ARRAY OF CHAR);
    BEGIN
        FindIn(TextControllers.Focus(), first, option)
    END FindFirst;

    PROCEDURE FindAgainGuard* (VAR par: Dialog.Par);
        VAR c: TextControllers.Controller;
    BEGIN
        c := TextControllers.Focus();
        IF (c = NIL) OR (~c.HasSelection() & (find.find = "")) THEN par.disabled := TRUE END
    END FindAgainGuard;

    PROCEDURE FindAgain* (option: ARRAY OF CHAR);
    BEGIN
        FindIn(TextControllers.Focus(), again, option)
    END FindAgain;


    PROCEDURE ReplaceGuard* (VAR par: Dialog.Par);
        VAR c: TextControllers.Controller;
    BEGIN
        c := TextControllers.Focus();
        IF (c = NIL) OR (Containers.noCaret IN c.opts) OR ~c.HasSelection() OR (find.find = "") THEN
            par.disabled := TRUE
        END
    END ReplaceGuard;

    PROCEDURE Replace* (option: ARRAY OF CHAR);
    BEGIN
        DoReplace(TextControllers.Focus(), replace, option)
    END Replace;

    PROCEDURE ReplaceAndFindNext* (option: ARRAY OF CHAR);
    BEGIN
        DoReplace(TextControllers.Focus(), replaceAndFind, option)
    END ReplaceAndFindNext;


    PROCEDURE ReplaceAllGuard* (VAR par: Dialog.Par);
        VAR c: TextControllers.Controller;
    BEGIN
        c := TextControllers.Focus();
        IF (c = NIL) OR (Containers.noCaret IN c.opts) OR (find.find = "") THEN
            par.disabled := TRUE
        ELSE
            IF c.HasSelection() THEN par.label := replaceSelectionKey ELSE par.label := replaceAllKey END
        END
    END ReplaceAllGuard;

    PROCEDURE ReplaceAll* (option: ARRAY OF CHAR);
    BEGIN
        DoReplace(TextControllers.Focus(), replaceAll, option)
    END ReplaceAll;


    PROCEDURE SetNormalOrientation*;
    BEGIN
        find.reverseOrientation := FALSE;
        Dialog.Update(find)
    END SetNormalOrientation;

    PROCEDURE SetReverseOrientation*;
    BEGIN
        find.reverseOrientation := TRUE;
        Dialog.Update(find)
    END SetReverseOrientation;

    PROCEDURE InitFindDialog*;
    BEGIN
        GetFindPattern(TextControllers.Focus())
    END InitFindDialog;


    (** ruler dialog **)

    PROCEDURE InitRulerDialog*;
        VAR v: Views.View; ra: TextRulers.Attributes;
    BEGIN
        v := Controllers.FocusView();
        IF v # NIL THEN
            WITH v: TextRulers.Ruler DO
                ra := v.style.attr;
                ruler.pageBreaks.notInside := TextRulers.noBreakInside IN ra.opts;
                ruler.pageBreaks.joinPara := TextRulers.parJoin IN ra.opts
            ELSE
            END
        END
    END InitRulerDialog;

    PROCEDURE SetRuler*;
        VAR v: Views.View; p: TextRulers.Prop;
    BEGIN
        v := Controllers.FocusView();
        IF v # NIL THEN
            WITH v: TextRulers.Ruler DO
                NEW(p); p.valid := {TextRulers.opts};
                p.opts.mask := {TextRulers.noBreakInside, TextRulers.parJoin};
                p.opts.val := {};
                IF ruler.pageBreaks.notInside THEN INCL(p.opts.val, TextRulers.noBreakInside) END;
                IF ruler.pageBreaks.joinPara THEN INCL(p.opts.val, TextRulers.parJoin) END;
                Properties.EmitProp(NIL, p)
            ELSE
            END
        END
    END SetRuler;


    (** standard text-related guards **)

    PROCEDURE FocusGuard* (VAR par: Dialog.Par);
    (** in non-TextView menus; otherwise implied by menu type **)
    BEGIN
        IF TextViews.Focus() = NIL THEN par.disabled := TRUE END
    END FocusGuard;

    PROCEDURE EditGuard* (VAR par: Dialog.Par);
    (** in non-TextView menus; otherwise use "StdCmds.EditGuard" **)
        VAR c: TextControllers.Controller;
    BEGIN
        c := TextControllers.Focus();
        IF (c = NIL) OR (Containers.noCaret IN c.opts) THEN par.disabled := TRUE END
    END EditGuard;

    PROCEDURE SelectionGuard* (VAR par: Dialog.Par);
    (** in non-TextView menus; otherwise use "StdCmds.SelectionGuard" **)
        VAR c: TextControllers.Controller;
    BEGIN
        c := TextControllers.Focus();
        IF (c = NIL) OR ~c.HasSelection() THEN par.disabled := TRUE END
    END SelectionGuard;

    PROCEDURE EditSelectionGuard* (VAR par: Dialog.Par);
    (** in non-TextView menus; otherwise use "StdCmds.SelectionGuard" **)
        VAR c: TextControllers.Controller;
    BEGIN
        c := TextControllers.Focus();
        IF (c = NIL) OR (Containers.noCaret IN c.opts) OR ~c.HasSelection() THEN par.disabled := TRUE END
    END EditSelectionGuard;

    PROCEDURE SingletonGuard* (VAR par: Dialog.Par);
    (** in non-TextView menus; otherwise use "StdCmds.SingletonGuard" **)
        VAR c: TextControllers.Controller;
    BEGIN
        c := TextControllers.Focus();
        IF (c = NIL) OR (c.Singleton() = NIL) THEN par.disabled := TRUE END
    END SingletonGuard;

END TextCmds.
