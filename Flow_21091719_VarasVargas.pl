:- use_module(Option_21091719_VarasVargas).

/*
Estructura flow
     Indice    Mensaje                      Lista_opcions  Flow_salida
flow(  1,     “Flujo 1: mensaje de prueba“,   [ ],              F1).
*/

flow(Indice, Mensaje, Lista_opcions, Flow_salida):-

    Flow_salida = [Indice, Mensaje, Lista_opcions].

%flow(1,"flujo",[],F1)
%flow(1,"flujo",[O1,O2],F2), option(1,"1 - viajar",2,4,["viajar","turistear"],O1), option(2, "2 - Estudiar", 4, 3, ["aprender", "perfecionarme"], O2).

%[1,flujo,[[1,1 - viajar,2,4,[viajar,turistear]]]]
%[1,flujo,[[1,1 - viajar,2,4,[viajar,turistear]],[2,2 - Estudiar,4,3,[aprender,perfecionarme]]]].