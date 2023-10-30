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

    once(remove(Lista_opcions,Options)),
    constructor_flow(Indice, Mensaje, Options,Flow_salida).

%Caso de crear flujo sin options
%flow(1,"flujo",[],F1).

%Caso de crear flujo con options repetidos
%option(1,"1 - viajar  ",2,4,["viajar","turistear"],O1), option(2,"2 - Estudiar",4,3,["aprender", "perfecionarme"], O2),flow(1,"flujo",[O1,O2,O1,O2,O2],F2).

%option(1,"1 - viajar  ",2,4,["viajar","turistear"],O1), option(2,"2 - Estudiar",4,3,["aprender", "perfecionarme"], O2),flow(1,"flujo",[O1],F2).

flowAddOption([Indice, Mensaje, Options], New_Option, Flow_Salida):-

    append(Options, [New_Option], Options_Aux),
    once(remove(Options_Aux,Options_Sal)),
    constructor_flow(Indice, Mensaje, Options_Sal,Flow_Salida).

%option(1,"1 - viajar  ",2,4,["viajar","turistear"],O1), option(2,"2 - Estudiar",4,3,["aprender", "perfecionarme"], O2), flow(1,"flujo",[],F1), flowAddOption(F1,O1,F2), flowAddOption(F2,O2,F3), flowAddOption(F3,O1,F4).
