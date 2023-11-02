:- module(User_21091719_VarasVargas, [systemAddUser/3, systemLogin/3, systemLogout/2]).
:- use_module('Extras_21091719_VarasVargas.pl').
:- use_module('Option_21091719_VarasVargas.pl').
:- use_module('Flow_21091719_VarasVargas.pl').
:- use_module('ChatBot_21091719_VarasVargas.pl').
:- use_module('System_21091719_VarasVargas.pl').


esta_usuario(X, [X|_]):-!.
esta_usuario(X, [_|T]) :- esta_usuario(X, T).

crear_usuario([],New_User, [ [] , [New_User]]).

crear_usuario([User_Login, List_User], New_User, [User_Login, Users]):-
    \+ (esta_usuario(New_User,List_User)),
    append(List_User, [New_User],Users).


systemAddUser([Nombre, InicialChatbot, ChatBots, TDA_User, TDA_Talk], New_User, System):-

    crear_usuario(TDA_User, New_User, User_Salida),
    constructor_system(Nombre, InicialChatbot, ChatBots, User_Salida,TDA_Talk,System).


%system("NewSystem", 0, [], S0), systemAddUser(S0, "usuario",S1),systemAddUser(S1, "usuari",S2),systemAddUser(S2, "usu2",S3).


systemLogin([Nombre, InicialChatbot, ChatBots, [[], List_User],TDA_Talk], User, System):-

    esta_usuario(User,List_User),
    constructor_system(Nombre, InicialChatbot, ChatBots,[[User], List_User] ,TDA_Talk,System).   


%system("NewSystem", 0, [], S0), systemAddUser(S0, "usuario",S1),systemAddUser(S1, "usu",S2),systemLogin(S2, "usu",S3).
 
%system("NewSystem", 0, [], S0), systemAddUser(S0, "usuario",S1),systemAddUser(S1, "usu",S2),systemLogin(S2, "usu",S3), systemLogin(S3, "usuario",S4).


systemLogout([Nombre, InicialChatbot, ChatBots, [[_], List_User],TDA_Talk], System):-
    constructor_system(Nombre, InicialChatbot, ChatBots,[[], List_User] ,TDA_Talk,System).

%system("NewSystem", 0, [], S0), systemAddUser(S0, "usuario",S1),systemAddUser(S1, "usu",S2),systemLogin(S2, "usu",S3),systemLogout(S3,S4).


%option(1,"1 - viajar  ",2,4,["viajar","turistear"],O1), option(2,"2 - Estudiar",4,3,["aprender", "perfecionarme"], O2),flow(1,"flujo",[O1,O2,O1,O2,O2],F2),  chatbot(0, "Asistente  " , "Bienvenido ¿Qué te gustaría hacer? ", 1,[F2], CB10), system( "NewSystem", 1, [], S1), systemAddChatbot(S1, CB10, S2), systemAddUser(S2, "usuario",S3),systemAddUser(S3, "usu",S4),systemLogin(S4, "usu",S5),systemLogout(S5,S6),nl,display(S6),nl.

