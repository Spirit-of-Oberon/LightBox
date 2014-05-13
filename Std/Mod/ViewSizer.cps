﻿MODULE StdViewSizer;
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

    IMPORT Services, Ports, Dialog, Views, Containers, Properties;

    CONST width = 1; height = 2;

    VAR
        size*: RECORD
            typeName-: Dialog.String;
            w*, h*: REAL;
            proportional*, fixedW, fixedH: BOOLEAN;
            unit, scaleW, scaleH, lastChanged: INTEGER;
            unitText: ARRAY 6 OF CHAR;
            view: Views.View;
            container: Containers.Controller
        END;

    PROCEDURE ConnectDialog (v: Views.View; c: Containers.Controller);
        VAR pref: Properties.ResizePref;
    BEGIN
        IF (v # NIL) & (v.context # NIL) THEN
            IF Dialog.metricSystem THEN size.unit := Ports.mm * 10; size.unitText := "cm"
            ELSE size.unit := Ports.inch; size.unitText := "inch"
            END;
            size.view := v; size.container := c;
            Services.GetTypeName(v, size.typeName);
            v.context.GetSize(size.scaleW, size.scaleH);
            size.w := size.scaleW / size.unit; size.h := size.scaleH / size.unit;
            pref.fixed := FALSE;
            pref.horFitToPage := FALSE; pref.verFitToPage := FALSE;
            pref.horFitToWin := FALSE; pref.verFitToWin := FALSE;
            Views.HandlePropMsg(v, pref);
            size.fixedW := pref.fixed;
            size.fixedH := pref.fixed;
            size.proportional := FALSE
        ELSE
            size.view := NIL; size.container := c; size.typeName := ""
        END;
        Dialog.Update(size)
    END ConnectDialog;

    PROCEDURE SetViewSize*;
    BEGIN
        IF size.view # NIL THEN
            size.view.context.SetSize(SHORT(ENTIER(size.w * size.unit + 0.5)),
                                                SHORT(ENTIER(size.h * size.unit + 0.5)));
            IF size.container # NIL THEN size.container.SetSingleton(size.view) END;
            ConnectDialog(size.view, size.container)
        ELSE Dialog.Beep
        END
    END SetViewSize;

    PROCEDURE InitDialog*;
        VAR v: Views.View; c: Containers.Controller;
    BEGIN
        c := Containers.Focus();
        IF c # NIL THEN v := c.Singleton() ELSE v := NIL END;
        IF (v # size.view) OR (c # size.container) THEN ConnectDialog(v, c) END
    END InitDialog;

    PROCEDURE ResetDialog*;
        VAR proportional: BOOLEAN; v: Views.View;
    BEGIN
        proportional := size.proportional; v := size.view;
        size.view := NIL; InitDialog;
        IF proportional & (v = size.view) THEN size.proportional := TRUE; Dialog.Update(size) END
    END ResetDialog;

    PROCEDURE WidthGuard* (VAR par: Dialog.Par);
    BEGIN
        InitDialog;
        par.disabled := size.view = NIL;
        par.readOnly := size.fixedW
    END WidthGuard;

    PROCEDURE HeightGuard* (VAR par: Dialog.Par);
    BEGIN
        InitDialog;
        par.disabled := size.view = NIL;
        par.readOnly := size.fixedH
    END HeightGuard;

    PROCEDURE ProportionGuard* (VAR par: Dialog.Par);
    BEGIN
        par.disabled := (size.view = NIL) OR size.fixedW OR size.fixedH OR (size.scaleW = 0) OR (size.scaleH = 0)
    END ProportionGuard;

    PROCEDURE UnitGuard* (VAR par: Dialog.Par);
    BEGIN
        IF size.view # NIL THEN par.label := size.unitText$ ELSE par.label := "" END
    END UnitGuard;

    PROCEDURE AdjustDialogToPref (fixedW, fixedH: BOOLEAN);
        VAR w, h: INTEGER; w0, h0: REAL; pref: Properties.SizePref;
    BEGIN
        w := SHORT(ENTIER(size.w * size.unit + 0.5)); h := SHORT(ENTIER(size.h * size.unit + 0.5));
        IF size.proportional & (w > 0) & (h > 0) & (size.scaleW > 0) & (size.scaleH > 0) THEN
            Properties.ProportionalConstraint(size.scaleW, size.scaleH, fixedW, fixedH, w, h)
        END;
        pref.w := w; pref.h := h; pref.fixedW := fixedW; pref.fixedH := fixedH;
        Views.HandlePropMsg(size.view, pref);
        IF ~fixedW THEN w0 := pref.w / size.unit ELSE w0 := size.w END;
        IF ~fixedH THEN h0 := pref.h / size.unit ELSE h0 := size.h END;
        IF (w0 # size.w) OR (h0 # size.h) THEN size.w := w0; size.h := h0; Dialog.Update(size) END
    END AdjustDialogToPref;

    PROCEDURE WNotifier* (op, from, to: INTEGER);
    BEGIN
        IF size.w > 0 THEN AdjustDialogToPref(TRUE, FALSE); size.lastChanged := width
        ELSIF size.w # 0 THEN Dialog.Beep
        END
    END WNotifier;

    PROCEDURE HNotifier* (op, from, to: INTEGER);
    BEGIN
        IF size.h > 0 THEN AdjustDialogToPref(FALSE, TRUE); size.lastChanged := height
        ELSIF size.h # 0 THEN Dialog.Beep
        END
    END HNotifier;

    PROCEDURE ProportionNotifier* (op, from, to: INTEGER);
    BEGIN
        IF (op = Dialog.changed) & size.proportional THEN
            IF size.lastChanged = width THEN AdjustDialogToPref(TRUE, FALSE)
            ELSIF size.lastChanged = height THEN AdjustDialogToPref(FALSE, TRUE)
            END
        END
    END ProportionNotifier;

END StdViewSizer.