:- module(ChatBot_21091719_VarasVargas, [chatbot/6, chatbotAddFlow/3]).
:- use_module('Extras_21091719_VarasVargas.pl').
:- use_module('Option_21091719_VarasVargas.pl').
:- use_module('Flow_21091719_VarasVargas.pl').



constructor_chatbot(ID, Nombre, Mensaje, StartFlowId, Flows,[ID, Nombre, Mensaje, StartFlowId, Flows]).

chatbot(ID, Nombre, Mensaje, StartFlowId, Flows, ChatBot):-

    once(remove(Flows,Flow_salida)),
    constructor_chatbot(ID, Nombre, Mensaje, StartFlowId, Flow_salida, ChatBot).

%chatbot(0, "Asistente  " , "Bienvenido ¿Qué te gustaría hacer? ", 1, [], CB10).

%option(1,"1 - viajar  ",2,4,["viajar","turistear"],O1), option(2,"2 - Estudiar",4,3,["aprender", "perfecionarme"], O2),flow(1,"flujo",[O1,O2,O1,O2,O2],F2),  chatbot(0, "Asistente  " , "Bienvenido ¿Qué te gustaría hacer? ", 1,[F2,F2], CB10).



chatbotAddFlow([ID, Nombre, Mensaje, StartFlowId, Flows], New_Flow, ChatBot_Salida):-

    append(Flows, [New_Flow], Flow_Aux),
    once(remove(Flow_Aux,Flow_salida)),
    constructor_chatbot(ID, Nombre, Mensaje, StartFlowId, Flow_salida, ChatBot_Salida).
    

%option(1,"1 - viajar  ",2,4,["viajar","turistear"],O1), option(2,"2 - Estudiar",4,3,["aprender", "perfecionarme"], O2),flow(1,"flujo",[O1,O2,O1,O2,O2],F2),  chatbot(0, "Asistente  " , "Bienvenido ¿Qué te gustaría hacer? ", 1, [], CB10),  chatbotAddFlow(CB10, F2, CB11),  chatbotAddFlow(CB11, F2, CB12).
