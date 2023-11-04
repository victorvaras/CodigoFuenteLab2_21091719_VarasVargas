:- use_module('Extras_21091719_VarasVargas.pl').
:- use_module('Option_21091719_VarasVargas.pl').
:- use_module('Flow_21091719_VarasVargas.pl').
:- use_module('ChatBot_21091719_VarasVargas.pl').
:- use_module('System_21091719_VarasVargas.pl').
:- use_module('User_21091719_VarasVargas.pl').


estado_Usuario([]):-false.
estado_Usuario([[_]|_]).

%Funcion para buscar chatbot por id especifico
buscar_ChatBot([ [ID | Resto] | _], ID , [ID | Resto]).
buscar_ChatBot([ _ | Resto] , ID , Lista ):-
    once(buscar_ChatBot(Resto, ID , Lista)). 

buscar_Flujo([ [ID | Resto] | _], ID , [ID | Resto]).
buscar_Flujo([ _ | Resto] , ID , Lista ):-
    once(buscar_Flujo(Resto, ID , Lista)).

buscar_Option([ [ID | Resto] | _], ID , [ID | Resto]).
buscar_Option([ _ | Resto] , ID , Lista ):-
    once(buscar_Option(Resto, ID , Lista)).   


obtener_DatosOptions([_, _, Chatbot, Flujo, _], Chatbot, Flujo).

obtener_StartFlowId([_, _, _, StartFlowId, _],StartFlowId).

obtener_ListFlows([_, _, _, _, List_Flows], List_Flows).

obtener_ListOptions([_, _, List_Options], List_Options).



    


systemTalkRec([Nombre, InicialChatbot, ChatBots, TDA_User, TDA_Talk], Eleccion, System):-

    estado_Usuario(TDA_User),
    talk(TDA_Talk, Eleccion, ChatBots, InicialChatbot ,New_Talk),
    constructor_system(Nombre, InicialChatbot, ChatBots, TDA_User, New_Talk ,System).

