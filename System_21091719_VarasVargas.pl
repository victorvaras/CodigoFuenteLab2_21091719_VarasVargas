:- module(System_21091719_VarasVargas, [system/4, systemAddChatbot/3, constructor_system/6]).
:- use_module('Extras_21091719_VarasVargas.pl').
:- use_module('Option_21091719_VarasVargas.pl').
:- use_module('Flow_21091719_VarasVargas.pl').
:- use_module('ChatBot_21091719_VarasVargas.pl').


constructor_system(Nombre, InicialChatbot, ChatBots, TDA_User,TDA_Talk,[Nombre, InicialChatbot, ChatBots, TDA_User,TDA_Talk]).

system(Nombre, InicialChatbot, ChatBots, System):-

    once(remove(ChatBots, ChatBot_Salida)),
    constructor_system(Nombre, InicialChatbot, ChatBot_Salida, [], [],System).


systemAddChatbot([Nombre, InicialChatbot, ChatBots, TDA_User, TDA_Talk], New_Chatbot, System):-

    append(ChatBots, [New_Chatbot], ChatBot_Aux),
    once(remove(ChatBot_Aux, ChatBot_Salida)),
    constructor_system(Nombre, InicialChatbot, ChatBot_Salida, TDA_User,TDA_Talk,System).

