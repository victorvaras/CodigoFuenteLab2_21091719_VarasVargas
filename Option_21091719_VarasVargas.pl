%:- use_module('Extras_21091719_VarasVargas.pl').
:- module(Option_21091719_VarasVargas, [option/6]).

/*
Estructura funcion option
       code    mensaje  chatbot  flujo     palabras claves                    option_salida
option(1, “1 - viajar”, 2,        4,      [“viajar”, “turistear”, “conocer”], O1). 
*/

%Funcion encargada de crear un option
option(Code, Mensaje, Chatot, Flujo, Palabras_claves, Option_salida):-
    Option_salida = [Code, Mensaje, Chatot, Flujo, Palabras_claves].


%option(1,"1 - viajar",2,4,["viajar","turistear"],O1).
%option(2, "2 - Estudiar", 4, 3, ["aprender", "perfecionarme"], O2). 