:- module(Extras_21091719_VarasVargas, [remover_id_duplicados/2, myRandom/2, numero_a_lista/2]).
:- use_module('Option_21091719_VarasVargas.pl').

% set_prolog_flag(answer_write_options,[max_depth(0)]).


% Predicado para verificar si un elemento está en una lista.
esta_ID(X, [X|_]):-!.
esta_ID(X, [_|T]) :- esta_ID(X, T).


% Predicado para eliminar las sublistas cuyo primer elemento se repite.
remover_id_duplicados([], []):-!.

remover_id_duplicados([Sub_lista|Resto], Salida) :-
    [Primer_elemento|_] = Sub_lista,
    \+ (esta_ID([Primer_elemento|_], Resto)),
    Salida = [Sub_lista|Res_aux],
    remover_id_duplicados(Resto, Res_aux).


myRandom(Xn, Xn1):-
	MulTemp is 1103515245 * Xn,
	SumTemp is MulTemp + 12345,
	Xn1 is SumTemp mod 2147483648. 

% Predicado para convertir un número en una lista de dígitos
numero_a_lista(0, [0]).
numero_a_lista(N, Lista) :-
    N > 0,
    numero_a_lista_aux(N, ListaReversa),
    reverse(ListaReversa, Lista).

% Predicado auxiliar para convertir un número en una lista de dígitos (reversa)
numero_a_lista_aux(0, []).
numero_a_lista_aux(N, [D | Resto]) :-
    N > 0,
    D is N mod 10,
    NuevoN is N // 10,
    numero_a_lista_aux(NuevoN, Resto).