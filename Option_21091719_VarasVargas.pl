:- module(Option_21091719_VarasVargas, [option/6]).

/*
Estructura funcion option
       code    mensaje  chatbot  flujo     palabras claves                    option_salida
option(1, “1 - viajar”, 2,        4,      [“viajar”, “turistear”, “conocer”], O1). 
*/

%Funcion encargada de crear un option
option(Code, Mensaje, Chatbot, Flujo, Palabras_claves, Option_salida):-
    Option_salida = [Code, Mensaje, Chatbot, Flujo, Palabras_claves].
