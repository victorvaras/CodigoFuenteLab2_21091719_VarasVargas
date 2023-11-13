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

buscar_Option_Por_ID([ [ID | Resto] | _], ID , [ID | Resto]).
buscar_Option_Por_ID([ _ | Resto] , ID , Lista ):-
    once(buscar_Option_Por_ID(Resto, ID , Lista)).   


esta_palabra(X, [X|_]):-!.
esta_palabra(X, [_|T]) :- 
    esta_palabra(X, T).

buscar_Option_Por_Palabra([ [Code, Mensaje, Chatbot, Flujo, Palabras_claves] | _], Eleccion,[Code, Mensaje, Chatbot, Flujo, Palabras_claves] ):-
    esta_palabra(Eleccion, Palabras_claves).

buscar_Option_Por_Palabra( [_ | Resto], Eleccion, Lista):-
    once(buscar_Option_Por_Palabra(Resto,Eleccion,Lista)).

buscar_Option(List_Options, Eleccion, Option_Elegido):-
    buscar_Option_Por_ID(List_Options, Eleccion, Option_Elegido);
    buscar_Option_Por_Palabra(List_Options, Eleccion, Option_Elegido).





obtener_DatosOptions([_, _, Chatbot, Flujo, _], Chatbot, Flujo).

obtener_StartFlowId([_, _, _, StartFlowId, _],StartFlowId).

obtener_ListFlows([_, _, _, _, List_Flows], List_Flows).

obtener_ListOptions([_, _, List_Options], List_Options).


buscar_Mensajes([],"").

buscar_Mensajes([ [_, Mensaje |_] | Resto], Str_Salida):-
    
    buscar_Mensajes(Resto, Mas_Mensajes),
    atomic_list_concat([Mensaje, "\n", Mas_Mensajes], Str_Salida).


obtener_Nombre_ChatBot( [_, Nombre_ChatBot, _, _, _] , Nombre_ChatBot).

obtener_Mensaje_flujo([_, Mensaje, _], Mensaje).

%Caso inicial del bot
talk([],Eleccion,ChatBots,InicialChatbot,[Usuario],[InicialChatbot, StartFlowId, Synthesis]):-
    buscar_ChatBot(ChatBots, InicialChatbot, ChatBot_Actual),
    obtener_StartFlowId(ChatBot_Actual,StartFlowId),
    
    obtener_ListFlows(ChatBot_Actual,List_Flows),
    buscar_Flujo(List_Flows, StartFlowId, Flujo_Actual),
    obtener_ListOptions(Flujo_Actual,List_Options),
    get_time(Fecha_Hora),
    obtener_Nombre_ChatBot(ChatBot_Actual, Nombre_ChatBot),
    obtener_Mensaje_flujo( Flujo_Actual, Mensaje_flujo),
    buscar_Mensajes(List_Options, Mensajes),
    atomic_list_concat( ["\n\n", Fecha_Hora," - ",Usuario,": ", Eleccion,"\n", 
                         Fecha_Hora, " - ", Nombre_ChatBot, ":  ", Mensaje_flujo, "\n",
                         Mensajes], Synthesis).


talk([N_Bot, N_flujo, Out], Eleccion, ChatBots, _, [Usuario],[N_Bot_Nuevo, N_Flujo_Nuevo, Synthesis]):-

    buscar_ChatBot(ChatBots, N_Bot, ChatBot_Actual),
    obtener_ListFlows(ChatBot_Actual,List_Flows),
    buscar_Flujo(List_Flows, N_flujo, Flujo_Actual),
    obtener_ListOptions(Flujo_Actual,List_Options),
    buscar_Option(List_Options, Eleccion, Option_Elegido),
    obtener_DatosOptions(Option_Elegido, N_Bot_Nuevo, N_Flujo_Nuevo),
    

    buscar_ChatBot(ChatBots, N_Bot_Nuevo, ChatBot_Nuevo),
    obtener_ListFlows(ChatBot_Nuevo,List_Flows_Nuevo),
    buscar_Flujo(List_Flows_Nuevo, N_Flujo_Nuevo, Flujo_Nuevo),
    obtener_ListOptions(Flujo_Nuevo,List_Options_Nuevo),

    get_time(Fecha_Hora),
    obtener_Nombre_ChatBot(ChatBot_Nuevo, Nombre_ChatBot),
    obtener_Mensaje_flujo( Flujo_Nuevo, Mensaje_flujo),
    buscar_Mensajes(List_Options_Nuevo, Mensajes),

    atomic_list_concat( [Out, "\n\n",Fecha_Hora," - ",Usuario,": ", Eleccion,"\n",
                         Fecha_Hora, " - ", Nombre_ChatBot, ":  ", Mensaje_flujo, "\n", Mensajes] , Synthesis).

    


systemTalkRec([Nombre, InicialChatbot, ChatBots, [Usuario | Lista_Usuarios], TDA_Talk], Eleccion, System):-

    estado_Usuario([Usuario | Lista_Usuarios]),
    talk(TDA_Talk, Eleccion, ChatBots, InicialChatbot,Usuario ,New_Talk),
    constructor_system(Nombre, InicialChatbot, ChatBots, [Usuario | Lista_Usuarios], New_Talk ,System).


validar_Usuario( Usuario , Usuario).

systemSynthesis([_, _, _, [ [User_Login] | _], [_,_,Synthesis]], Usuario, Synthesis):-

    validar_Usuario( User_Login , Usuario).



restar_uno(Numero, Resultado) :-
    Resultado is Numero - 1.

%Numero bueno para aleatorio 3212312
simulate(System, _ , 0, System).

simulate(System, [Eleccion | Seed], Max_Iteracion,New_System):-
   
    systemTalkRec( System, Eleccion, System_tem),
    restar_uno(Max_Iteracion, Resultado),
    simulate(System_tem, Seed, Resultado, New_System).


% 123123 - 4iteraciones max

systemSimulate(System , Max_Iteracion, Seed, New_System):-

    myRandom(Seed, Seed_Aux),
    %Numero = 111111,
    %write(Numero),
    numero_a_lista(Seed_Aux, New_Seed),

    simulate(System, New_Seed, Max_Iteracion, New_System). 