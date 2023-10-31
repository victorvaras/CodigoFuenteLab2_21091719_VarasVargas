:- module(System_21091719_VarasVargas, [system/4, systemAddChatbot/3, constructor_system/5]).
:- use_module('Extras_21091719_VarasVargas.pl').
:- use_module('Option_21091719_VarasVargas.pl').
:- use_module('Flow_21091719_VarasVargas.pl').
:- use_module('ChatBot_21091719_VarasVargas.pl').


constructor_system(Nombre, InicialChatbot, ChatBots, TDA_User,[Nombre, InicialChatbot, ChatBots, TDA_User]).

system(Nombre, InicialChatbot, ChatBots, System):-

    once(remove(ChatBots, ChatBot_Salida)),
    constructor_system(Nombre, InicialChatbot, ChatBot_Salida, [],System).

%system("NewSystem", 0, [], S0).
%,systemAddChatbot(S0,[],S1)

systemAddChatbot([Nombre, InicialChatbot, ChatBots, TDA_User], New_Chatbot, System):-

    append(ChatBots, [New_Chatbot], ChatBot_Aux),
    once(remove(ChatBot_Aux, ChatBot_Salida)),
    constructor_system(Nombre, InicialChatbot, ChatBot_Salida, TDA_User,System).

%option(1,"1 - viajar  ",2,4,["viajar","turistear"],O1), option(2,"2 - Estudiar",4,3,["aprender", "perfecionarme"], O2),flow(1,"flujo",[O1,O2,O1,O2,O2],F2),  chatbot(0, "Asistente  " , "Bienvenido ¿Qué te gustaría hacer? ", 1,[F2], CB10), system( "NewSystem", 1, [CB10,CB10], S1).


%option(1,"1 - viajar  ",2,4,["viajar","turistear"],O1), option(2,"2 - Estudiar",4,3,["aprender", "perfecionarme"], O2),flow(1,"flujo",[O1,O2,O1,O2,O2],F2),  chatbot(0, "Asistente  " , "Bienvenido ¿Qué te gustaría hacer? ", 1,[F2], CB10), system( "NewSystem", 1, [], S1), systemAddChatbot(S1, CB10, S2).

