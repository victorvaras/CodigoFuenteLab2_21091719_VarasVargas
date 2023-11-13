:- module(Option_21091719_VarasVargas, [option/6]).

/*
Estructura funcion option
       code    mensaje  chatbot  flujo     palabras claves                    option_salida
option(1, “1 - viajar”, 2,        4,      [“viajar”, “turistear”, “conocer”], O1). 
*/

%Descripcion: Funcion que realiza la creacion de un option
%tipo de algoritmo: Creacion de lista
%Dom: Code X Mensaje X Chatbot X Flujo X Palabras_claves
%Rec: option
option(Code, Mensaje, Chatbot, Flujo, Palabras_claves, Option_salida):-
    Option_salida = [Code, Mensaje, Chatbot, Flujo, Palabras_claves].
