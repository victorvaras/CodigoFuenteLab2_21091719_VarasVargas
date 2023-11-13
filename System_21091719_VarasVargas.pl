:- module(System_21091719_VarasVargas, [system/4, systemAddChatbot/3, constructor_system/6 ]).
:- use_module('Extras_21091719_VarasVargas.pl').
:- use_module('Option_21091719_VarasVargas.pl').
:- use_module('Flow_21091719_VarasVargas.pl').
:- use_module('ChatBot_21091719_VarasVargas.pl').

/*
Estructura system

system( [ nombre  , InicialChatbot, list_chatbot, User, chatHistory]
*/

%Descripcion: Funcion que crea un system a partir de todos los parametros
%tipo de algoritmo: unificacion
%Dom: Nombre X InicialChatbot X ChatBot_Salida X TDA_User X TDA_Talk
%Rec: system
constructor_system(Nombre, InicialChatbot, ChatBots, TDA_User,TDA_Talk,[Nombre, InicialChatbot, ChatBots, TDA_User,TDA_Talk]).

%Descripcion: Funcion que realiza la creacion de system
%tipo de algoritmo: Recursion
%Dom: Nombre X InicialChatbot X ChatBots
%Rec: system
system(Nombre, InicialChatbot, ChatBots, [Nombre, InicialChatbot, ChatBot_Salida, [], []]):-

    once(remover_id_duplicados(ChatBots, ChatBot_Salida)).


%Descripcion: Funcion que agrega un chatbot adicional al system, siempre que el id sea unico
%tipo de algoritmo: unificacion
%Dom: system X Ichatbot X system
%Rec: system
systemAddChatbot([Nombre, InicialChatbot, ChatBots, TDA_User, TDA_Talk], New_Chatbot, System):-

    append(ChatBots, [New_Chatbot], ChatBot_Aux),
    once(remover_id_duplicados(ChatBot_Aux, ChatBot_Salida)),
    constructor_system(Nombre, InicialChatbot, ChatBot_Salida, TDA_User,TDA_Talk,System).

