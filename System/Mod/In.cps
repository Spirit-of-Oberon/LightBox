﻿MODULE In;
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

    IMPORT TextMappers, TextControllers;

    VAR
        Done-: BOOLEAN;
        s: TextMappers.Scanner;

    PROCEDURE Open*;
        VAR c: TextControllers.Controller; beg, end: INTEGER;
    BEGIN
        c := TextControllers.Focus();
        IF c # NIL THEN
            IF c.HasSelection() THEN c.GetSelection(beg, end) ELSE beg := 0 END;
            s.ConnectTo(c.text); s.SetPos(beg); s.rider.Read; Done := TRUE
        ELSE
            s.ConnectTo(NIL); Done := FALSE
        END
    END Open;

    PROCEDURE Char* (OUT ch: CHAR);
    BEGIN
        IF Done THEN
            IF s.rider.eot THEN Done := FALSE
            ELSE ch := s.rider.char; s.rider.Read
            END
        END
    END Char;

    PROCEDURE Int* (OUT i: INTEGER);
    BEGIN
        IF Done THEN
            s.Scan;
            IF (s.type = TextMappers.int) THEN
                i := s.int
            ELSE Done := FALSE
            END
        END
    END Int;

    PROCEDURE LongInt* (OUT l: LONGINT);
    BEGIN
        IF Done THEN
            s.Scan;
            IF (s.type = TextMappers.lint) OR (s.type = TextMappers.int) THEN
                l := s.lint
            ELSE Done := FALSE
            END
        END
    END LongInt;

    PROCEDURE Real* (OUT x: REAL);
    BEGIN
        IF Done THEN
            s.Scan;
            IF s.type = TextMappers.real THEN
                x := SHORT(s.real)
            ELSIF s.type = TextMappers.int THEN
                x := s.int
            ELSE Done := FALSE
            END
        END
    END Real;

    PROCEDURE Name* (OUT name: ARRAY OF CHAR);
    BEGIN
        IF Done THEN
            s.Scan;
            TextMappers.ScanQualIdent(s, name, Done)
        END
    END Name;

    PROCEDURE String* (OUT str: ARRAY OF CHAR);
    BEGIN
        IF Done THEN
            s.Scan;
            IF s.type = TextMappers.string THEN
                str := s.string$
            ELSE Done := FALSE
            END
        END
    END String;

END In.
