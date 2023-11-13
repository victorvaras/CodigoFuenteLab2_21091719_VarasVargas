:- module(Talk__21091719_VarasVargas, [systemTalkRec/3, systemSynthesis/3, systemSimulate/4]).
:- use_module('Extras_21091719_VarasVargas.pl').
:- use_module('Option_21091719_VarasVargas.pl').
:- use_module('Flow_21091719_VarasVargas.pl').
:- use_module('ChatBot_21091719_VarasVargas.pl').
:- use_module('System_21091719_VarasVargas.pl').
:- use_module('User_21091719_VarasVargas.pl').

/*
Estructura chathistory
                    
chathistory( [ ID_chatbot_actual , ID_Flow_actual, Synthesis] )
*/



%Descripcion: Funcion que valida que se encuentre registrado un usuario en el system
%tipo de algoritmo: Validacion de sentencia
%Dom: user
%Rec: Bool
estado_Usuario([]):-false.
estado_Usuario([[_]|_]).


%Descripcion: Se busca un chatbot por su ID, en la lista de chatbot entrante.
%tipo de algoritmo: Recursion por validacion
%Dom: List_Chatbot X ID X chatbot
%Rec: chatbot
buscar_ChatBot([ [ID | Resto] | _], ID , [ID | Resto]).
buscar_ChatBot([ _ | Resto] , ID , Lista ):-
    once(buscar_ChatBot(Resto, ID , Lista)). 


%Descripcion: Se busca un flow por su ID, en la lista de flows entrante.
%tipo de algoritmo: Recursion por validacion
%Dom: List_flow X ID X flow
%Rec: flow
buscar_Flujo([ [ID | Resto] | _], ID , [ID | Resto]).
buscar_Flujo([ _ | Resto] , ID , Lista ):-
    once(buscar_Flujo(Resto, ID , Lista)).


%Descripcion: Se busca un option por su ID, en la lista de options entrante.
%tipo de algoritmo: Recursion por validacion
%Dom: List_options X ID X option
%Rec: chatbot
buscar_Option_Por_ID([ [ID | Resto] | _], ID , [ID | Resto]).
buscar_Option_Por_ID([ _ | Resto] , ID , Lista ):-
    once(buscar_Option_Por_ID(Resto, ID , Lista)).   


%Descripcion: Se valida si una palabra se encuentra dentro de las palabras claves (de un option)
%tipo de algoritmo: Recursion por validacion
%Dom: palabra_clave X List_Palabras_claves
%Rec: bool
esta_palabra(X, [X|_]):-!.
esta_palabra(X, [_|T]) :- 
    esta_palabra(X, T).


%Descripcion: Se realiza el llamado dado el system de entrada para validar si existe la eleccion entregada
%             dentro de palabras claves
%tipo de algoritmo: N/A
%Dom: system X eleccion X system
%Rec: system
buscar_Option_Por_Palabra([ [Code, Mensaje, Chatbot, Flujo, Palabras_claves] | _], Eleccion,[Code, Mensaje, Chatbot, Flujo, Palabras_claves] ):-
    esta_palabra(Eleccion, Palabras_claves).

buscar_Option_Por_Palabra( [_ | Resto], Eleccion, Lista):-
    once(buscar_Option_Por_Palabra(Resto,Eleccion,Lista)).


%Descripcion: Se realiza la valdiacion si una eleccion es valida para un id del option o una palabra clave
%             retornando el option correspondiente
%tipo de algoritmo: validacion con operador or(;)
%Dom: List_options X eleccion X option
%Rec: option
buscar_Option(List_Options, Eleccion, Option_Elegido):-
    atom_number(Eleccion, Eleccion_ID), 
    buscar_Option_Por_ID(List_Options, Eleccion_ID, Option_Elegido).
    

buscar_Option(List_Options, Eleccion, Option_Elegido):-
    buscar_Option_Por_Palabra(List_Options, Eleccion, Option_Elegido).

%Descripcion: Selectores de elementos 
%tipo de algoritmo: validacion
%Dom: -
%Rec: -
obtener_DatosOptions([_, _, Chatbot, Flujo, _], Chatbot, Flujo).
obtener_StartFlowId([_, _, _, StartFlowId, _],StartFlowId).
obtener_ListFlows([_, _, _, _, List_Flows], List_Flows).
obtener_ListOptions([_, _, List_Options], List_Options).
obtener_Nombre_ChatBot( [_, Nombre_ChatBot, _, _, _] , Nombre_ChatBot).
obtener_Mensaje_flujo([_, Mensaje, _], Mensaje).


%Descripcion: Se crea un string con los mensajes de los options de un flow
%tipo de algoritmo: Recursion natural
%Dom: List_options X string
%Rec: string
buscar_Mensajes([],"").

buscar_Mensajes([ [_, Mensaje |_] | Resto], Str_Salida):-
    
    buscar_Mensajes(Resto, Mas_Mensajes),
    atomic_list_concat([Mensaje, "\n", Mas_Mensajes], Str_Salida).


%Descripcion: Funcion la realiza la interacion del chatbot, creacion de synthesis y creacion de chathistory 
%             actualizado. Primer llamado realiza la iniciacion de system
%tipo de algoritmo: Unificacion
%Dom: chathistory X eleccion X chatbot X InicialChatbot X user X chathistory
%Rec: chathistory
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
                         Fecha_Hora, " - ", Nombre_ChatBot, ":  ", Mensaje_flujo, "\n",
                         Mensajes] , Synthesis).

    

%Descripcion: Funcion la cual valida que exista un usuario logueado, se obtenga un chathistory luego de la 
%             interaccion y creacion de system actualizado
%tipo de algoritmo: Unificacion
%Dom: System X eleccion X system
%Rec: system
systemTalkRec([Nombre, InicialChatbot, ChatBots, [Usuario | Lista_Usuarios], TDA_Talk], Eleccion, System):-

    estado_Usuario([Usuario | Lista_Usuarios]),
    talk(TDA_Talk, Eleccion, ChatBots, InicialChatbot,Usuario ,New_Talk),
    constructor_system(Nombre, InicialChatbot, ChatBots, [Usuario | Lista_Usuarios], New_Talk ,System).

%Descripcion: Funcion que valida que un usuario es igual a otro
%tipo de algoritmo: Comparacion
%Dom: user X user
%Rec: bool
validar_Usuario( Usuario , Usuario).


%Descripcion: Funcion que retorna desde system a synthesis
%tipo de algoritmo: validacion
%Dom: system X user X system
%Rec: system
systemSynthesis([_, _, _, [ [User_Login] | _], [_,_,Synthesis]], Usuario, Synthesis):-

    validar_Usuario( User_Login , Usuario).


%Descripcion: funcion que realiza la resta de 1
%tipo de algoritmo: resta
%Dom: number X number
%Rec: number
restar_uno(Numero, Resultado) :-
    Resultado is Numero - 1.




%Descripcion: Funcion la cual de manera recursiva realiza iteraciones condicionadas por un maximo
%             y realiza interacciones segun un numero de entrada
%tipo de algoritmo: Recursion de cola
%Dom: system X Seed X Max_Iteracion X system
%Rec: system
simulate(System, _ , 0, System).

simulate(System, [Eleccion | Seed], Max_Iteracion,New_System):-
   
    systemTalkRec( System, Eleccion, System_tem),
    restar_uno(Max_Iteracion, Resultado),
    simulate(System_tem, Seed, Resultado, New_System).



%Descripcion: funcion que realiza una simulacion aleatoria con un maximo de iteraciones con una semilla
%tipo de algoritmo: unificacion
%Dom: system X Max_Iteracion X seed X system 
%Rec: system
systemSimulate(System , Max_Iteracion, Seed, New_System):-

    myRandom(Seed, Seed_Aux),
    number_chars(Seed_Aux,New_Seed),
    simulate(System, New_Seed, Max_Iteracion, New_System). 