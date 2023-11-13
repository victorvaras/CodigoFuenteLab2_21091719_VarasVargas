:- module(ChatBot_21091719_VarasVargas, [chatbot/6, chatbotAddFlow/3]).
:- use_module('Extras_21091719_VarasVargas.pl').
:- use_module('Option_21091719_VarasVargas.pl').
:- use_module('Flow_21091719_VarasVargas.pl').

/*
Estructura chatbot
     Indice    Nombre                      Mensaje                 StartFlowId  flows  chatbot_salida
chatbot(1, "Agencia Viajes",  "Bienvenido\n¿Dónde quieres viajar?", 1,           [F20],Cb1),
*/


%Descripcion: Funcion que realiza la creacion de un chatbot
%tipo de algoritmo: Creacion de lista
%Dom: ID X Nombre X Mensaje X StartFlowId X Flow_salida
%Rec: chatbot

chatbot(ID, Nombre, Mensaje, StartFlowId, Flows, [ID, Nombre, Mensaje, StartFlowId, Flow_salida]):-

    once(remover_id_duplicados(Flows,Flow_salida)).


%Descripcion: Funcion que se agrega un elemento flow al final de una lista de flow
%tipo de algoritmo: recursion natural
%Dom: list_flow X list_flow X flow X list_flow
%Rec: list_flow
append_flow([],List_flow_aux,New_Flow,List_Flow):-
    append(List_flow_aux, New_Flow, List_Flow).

append_flow([Flow | Resto], List_flow_aux, New_Flow, List_Flow):-
    append(List_flow_aux, Flow, Aux),
    append_flow(Resto, Aux, New_Flow, List_Flow).


%Descripcion: Funcion que agrega un nuevo flow al chatbot
%tipo de algoritmo: concatenacion de elemento
%Dom: chatbot X flow X chatbot
%Rec: chatbot
chatbotAddFlow([ID, Nombre, Mensaje, StartFlowId, Flows], New_Flow, ChatBot_Salida):-
    
    append_flow(Flows, [],[New_Flow], Flow_Aux),
    once(remover_id_duplicados(Flow_Aux,Flow_salida)),
    chatbot(ID, Nombre, Mensaje, StartFlowId, Flow_salida, ChatBot_Salida).
    
