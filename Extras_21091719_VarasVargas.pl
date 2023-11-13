:- module(Extras_21091719_VarasVargas, [remover_id_duplicados/2, myRandom/2, numero_a_lista/2]).
:- use_module('Option_21091719_VarasVargas.pl').

% set_prolog_flag(answer_write_options,[max_depth(0)]).


%Descripcion: funcion que valida si un id se encuentra un ID en particular dentro del primer elemento de una sub lista
%tipo de algoritmo: recursion
%Dom: Id X List 
%Rec: bool
esta_ID(X, [X|_]):-!.
esta_ID(X, [_|T]) :- esta_ID(X, T).


%Descripcion: funcion que valida si un id particular se encuentra repetido o no dentro de la estructra
%tipo de algoritmo: unificacion y recursion
%Dom: list X list
%Rec: list
remover_id_duplicados([], []):-!.

remover_id_duplicados([Sub_lista|Resto], Salida) :-
    [Primer_elemento|_] = Sub_lista,
    \+ (esta_ID([Primer_elemento|_], Resto)),
    Salida = [Sub_lista|Res_aux],
    remover_id_duplicados(Resto, Res_aux).



%Descripcion: funcion que dado un numero genera un numero seudo aleatorio
%tipo de algoritmo: operaciones logicas
%Dom: number X number
%Rec: number
myRandom(Xn, Xn1):-
	MulTemp is 1103515245 * Xn,
	SumTemp is MulTemp + 12345,
	Xn1 is SumTemp mod 2147483648. 


%Descripcion: funcion que dado un numero lo ingresa a una lista digito por digito
%tipo de algoritmo: recursion
%Dom: number X list
%Rec: list
numero_a_lista(0, [0]).
numero_a_lista(N, Lista) :-
    N > 0,
    numero_a_lista_aux(N, ListaReversa),
    reverse(ListaReversa, Lista).

numero_a_lista_aux(0, []).
numero_a_lista_aux(N, [D | Resto]) :-
    N > 0,
    D is N mod 10,
    NuevoN is N // 10,
    numero_a_lista_aux(NuevoN, Resto).