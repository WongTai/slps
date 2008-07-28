%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Comstruct Prolog-based BGF representation from XML representation %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

xmlToG(G,g(Rs2,Ps2))
 :-
    self(name(bgf:grammar),G), 
    children(name(root),G,Rs1),
    children(name(bgf:production),G,Ps1),
    maplist(xmlToR,Rs1,Rs2),
    maplist(xmlToP,Ps1,Ps2),
    !.

xmlToR(R,N)
 :-
    self(name(root),R),
    !,
    content(R,N). 

xmlToP(P,p(As,V,X))
 :-
    self(name(bgf:production),P),
    !,
    ( child(name(label),P,LA) ->
          ( 
            As = [l(L)],
            content(LA,L)
          )
        ; As = []
    ),
    child(name(nonterminal),P,N),
    content(N,V),
    child(name(bgf:expression),P,X1),
    xmlToExpression(X1,X),
    !.

xmlToExpression(X1,X3) 
 :-
    self(name(bgf:expression),X1),
    !,
    child(element,X1,X2),
    xmlToX(X2,X3),
    !.

xmlToX(X,true) 
 :-
    self(name(epsilon),X),
    !.

xmlToX(X,fail) 
 :-
    self(name(empty),X),
    !.

xmlToX(X,t(T)) 
 :-
    self(name(terminal),X),
    !,
    content(X,T),
    !.

xmlToX(X,n(N)) 
 :-
    self(name(nonterminal),X),
    !,
    content(X,N),
    !.

xmlToX(X,a) 
 :-
    self(name(any),X),
    !.

xmlToX(X1,s(S2,X3)) 
 :-
    self(name(selectable),X1),
    !,
    child(name(selector),X1,S1),
    content(S1,S2),
    child(name(bgf:expression),X1,X2),
    xmlToExpression(X2,X3),
    !.

xmlToX(X1,','(Xs2)) 
 :-
    self(name(sequence),X1),
    !,
    children(element,X1,Xs1),
    maplist(xmlToExpression,Xs1,Xs2),
    !.

xmlToX(X1,';'(Xs2)) 
 :-
    self(name(choice),X1),
    !,
    children(element,X1,Xs1),
    maplist(xmlToExpression,Xs1,Xs2),
    !.

xmlToX(X1,'?'(X3)) 
 :-
    self(name(optional),X1),
    !,
    child(element,X1,X2),
    xmlToExpression(X2,X3),
    !.

xmlToX(X1,'*'(X3)) 
 :-
    self(name(star),X1),
    !,
    child(element,X1,X2),
    xmlToExpression(X2,X3),
    !.

xmlToX(X1,'+'(X3)) 
 :-
    self(name(plus),X1),
    !,
    child(element,X1,X2),
    xmlToExpression(X2,X3),
    !.