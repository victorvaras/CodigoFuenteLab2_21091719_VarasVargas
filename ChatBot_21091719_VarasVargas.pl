:- module(ChatBot_21091719_VarasVargas, [chatbot/6, chatbotAddFlow/3]).
:- use_module('Extras_21091719_VarasVargas.pl').
:- use_module('Option_21091719_VarasVargas.pl').
:- use_module('Flow_21091719_VarasVargas.pl').



constructor_chatbot(ID, Nombre, Mensaje, StartFlowId, Flows,[ID, Nombre, Mensaje, StartFlowId, Flows]).

chatbot(ID, Nombre, Mensaje, StartFlowId, Flows, ChatBot):-

    once(remover_id_duplicados(Flows,Flow_salida)),
    constructor_chatbot(ID, Nombre, Mensaje, StartFlowId, Flow_salida, ChatBot).


append_flow([],List_flow_aux,New_Flow,List_Flow):-
    append(List_flow_aux, New_Flow, List_Flow).

append_flow([Flow | Resto], List_flow_aux, New_Flow, List_Flow):-
    append(List_flow_aux, Flow, Aux),
    append_flow(Resto, Aux, New_Flow, List_Flow).


chatbotAddFlow([ID, Nombre, Mensaje, StartFlowId, Flows], New_Flow, ChatBot_Salida):-

    %append(Flows, [New_Flow], Flow_Aux), Caso normal y funciona 
    
    append_flow(Flows, [],[New_Flow], Flow_Aux),
    once(remover_id_duplicados(Flow_Aux,Flow_salida)),
    constructor_chatbot(ID, Nombre, Mensaje, StartFlowId, Flow_salida, ChatBot_Salida).
    
