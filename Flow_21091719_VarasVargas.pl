:- module(Flow_21091719_VarasVargas, [flow/4, flowAddOption/3]).
:- use_module('Option_21091719_VarasVargas.pl').
:- use_module('Extras_21091719_VarasVargas.pl').

/*
Estructura flow
     Indice    Mensaje                      Lista_opcions  Flow_salida
flow(  1,     “Flujo 1: mensaje de prueba“,   [ ],              F1).
*/


constructor_flow(Indice, Mensaje, Options, [Indice, Mensaje, Options]).

flow(Indice, Mensaje, Lista_opcions, Flow_salida):-

    once(remover_id_duplicados(Lista_opcions,Options)),
    constructor_flow(Indice, Mensaje, Options,Flow_salida).

flowAddOption([Indice, Mensaje, Options], New_Option, Flow_Salida):-

    append(Options, [New_Option], Options_Aux),
    once(remover_id_duplicados(Options_Aux,Options_Sal)),
    constructor_flow(Indice, Mensaje, Options_Sal,Flow_Salida).
