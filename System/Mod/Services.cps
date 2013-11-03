﻿MODULE Services;
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

    IMPORT SYSTEM, Kernel;

    CONST
        now* = 0; immediately* = -1;    (** DoLater notBefore **)
        resolution* = 1000;
        scale = resolution DIV Kernel.timeResolution;
        corr = resolution MOD Kernel.timeResolution;


    TYPE
        Action* = POINTER TO ABSTRACT RECORD
            notBefore: LONGINT;
            next: Action    (* next element in linear list *)
        END;

        ActionHook* = POINTER TO ABSTRACT RECORD (Kernel.Hook) END;
        StdHook = POINTER TO RECORD (ActionHook) END;


    VAR
        actionHook-: ActionHook;
        actions: Action;            (* list of actions *)
        candidates: Action;        (* list of action candidates in IterateOverActions,
                                                NIL during normal execution of commands *)
        hasImmediates: BOOLEAN;    (* this is a hint: one or more actions in some ring may be immediate actions *)
        trapCnt: INTEGER;


    PROCEDURE Ticks* (): LONGINT;
        VAR t: LONGINT;
    BEGIN
        t := Kernel.Time();
        RETURN t * scale + t * corr DIV Kernel.timeResolution
    END Ticks;


    (** Action **)

    PROCEDURE (a: Action) Do- (), NEW, ABSTRACT;

    PROCEDURE In (l, a: Action): BOOLEAN;
    BEGIN
        WHILE (l # NIL) & (l # a) DO l := l.next END;
        RETURN l # NIL
    END In;

    PROCEDURE Incl (VAR l: Action; a: Action);
    BEGIN
        IF l # NIL THEN a.next := l END;
        l := a
    END Incl;

    PROCEDURE Excl (VAR l: Action; a: Action);
        VAR p0, p1: Action;
    BEGIN
        IF l = a THEN
            l := a.next; a.next := NIL
        ELSIF l # NIL THEN
            p0 := l; p1 := p0.next;
            (* (p0 # NIL) & (p0 # a) *)
            WHILE (p1 # NIL) & (p1 # a) DO p0 := p1; p1 := p0.next END;
            IF p1 = a THEN p0.next := a.next; a.next := NIL END
        END
    END Excl;

    PROCEDURE Exec (a: Action);
        VAR t: Kernel.Type;
    BEGIN
        t := Kernel.TypeOf(a);
        IF t.mod.refcnt >= 0 THEN    (* execute action if its module is not unloaded *)
            a.Do    (* warning: here the actions and candidates lists may be modified, or a trap may occur! *)
        END
    END Exec;

    PROCEDURE Cleanup;
        VAR p: Action;
    BEGIN
        IF candidates # NIL THEN    (* trap handling *)
            p := candidates; WHILE p.next # NIL DO p := p.next END;    (* find last element of candidates list *)
            p.next := actions; actions := candidates; candidates := NIL    (* prepend candidates list to actions list *)
        END;
        trapCnt := Kernel.trapCount    (* all traps are handled now *)
    END Cleanup;

    PROCEDURE DoLater* (a: Action; notBefore: LONGINT);
    (** Register action a. If a is already registered, its notBefore value is updated instead. **)
    BEGIN
        ASSERT(a # NIL, 20);
        IF ~In(actions, a) & ~In(candidates, a) THEN
            Incl(actions, a)
        END;
        a.notBefore := notBefore;    (* if a was already in a list, this statement updates the notBefore value *)
        IF notBefore = immediately THEN hasImmediates := TRUE END
    END DoLater;

    PROCEDURE RemoveAction* (a: Action);
    (** Unregister action a. If a is not registered, nothing happens **)
    BEGIN
        IF a # NIL THEN
            Excl(actions, a);
            Excl(candidates, a)
        END
    END RemoveAction;

    PROCEDURE IterateOverActions (time: LONGINT);
        VAR p: Action;
    BEGIN
        Cleanup;    (* trap handling, if necessary *)
        (* candidates = NIL *)
        candidates := actions; actions := NIL;        (* move action list to candidates list *)
        WHILE candidates # NIL DO                    (* for every candidate: execute it or put it back into actions list *)
            p := candidates; candidates := p.next;    (* remove head element from candidates list *)
            IF (0 <= p.notBefore) & (p.notBefore <= time) OR (p.notBefore <= time) & (time < 0) THEN
                p.next := NIL; Exec(p)                    (* warning: p may call DoLater or RemoveAction,
                                                                        which change the lists! *)
            ELSE
                p.next := actions; actions := p        (* move to actions list for later processing *)
            END
        END
    END IterateOverActions;


    PROCEDURE (h: ActionHook) Step*, NEW, ABSTRACT;

    PROCEDURE (h: ActionHook) Loop*, NEW, ABSTRACT;


    PROCEDURE (h: StdHook) Step;    
    BEGIN
        IF (candidates = NIL) OR (trapCnt < Kernel.trapCount) THEN
            IterateOverActions(Ticks())
        END
    END Step;

    PROCEDURE (h: StdHook) Loop;
    BEGIN
        IF hasImmediates THEN
            ASSERT((candidates = NIL) OR (trapCnt < Kernel.trapCount), 100);
            IterateOverActions(immediately);
            hasImmediates := FALSE
        END
    END Loop;


    (* type handling functions *)

    PROCEDURE ThisDesc (IN type: ARRAY OF CHAR; load: BOOLEAN): Kernel.Type;
        CONST record = 1; pointer = 3;
        VAR m: Kernel.Module; t: Kernel.Type; i, j: INTEGER; ch: CHAR;
            typ: Kernel.Name; mod: ARRAY 256 OF CHAR;
    BEGIN
        ASSERT(type # "", 20);
        i := 0; ch := type[0];
        WHILE (ch # ".") & (ch # 0X) DO mod[i] := ch; INC(i); ch := type[i] END;
        ASSERT(ch = ".", 21);
        mod[i] := 0X; INC(i); t := NIL;
        IF load THEN
            m := Kernel.ThisMod(mod)
        ELSE typ := SHORT(mod$); m := Kernel.ThisLoadedMod(typ)
        END;
        
        IF m # NIL THEN
            j := 0; REPEAT ch := type[i]; typ[j] := SHORT(ch); INC(i); INC(j) UNTIL ch = 0X;
            t := Kernel.ThisType(m, typ);
            IF t = NIL THEN typ[j - 1] := "^"; typ[j] := 0X; t := Kernel.ThisType(m, typ) END
        END;
        IF t # NIL THEN
            IF t.id MOD 4 = pointer THEN t := t.base[0] END;
            IF t.id MOD 4 # record THEN t := NIL END
        END;
        RETURN t
    END ThisDesc;

    PROCEDURE GetTypeName* (IN rec: ANYREC; OUT type: ARRAY OF CHAR);
        VAR i, j: INTEGER; ch: CHAR; t: Kernel.Type; name: Kernel.Name;
    BEGIN
        t := Kernel.TypeOf(rec);
        Kernel.GetTypeName(t, name); type := t.mod.name$;
        i := 0; ch := type[0]; WHILE ch # 0X DO INC(i); ch := type[i] END;
        type[i] := "."; INC(i);
        j := 0; REPEAT ch := name[j]; type[i] := ch; INC(i); INC(j) UNTIL ch = 0X;
        IF type[i - 2] = "^" THEN type[i - 2] := 0X END
    END GetTypeName;

    PROCEDURE SameType* (IN ra, rb: ANYREC): BOOLEAN;
    BEGIN
        RETURN Kernel.TypeOf(ra) = Kernel.TypeOf(rb)
    END SameType;

    PROCEDURE IsExtensionOf* (IN ra, rb: ANYREC): BOOLEAN;
        VAR ta, tb: Kernel.Type;
    BEGIN
        ta := Kernel.TypeOf(ra); tb := Kernel.TypeOf(rb);
        RETURN ta.base[tb.id DIV 16 MOD 16] = tb
    END IsExtensionOf;

    PROCEDURE Is* (IN rec: ANYREC; IN type: ARRAY OF CHAR): BOOLEAN;
        VAR ta, tb: Kernel.Type;
    BEGIN
        ta := Kernel.TypeOf(rec); tb := ThisDesc(type, FALSE);
        IF tb # NIL THEN RETURN ta.base[tb.id DIV 16 MOD 16] = tb
        ELSE RETURN FALSE
        END
    END Is;

    PROCEDURE Extends* (IN type, base: ARRAY OF CHAR): BOOLEAN;
        VAR ta, tb: Kernel.Type;
    BEGIN
        ASSERT((type # "") & (base # ""), 20);
        ta := ThisDesc(type, TRUE); tb := ThisDesc(base, FALSE);
        IF (ta # NIL) & (tb # NIL) THEN RETURN ta.base[tb.id DIV 16 MOD 16] = tb
        ELSE RETURN FALSE
        END
    END Extends;

    PROCEDURE Level* (IN type: ARRAY OF CHAR): INTEGER;
        VAR t: Kernel.Type;
    BEGIN
        t := ThisDesc(type, TRUE);
        RETURN t.id DIV 16 MOD 16
    END Level;

    PROCEDURE TypeLevel* (IN rec: ANYREC): INTEGER;
        VAR t: Kernel.Type;
    BEGIN
        t := Kernel.TypeOf(rec);
        IF t = NIL THEN RETURN -1
        ELSE RETURN t.id DIV 16 MOD 16
        END
    END TypeLevel;

    PROCEDURE AdrOf* (IN rec: ANYREC): INTEGER;
    BEGIN
        RETURN SYSTEM.ADR(rec)
    END AdrOf;

    PROCEDURE Collect*;
    BEGIN
        Kernel.FastCollect
    END Collect;


    PROCEDURE Init;
        VAR h: StdHook;
    BEGIN
        NEW(h); actionHook := h
    END Init;

BEGIN    
    Init
END Services.
