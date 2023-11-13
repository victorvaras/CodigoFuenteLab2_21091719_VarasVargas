:- module(User_21091719_VarasVargas, [systemAddUser/3, systemLogin/3, systemLogout/2]).
:- use_module('Extras_21091719_VarasVargas.pl').
:- use_module('Option_21091719_VarasVargas.pl').
:- use_module('Flow_21091719_VarasVargas.pl').
:- use_module('ChatBot_21091719_VarasVargas.pl').
:- use_module('System_21091719_VarasVargas.pl').



/*
Estructura user
          [User]    List user                    
flow( [ [ user1] , [user1, user2]]
*/


%Descripcion: Funcion que valida si un usuario esta en lista de usuario
%tipo de algoritmo: Recursion
%Dom:User X List_User
%Rec: Bool

esta_usuario(X, [X|_]):-!.
esta_usuario(X, [_|T]) :- esta_usuario(X, T).


%Descripcion: Funcion que crea un usuario nuevo
%tipo de algoritmo: cracion de lista
%Dom: user X nombre_user X user
%Rec: user
crear_usuario([],New_User, [ [] , [New_User]]).

crear_usuario([User_Login, List_User], New_User, [User_Login, Users]):-
    \+ (esta_usuario(New_User,List_User)),
    append(List_User, [New_User],Users).


%Descripcion: Funcion que registra a un usuario validando si este no existe anteriormente
%tipo de algoritmo: Unificacion
%Dom: System X User X system
%Rec: System
systemAddUser([Nombre, InicialChatbot, ChatBots, TDA_User, TDA_Talk], New_User, System):-

    crear_usuario(TDA_User, New_User, User_Salida),
    constructor_system(Nombre, InicialChatbot, ChatBots, User_Salida,TDA_Talk,System).


%Descripcion: Funcion que loguea a un usuario anteriormente registrado
%tipo de algoritmo: Unificacion
%Dom: System X User X system
%Rec: System
systemLogin([Nombre, InicialChatbot, ChatBots, [[], List_User],TDA_Talk], User, System):-

    esta_usuario(User,List_User),
    constructor_system(Nombre, InicialChatbot, ChatBots,[[User], List_User] ,TDA_Talk,System).   


%Descripcion: Funcion que desloguea a un usuario 
%tipo de algoritmo: validacion de user
%Dom: System X system
%Rec: System
systemLogout([Nombre, InicialChatbot, ChatBots, [[_], List_User],TDA_Talk], System):-
    constructor_system(Nombre, InicialChatbot, ChatBots,[[], List_User] ,TDA_Talk,System).


