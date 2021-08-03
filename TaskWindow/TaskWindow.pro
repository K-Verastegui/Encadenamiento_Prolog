% Copyright Kevin

implement taskWindow inherits applicationWindow
    open core, vpiDomains

constants
    mdiProperty : boolean = true.

clauses
    new() :-
        applicationWindow::new(),
        generatedInitialize().

predicates
    onShow : window::showListener.
clauses
    onShow(_, _CreationData).

class predicates
    onDestroy : window::destroyListener.
clauses
    onDestroy(_).

%class predicates
%    onHelpAbout : window::menuItemListener.
%clauses
%    onHelpAbout(TaskWin, _MenuTag) :-
%        _AboutDialog = aboutDialog::display(TaskWin).
%predicates
%    onFileExit : window::menuItemListener.
%clauses
%    onFileExit(_, _MenuTag) :-
%        close().
predicates
    onSizeChanged : window::sizeListener.
clauses
    onSizeChanged(_) :-
        vpiToolbar::resize(getVPIWindow()).

predicates
    onConsultar : window::menuItemListener.
clauses
    onConsultar(_Source, _MenuTag) :-
        _ = dlg_Encadenamiento::display(This).

predicates
    onSalir : window::menuItemListener.
clauses
    onSalir(_Source, _MenuTag) :-
        Rpta = vpiCommonDialogs::messageBox("Sistema", "Desea salir?", 1, 2, 1, 1),
        valida(Rpta).

predicates
    valida : (integer).
clauses
    valida(1) :-
        close(),
        !.
    valida(_).
% This code is maintained automatically, do not update it manually.
%  00:50:19-3.8.2021

predicates
    generatedInitialize : ().
clauses
    generatedInitialize() :-
        setText("se_encadenamiento"),
        setDecoration(titlebar([closeButton, maximizeButton, minimizeButton])),
        setBorder(sizeBorder()),
        setState([wsf_ClipSiblings, wsf_Maximized]),
        whenCreated({  :- projectToolbar::create(getVpiWindow()) }),
        addSizeListener({  :- vpiToolbar::resize(getVpiWindow()) }),
        setMdiProperty(mdiProperty),
        menuSet(resMenu(resourceIdentifiers::id_TaskMenu)),
        addShowListener(onShow),
        addSizeListener(onSizeChanged),
        addDestroyListener(onDestroy),
        addMenuItemListener(resourceIdentifiers::id_consultar, onConsultar),
        addMenuItemListener(resourceIdentifiers::id_salir, onSalir).
% end of automatic code

end implement taskWindow
