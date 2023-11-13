:- module(Flow_21091719_VarasVargas, [flow/4, flowAddOption/3]).
:- use_module('Option_21091719_VarasVargas.pl').
:- use_module('Extras_21091719_VarasVargas.pl').

/*
Estructura flow
     Indice    Mensaje                      Lista_opcions  Flow_salida
flow(  1,     “Flujo 1: mensaje de prueba“,   [ ],              F1).
*/


%Descripcion: Funcion que realiza la creacion de un flow
%tipo de algoritmo: Creacion de lista
%Dom: Indice X Mensaje X Options
%Rec: Flow

flow(Indice, Mensaje, Lista_opcions, [Indice, Mensaje, Options]):-

    once(remover_id_duplicados(Lista_opcions,Options)).


%Descripcion: Funcion que agrega un nuevo option a un flujo
%tipo de algoritmo: Concatenacion de elemento
%Dom: Flow X option X flow
%Rec: Flow

flowAddOption([Indice, Mensaje, Options], New_Option, Flow_Salida):-

    append(Options, [New_Option], Options_Aux),
    once(remover_id_duplicados(Options_Aux,Options_Sal)),
    flow(Indice, Mensaje, Options_Sal,Flow_Salida).
