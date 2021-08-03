% Copyright Kevin

implement dlg_Encadenamiento inherits dialog
    open core, vpiDomains

clauses
    display(Parent) = Dialog :-
        Dialog = new(Parent),
        Dialog:show().

clauses
    new(Parent) :-
        dialog::new(Parent),
        generatedInitialize().

predicates
    r1 : (string, string, string, string, string [out]) determ.
    r2 : (string, string, string, string [out]) determ.
    tipoSemilla : (string, string [out]) determ.

clauses
    r1(Forma, Diametro, NSemillas, Color, Fruta) :-
        Forma = "Alargada",
        Diametro = "",
        NSemillas = "",
        Color = "Verde",
        Fruta = "Banana",
        !.
    r1(Forma, Diametro, NSemillas, Color, Fruta) :-
        Forma = "Alargada",
        Diametro = "",
        NSemillas = "",
        Color = "Amarillo",
        Fruta = "Banana",
        !.
    r1(Forma, Diametro, NSemillas, Color, Fruta) :-
        Forma = "Redonda",
        D = toTerm(Diametro),
        D > 1.6,
        NSemillas = "",
        Color = "Verde",
        Fruta = "Sandia",
        !.
    r1(Forma, Diametro, NSemillas, Color, Fruta) :-
        Forma = "Redonda",
        D = toTerm(Diametro),
        D < 1.6,
        NSemillas <> "",
        Color <> "",
        tipoSemilla(NSemillas, ClaseSemilla),
        r2("Arbol", Color, ClaseSemilla, Fruta),
        !.
    r1(Forma, Diametro, NSemillas, Color, Fruta) :-
        Forma = "Planta",
        Color = "Amarillo",
        Diametro = "",
        NSemillas = "",
        Fruta = "Melon",
        !.
    tipoSemilla(NSemillas, ClaseSemilla) :-
        NS = toTerm(NSemillas),
        NS = 1,
        ClaseSemilla = "Hueso",
        !.
    tipoSemilla(NSemillas, ClaseSemilla) :-
        NS = toTerm(NSemillas),
        NS > 1,
        ClaseSemilla = "Multiple",
        !.
    r2(ClaseFruta, Color, ClaseSemilla, Fruta) :-
        ClaseFruta = "Arbol",
        Color = "Naranja",
        ClaseSemilla = "Multiple",
        Fruta = "Naranja",
        !.
    r2(ClaseFruta, Color, ClaseSemilla, Fruta) :-
        ClaseFruta = "Arbol",
        Color = "Rojo",
        ClaseSemilla = "Hueso",
        Fruta = "Cereza",
        !.
    r2(ClaseFruta, Color, ClaseSemilla, Fruta) :-
        ClaseFruta = "Arbol",
        Color = "Naranja",
        ClaseSemilla = "Hueso",
        Fruta = "Melocoton".

predicates
    onPushButtonClick : button::clickResponder.
clauses
    onPushButtonClick(_Source) = button::defaultAction :-
        txt_fruta:setText("Ninguna Fruta"),
        Forma = txt_forma:getText(),
        Diametro = txt_diametro:getText(),
        NSemillas = txt_nsemillas:getText(),
        Color = txt_color:getText(),
        r1(Forma, Diametro, NSemillas, Color, F),
        txt_fruta:setText(F),
        !.
    onPushButtonClick(_Source) = button::defaultAction.

predicates
    onTxt_formaModified : editControl::modifiedListener.
clauses
    onTxt_formaModified(_Source).

predicates
    onTxt_colorModified : editControl::modifiedListener.
clauses
    onTxt_colorModified(_Source).

predicates
    onBtnnuevoClick : button::clickResponder.
clauses
    onBtnnuevoClick(_Source) = button::defaultAction :-
        txt_nsemillas:setText(""),
        txt_forma:setText(""),
        txt_color:setText(""),
        txt_diametro:setText(""),
        txt_fruta:setText("").

predicates
    onBtnsalirClick : button::clickResponder.
clauses
    onBtnsalirClick(_Source) = button::defaultAction :-
        close().

% This code is maintained automatically, do not update it manually.
%  01:53:04-3.8.2021
facts
    staticText3_ctl : textControl.
    txt_nsemillas : editControl.
    btnfruta_ctl : button.
    txt_forma : editControl.
    txt_color : editControl.
    txt_diametro : editControl.
    btnnuevo_ctl : button.
    txt_fruta : editControl.
    btnsalir_ctl : button.

predicates
    generatedInitialize : ().
clauses
    generatedInitialize() :-
        setText("dlg_Encadenamiento"),
        setRect(rct(50, 40, 254, 262)),
        setModal(true),
        setDecoration(titlebar([closeButton])),
        setState([wsf_NoClipSiblings]),
        StaticText_ctl = textControl::new(This),
        StaticText_ctl:setText("FORMA:"),
        StaticText_ctl:setPosition(28, 52),
        StaticText_ctl:setSize(68, 10),
        StaticText2_ctl = textControl::new(This),
        StaticText2_ctl:setText("NRO DE SEMILLAS:"),
        StaticText2_ctl:setPosition(28, 74),
        StaticText2_ctl:setSize(68, 10),
        staticText3_ctl := textControl::new(This),
        staticText3_ctl:setText("COLOR:"),
        staticText3_ctl:setPosition(28, 96),
        staticText3_ctl:setSize(68, 10),
        txt_nsemillas := editControl::new(This),
        txt_nsemillas:setText(""),
        txt_nsemillas:setPosition(108, 72),
        txt_nsemillas:setWidth(68),
        GroupBox_ctl = groupBox::new(This),
        GroupBox_ctl:setText(""),
        GroupBox_ctl:setPosition(8, 20),
        GroupBox_ctl:setSize(188, 128),
        btnfruta_ctl := button::new(GroupBox_ctl),
        btnfruta_ctl:setText("CALCULAR"),
        btnfruta_ctl:setPosition(107, 92),
        btnfruta_ctl:setWidth(56),
        btnfruta_ctl:defaultHeight := true,
        btnfruta_ctl:setClickResponder(onPushButtonClick),
        txt_forma := editControl::new(GroupBox_ctl),
        txt_forma:setText(""),
        txt_forma:setPosition(99, 22),
        txt_forma:setWidth(68),
        txt_forma:addModifiedListener(onTxt_formaModified),
        txt_color := editControl::new(GroupBox_ctl),
        txt_color:setText(""),
        txt_color:setPosition(99, 66),
        txt_color:setWidth(68),
        txt_color:addModifiedListener(onTxt_colorModified),
        txt_diametro := editControl::new(GroupBox_ctl),
        txt_diametro:setText(""),
        txt_diametro:setPosition(99, 0),
        txt_diametro:setWidth(68),
        btnnuevo_ctl := button::new(GroupBox_ctl),
        btnnuevo_ctl:setText("NUEVO"),
        btnnuevo_ctl:setPosition(23, 92),
        btnnuevo_ctl:setWidth(56),
        btnnuevo_ctl:defaultHeight := true,
        btnnuevo_ctl:setClickResponder(onBtnnuevoClick),
        StaticText1_ctl = textControl::new(GroupBox_ctl),
        StaticText1_ctl:setText("DIAMETRO:"),
        StaticText1_ctl:setPosition(19, 2),
        StaticText1_ctl:setSize(68, 10),
        StaticText4_ctl = textControl::new(This),
        StaticText4_ctl:setText("RESULTADO:"),
        StaticText4_ctl:setPosition(28, 168),
        StaticText4_ctl:setSize(68, 10),
        txt_fruta := editControl::new(This),
        txt_fruta:setText(""),
        txt_fruta:setPosition(104, 166),
        txt_fruta:setWidth(72),
        txt_fruta:setEnabled(false),
        btnsalir_ctl := button::new(This),
        btnsalir_ctl:setText("SALIR"),
        btnsalir_ctl:setPosition(72, 192),
        btnsalir_ctl:setWidth(56),
        btnsalir_ctl:defaultHeight := true,
        btnsalir_ctl:setClickResponder(onBtnsalirClick).
% end of automatic code

end implement dlg_Encadenamiento
