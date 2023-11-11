:- module(ChatBot_21091719_VarasVargas, [chatbot/6, chatbotAddFlow/3]).
:- use_module('Extras_21091719_VarasVargas.pl').
:- use_module('Option_21091719_VarasVargas.pl').
:- use_module('Flow_21091719_VarasVargas.pl').



constructor_chatbot(ID, Nombre, Mensaje, StartFlowId, Flows,[ID, Nombre, Mensaje, StartFlowId, Flows]).

chatbot(ID, Nombre, Mensaje, StartFlowId, Flows, ChatBot):-

    once(remove(Flows,Flow_salida)),
    constructor_chatbot(ID, Nombre, Mensaje, StartFlowId, Flow_salida, ChatBot).

chatbotAddFlow([ID, Nombre, Mensaje, StartFlowId, Flows], New_Flow, ChatBot_Salida):-

    append(Flows, [New_Flow], Flow_Aux),
    once(remove(Flow_Aux,Flow_salida)),
    constructor_chatbot(ID, Nombre, Mensaje, StartFlowId, Flow_salida, ChatBot_Salida).
    
