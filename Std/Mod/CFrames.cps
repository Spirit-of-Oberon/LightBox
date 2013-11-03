﻿MODULE StdCFrames;
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

    IMPORT Fonts, Ports, Views, Dates, Dialog;

    CONST lineUp* = 0; lineDown* = 1; pageUp* = 2; pageDown* = 3;

    TYPE
        Frame* = POINTER TO ABSTRACT RECORD (Views.Frame)
            disabled*, undef*, readOnly*, noRedraw*: BOOLEAN;
            font*: Fonts.Font
        END;

        PushButton* = POINTER TO ABSTRACT RECORD (Frame)
            label*: ARRAY 256 OF CHAR;
            default*, cancel*: BOOLEAN;
            Do*: PROCEDURE (f: PushButton)
        END;

        CheckBox* = POINTER TO ABSTRACT RECORD (Frame)
            label*: ARRAY 256 OF CHAR;
            Get*: PROCEDURE (f: CheckBox; OUT on: BOOLEAN);
            Set*: PROCEDURE (f: CheckBox; on: BOOLEAN)
        END;

        RadioButton* = POINTER TO ABSTRACT RECORD (Frame)
            label*: ARRAY 256 OF CHAR;
            Get*: PROCEDURE (f: RadioButton; OUT on: BOOLEAN);
            Set*: PROCEDURE (f: RadioButton; on: BOOLEAN)
        END;

        ScrollBar* = POINTER TO ABSTRACT RECORD (Frame)
            Track*: PROCEDURE (f: ScrollBar; dir: INTEGER; VAR pos: INTEGER);
            Get*: PROCEDURE (f: ScrollBar; OUT size, sect, pos: INTEGER);
            Set*: PROCEDURE (f: ScrollBar; pos: INTEGER)
        END;

        Field* = POINTER TO ABSTRACT RECORD (Frame)
            maxLen*: INTEGER;    (* max num of characters in field (w/o 0X) *)
            left*, right*, multiLine*, password*: BOOLEAN;
            Get*: PROCEDURE (f: Field; OUT string: ARRAY OF CHAR);
            Set*: PROCEDURE (f: Field; IN string: ARRAY OF CHAR);
            Equal*: PROCEDURE (f: Field; IN s1, s2: ARRAY OF CHAR): BOOLEAN
        END;
        
        UpDownField* = POINTER TO ABSTRACT RECORD (Frame)
            min*, max*, inc*: INTEGER;
            Get*: PROCEDURE (f: UpDownField; OUT val: INTEGER);
            Set*: PROCEDURE (f: UpDownField; val: INTEGER)
        END;
            
        DateField* = POINTER TO ABSTRACT RECORD (Frame)
            Get*: PROCEDURE (f: DateField; OUT date: Dates.Date);
            Set*: PROCEDURE (f: DateField; IN date: Dates.Date);
            GetSel*: PROCEDURE (f: DateField; OUT sel: INTEGER);
            SetSel*: PROCEDURE (f: DateField; sel: INTEGER)
        END;
            
        TimeField* = POINTER TO ABSTRACT RECORD (Frame)
            Get*: PROCEDURE (f: TimeField; OUT date: Dates.Time);
            Set*: PROCEDURE (f: TimeField; IN date: Dates.Time);
            GetSel*: PROCEDURE (f: TimeField; OUT sel: INTEGER);
            SetSel*: PROCEDURE (f: TimeField; sel: INTEGER)
        END;
            
        ColorField* = POINTER TO ABSTRACT RECORD (Frame)
            Get*: PROCEDURE (f: ColorField; OUT col: INTEGER);
            Set*: PROCEDURE (f: ColorField; col: INTEGER)
        END;
        
        ListBox* = POINTER TO ABSTRACT RECORD (Frame)
            sorted*: BOOLEAN;
            Get*: PROCEDURE (f: ListBox; OUT i: INTEGER);
            Set*: PROCEDURE (f: ListBox; i: INTEGER);
            GetName*: PROCEDURE (f: ListBox; i: INTEGER; VAR name: ARRAY OF CHAR)
        END;
        
        SelectionBox* = POINTER TO ABSTRACT RECORD (Frame)
            sorted*: BOOLEAN;
            Get*: PROCEDURE (f: SelectionBox; i: INTEGER; OUT in: BOOLEAN);
            Incl*: PROCEDURE (f: SelectionBox; from, to: INTEGER);
            Excl*: PROCEDURE (f: SelectionBox; from, to: INTEGER);
            Set*: PROCEDURE (f: SelectionBox; from, to: INTEGER);
            GetName*: PROCEDURE (f: SelectionBox; i: INTEGER; VAR name: ARRAY OF CHAR)
        END;
        
        ComboBox* = POINTER TO ABSTRACT RECORD (Frame)
            sorted*: BOOLEAN;
            Get*: PROCEDURE (f: ComboBox; OUT string: ARRAY OF CHAR);
            Set*: PROCEDURE (f: ComboBox; IN string: ARRAY OF CHAR);
            GetName*: PROCEDURE (f: ComboBox; i: INTEGER; VAR name: ARRAY OF CHAR)
        END;
        
        Caption* = POINTER TO ABSTRACT RECORD (Frame)
            label*: ARRAY 256 OF CHAR;
            left*, right*: BOOLEAN;
        END;
        
        Group* = POINTER TO ABSTRACT RECORD (Frame)
            label*: ARRAY 256 OF CHAR
        END;

        TreeFrame* = POINTER TO ABSTRACT RECORD (Frame)
            sorted*, haslines*, hasbuttons*, atroot*, foldericons*: BOOLEAN;
            NofNodes*: PROCEDURE (f: TreeFrame): INTEGER;
            Child*: PROCEDURE (f: TreeFrame; node: Dialog.TreeNode): Dialog.TreeNode;
            Parent*: PROCEDURE (f: TreeFrame; node: Dialog.TreeNode): Dialog.TreeNode;
            Next*:  PROCEDURE (f: TreeFrame; node: Dialog.TreeNode): Dialog.TreeNode;
            Select*:  PROCEDURE (f: TreeFrame; node: Dialog.TreeNode);
            Selected*:  PROCEDURE (f: TreeFrame): Dialog.TreeNode;
            SetExpansion*:  PROCEDURE (f: TreeFrame; tn: Dialog.TreeNode; expanded: BOOLEAN)
        END;

        Directory* = POINTER TO ABSTRACT RECORD END;


    VAR
        setFocus*: BOOLEAN;
        defaultFont*, defaultLightFont*: Fonts.Font;
        dir-, stdDir-: Directory;


    (** Frame **)

        
    PROCEDURE (f: Frame) MouseDown* (x, y: INTEGER; buttons: SET), NEW, EMPTY;
    PROCEDURE (f: Frame) WheelMove* (x, y: INTEGER; op, nofLines: INTEGER;
                                                                VAR done: BOOLEAN), NEW, EMPTY;
    PROCEDURE (f: Frame) KeyDown* (ch: CHAR), NEW, EMPTY;
    PROCEDURE (f: Frame) Restore* (l, t, r, b: INTEGER), NEW, ABSTRACT;
    PROCEDURE (f: Frame) UpdateList*, NEW, EMPTY;
    PROCEDURE (f: Frame) Mark* (on, focus: BOOLEAN), NEW, EMPTY;
    PROCEDURE (f: Frame) Edit* (op: INTEGER; VAR v: Views.View; VAR w, h: INTEGER;
                                                    VAR singleton, clipboard: BOOLEAN), NEW, EMPTY;
    PROCEDURE (f: Frame) GetCursor* (x, y: INTEGER; modifiers: SET; VAR cursor: INTEGER), NEW, EMPTY;

    PROCEDURE (f: Frame) Update*, NEW, EXTENSIBLE;
        VAR l, t, r, b: INTEGER; root: Views.RootFrame;
    BEGIN
        l := f.l + f.gx; t := f.t + f.gy; r := f.r + f.gx; b := f.b + f.gy;
        root := Views.RootOf(f);
        Views.UpdateRoot(root, l, t, r, b, Views.keepFrames);
        Views.ValidateRoot(root)
    END Update;

    PROCEDURE (f: Frame) DblClickOk* (x, y: INTEGER): BOOLEAN, NEW, EXTENSIBLE;
    BEGIN
        RETURN TRUE
    END DblClickOk;


    (** Field **)

    PROCEDURE (f: Field) Idle* (), NEW, ABSTRACT;
    PROCEDURE (f: Field) Select* (from, to: INTEGER), NEW, ABSTRACT;
    PROCEDURE (f: Field) GetSelection* (OUT from, to: INTEGER), NEW, ABSTRACT;
    PROCEDURE (f: Field) Length* (): INTEGER, NEW, ABSTRACT;

    PROCEDURE (f: Field) GetCursor* (x, y: INTEGER; modifiers: SET; VAR cursor: INTEGER), EXTENSIBLE;
    BEGIN
        cursor := Ports.textCursor
    END GetCursor;


    (** UpDownField **)

    PROCEDURE (f: UpDownField) Idle*, NEW, ABSTRACT;
    PROCEDURE (f: UpDownField) Select* (from, to: INTEGER), NEW, ABSTRACT;
    PROCEDURE (f: UpDownField) GetSelection* (OUT from, to: INTEGER), NEW, ABSTRACT;

    PROCEDURE (f: UpDownField) GetCursor* (x, y: INTEGER; modifiers: SET;
                                                                        VAR cursor: INTEGER), EXTENSIBLE;
    BEGIN
        cursor := Ports.textCursor
    END GetCursor;


    (** SelectionBox **)

    PROCEDURE (f: SelectionBox) Select* (from, to: INTEGER), NEW, ABSTRACT;
    PROCEDURE (f: SelectionBox) GetSelection* (OUT from, to: INTEGER), NEW, ABSTRACT;
    
    PROCEDURE (f: SelectionBox) UpdateRange* (op, from, to: INTEGER), NEW, EXTENSIBLE;
    BEGIN
        f.Update
    END UpdateRange;


    (** ComboBox **)

    PROCEDURE (f: ComboBox) Idle* (), NEW, ABSTRACT;
    PROCEDURE (f: ComboBox) Select* (from, to: INTEGER), NEW, ABSTRACT;
    PROCEDURE (f: ComboBox) GetSelection* (OUT from, to: INTEGER), NEW, ABSTRACT;
    PROCEDURE (f: ComboBox) Length* (): INTEGER, NEW, ABSTRACT;
    
    (* TreeFrame **)
    PROCEDURE (f: TreeFrame) GetSize* (OUT w, h: INTEGER), NEW, ABSTRACT;

    (** Directory **)

    PROCEDURE (d: Directory) GetPushButtonSize* (VAR w, h: INTEGER), NEW, ABSTRACT;
    PROCEDURE (d: Directory) GetCheckBoxSize* (VAR w, h: INTEGER), NEW, ABSTRACT;
    PROCEDURE (d: Directory) GetRadioButtonSize* (VAR w, h: INTEGER), NEW, ABSTRACT;
    PROCEDURE (d: Directory) GetScrollBarSize* (VAR w, h: INTEGER), NEW, ABSTRACT;
    PROCEDURE (d: Directory) GetFieldSize* (max: INTEGER; VAR w, h: INTEGER), NEW, ABSTRACT;
    PROCEDURE (d: Directory) GetUpDownFieldSize* (max: INTEGER; VAR w, h: INTEGER), NEW, ABSTRACT;
    PROCEDURE (d: Directory) GetDateFieldSize* (VAR w, h: INTEGER), NEW, ABSTRACT;
    PROCEDURE (d: Directory) GetTimeFieldSize* (VAR w, h: INTEGER), NEW, ABSTRACT;
    PROCEDURE (d: Directory) GetColorFieldSize* (VAR w, h: INTEGER), NEW, ABSTRACT;
    PROCEDURE (d: Directory) GetListBoxSize* (VAR w, h: INTEGER), NEW, ABSTRACT;
    PROCEDURE (d: Directory) GetSelectionBoxSize* (VAR w, h: INTEGER), NEW, ABSTRACT;
    PROCEDURE (d: Directory) GetComboBoxSize* (VAR w, h: INTEGER), NEW, ABSTRACT;
    PROCEDURE (d: Directory) GetCaptionSize* (VAR w, h: INTEGER), NEW, ABSTRACT;
    PROCEDURE (d: Directory) GetGroupSize* (VAR w, h: INTEGER), NEW, ABSTRACT;
    PROCEDURE (d: Directory) GetTreeFrameSize* (VAR w, h: INTEGER), NEW, ABSTRACT;
    PROCEDURE (d: Directory) NewPushButton* (): PushButton, NEW, ABSTRACT;
    PROCEDURE (d: Directory) NewCheckBox* (): CheckBox, NEW, ABSTRACT;
    PROCEDURE (d: Directory) NewRadioButton* (): RadioButton, NEW, ABSTRACT;
    PROCEDURE (d: Directory) NewScrollBar* (): ScrollBar, NEW, ABSTRACT;
    PROCEDURE (d: Directory) NewField* (): Field, NEW, ABSTRACT;
    PROCEDURE (d: Directory) NewUpDownField* (): UpDownField, NEW, ABSTRACT;
    PROCEDURE (d: Directory) NewDateField* (): DateField, NEW, ABSTRACT;
    PROCEDURE (d: Directory) NewTimeField* (): TimeField, NEW, ABSTRACT;
    PROCEDURE (d: Directory) NewColorField* (): ColorField, NEW, ABSTRACT;
    PROCEDURE (d: Directory) NewListBox* (): ListBox, NEW, ABSTRACT;
    PROCEDURE (d: Directory) NewSelectionBox* (): SelectionBox, NEW, ABSTRACT;
    PROCEDURE (d: Directory) NewComboBox* (): ComboBox, NEW, ABSTRACT;
    PROCEDURE (d: Directory) NewCaption* (): Caption, NEW, ABSTRACT;
    PROCEDURE (d: Directory) NewGroup* (): Group, NEW, ABSTRACT;
    PROCEDURE (d: Directory) NewTreeFrame* (): TreeFrame, NEW, ABSTRACT;


    PROCEDURE SetDir* (d: Directory);
    BEGIN
        ASSERT(d # NIL, 20); dir := d;
        IF stdDir = NIL THEN stdDir := d END
    END SetDir;

BEGIN
    setFocus := FALSE
END StdCFrames.
