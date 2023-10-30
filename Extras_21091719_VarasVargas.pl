:- module(Extras_21091719_VarasVargas, [remove/2, remover_id_duplicados/2]).
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


remover_id_duplicados([Sub_lista|Resto], Salida) :-
    [Primer_elemento|_] = Sub_lista,
    esta_ID([Primer_elemento|_], Resto),
    remover_id_duplicados(Resto, Salida).


remove(List,Res):-    
    remover_id_duplicados(List,Res).
