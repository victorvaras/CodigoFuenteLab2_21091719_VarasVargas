:- use_module('Extras_21091719_VarasVargas.pl').
:- use_module('Option_21091719_VarasVargas.pl').
:- use_module('Flow_21091719_VarasVargas.pl').
:- use_module('ChatBot_21091719_VarasVargas.pl').
:- use_module('System_21091719_VarasVargas.pl').
:- use_module('User_21091719_VarasVargas.pl').
:- use_module('talk_21091719_VarasVargas.pl').


/*
    Script de prueba entregado
*/

option(1, "1) Viajar", 1, 1, ["viajar", "turistear", "conocer"], OP1),
option(2, "2) Estudiar", 2, 1, ["estudiar", "aprender", "perfeccionarme"], OP2),
flow(1, "flujo1", [OP1], F10),
flowAddOption(F10, OP2, F11),
% flowAddOption(F10, OP1, F12), %si esto se descomenta, debe dar false, porque es opción con id duplicada.
chatbot(0, "Inicial", "Bienvenido\n¿Qué te gustaría hacer?", 1, [F11], CB0), %solo añade una ocurrencia de F11
%Chatbot1
option(1, "1) New York, USA", 1, 2, ["USA", "Estados Unidos", "New York"], OP3),
option(2, "2) París, Francia", 1, 1, ["Paris", "Eiffel"], OP4),
option(3, "3) Torres del Paine, Chile", 1, 1, ["Chile", "Torres", "Paine", "Torres Paine", "Torres del Paine"], OP5),
option(4, "4) Volver", 0, 1, ["Regresar", "Salir", "Volver"], OP6),
%Opciones segundo flujo Chatbot1
option(1, "1) Central Park", 1, 2, ["Central", "Park", "Central Park"], OP7),
option(2, "2) Museos", 1, 2, ["Museo"], OP8),
option(3, "3) Ningún otro atractivo", 1, 3, ["Museo"], OP9),
option(4, "4) Cambiar destino", 1, 1, ["Cambiar", "Volver", "Salir"], OP10),
option(1, "1) Solo", 1, 3, ["Solo"], OP11),
option(2, "2) En pareja", 1, 3, ["Pareja"], OP12),
option(3, "3) En familia", 1, 3, ["Familia"], OP13),
option(4, "4) Agregar más atractivos", 1, 2, ["Volver", "Atractivos"], OP14),
option(5, "5) En realidad quiero otro destino", 1, 1, ["Cambiar destino"], OP15),
flow(1, "Flujo 1 Chatbot1\n¿Dónde te Gustaría ir?", [OP3, OP4, OP5, OP6], F20),
flow(2, "Flujo 2 Chatbot1\n¿Qué atractivos te gustaría visitar?", [OP7, OP8, OP9, OP10], F21),
flow(3, "Flujo 3 Chatbot1\n¿Vas solo o acompañado?", [OP11, OP12, OP13, OP14, OP15], F22),
chatbot(1, "Agencia Viajes",  "Bienvenido\n¿Dónde quieres viajar?", 1, [F20, F21, F22], CB1),
%Chatbot2
option(1, "1) Carrera Técnica", 2, 1, ["Técnica"], OP16),
option(2, "2) Postgrado", 2, 1, ["Doctorado", "Magister", "Postgrado"], OP17),
option(3, "3) Volver", 0, 1, ["Volver", "Salir", "Regresar"], OP18),
flow(1, "Flujo 1 Chatbot2\n¿Qué te gustaría estudiar?", [OP16, OP17, OP18], F30),
chatbot(2, "Orientador Académico",  "Bienvenido\n¿Qué te gustaría estudiar?", 1, [F30], CB2),
system("Chatbots Paradigmas", 0, [CB0], S0),
% systemAddChatbot(S0, CB0, S1), %si esto se descomenta, debe dar false, porque es chatbot id duplicado.
systemAddChatbot(S0, CB1, S01),
systemAddChatbot(S01, CB2, S02),
systemAddUser(S02, "user1", S2),
systemAddUser(S2, "user2", S3),
% systemAddUser(S3, "user2", S4), %si esto se descomenta, debe dar false, porque es username duplicado
systemAddUser(S3, "user3", S5),
% systemLogin(S5, "user8", S6), %si esto se descomenta, debe dar false ;user8 no existe.
systemLogin(S5, "user1", S7),
% systemLogin(S7, "user2", S8), %si esto se descomenta, debe dar false, ya hay usuario con login
systemLogout(S7, S9),
systemLogin(S9, "user2", S10),
systemTalkRec(S10, "hola", S11), % si se descomenta, daría false por que “hola” no es un option o keyword
systemTalkRec(S11, "1", S12),
systemTalkRec(S12, "1", S13),
systemTalkRec(S13, "Museo", S14),
systemTalkRec(S14, "1", S15),
systemTalkRec(S15, "3", S16),
systemTalkRec(S16, "5", S17),
systemSynthesis(S17, "user2", Str1).
%systemSimulate(S3, 5, 32131, S99). %Falla esta funcion debido a que la seed da valores numericos que no es posible interactuar correctamente

%systemSimulate(S3, 3, 212312, Simulate). %Con esa semilla si corre.



/*
    Simulacion propia
*/

%Bot 0

option(1, "1) Comprar", 1, 1, ["comprar", "adquirir"], OP01),
option(2, "2) Arrendar", 2, 1, ["arrendar", "rentar", "alquilar"], OP02),
flow(1, "Flujo Principal Chatbot 0\nBienvenido\n¿Qué te gustaría hacer?", [OP01], F01),
flowAddOption(F01, OP02, F02),
%flowAddOption(F02, OP02, F022), %Daria falso por duplicidad
chatbot(0, "Automotora", "Bienvenido\n¿Qué te gustaría hacer?", 1, [F02], CB0),
%chatbotAddFlow(CB0, F02, CB01), %Daria falso por duplicidad

%Bot 1

option(1, "1) Contado", 2, 1, ["contado", "efectivo", "cheque"],OP11),
option(2, "2) Credito", 1, 2, ["credito", "financiamiento", "cuotas"],OP12),
flow(1, "flujo 1 chatbot 1\n ¿Que modo de pago desea?", [OP11], F11),
flowAddOption(F11, OP12, F12),
%flowAddOption(F12, OP11, F122), %Daria falso por duplicidad

option(1, "1) 24 cuotas", 2, 1, ["24", "2 años"], OP13),
option(2, "2) 36 cuotas", 2, 1, ["36", "3 años"], OP14),
option(3, "3) 48 cuotas", 2, 1, ["48", "4 años"], OP15),
flow(2, "flujo 2 chatbot 1\n ¿Cantidad de cuotas a pagar?", [OP13,OP14], F13),
flowAddOption(F13,OP15,F14),

chatbot(1, "Comprar de automovil", "Bienvenido\n ¿Qué te gustaría hacer?", 1, [F12,F14], CB10),
%chatbotAddFlow(CB10, F14, CB11),

%Bot 2
option(1, "1) 2 plazas", 2, 1, ["dos", "2 acientos"], OP21),
option(2, "2) 4 plazas", 2, 1, ["cuatro", "4 acientos"], OP22),
option(3, "3) 5 plazas", 2, 1, ["cinco", "5 acientos"], OP23),
option(4, "4) Volver inicio", 0, 1, ["volver", "inicio"], OP24),
flow(1, "flujo 1 chatbot 2\n ¿Que modo de pago desea?", [OP21, OP22, OP23],F21),
flowAddOption(F21,OP24,F22),
chatbot(2, "Cantidad plazas", "Bienvenido\n ¿Qué te gustaría hacer?", 1, [F22],CB21),
%chatbotAddFlow(CB21, F22, CB211), %Daria falso por duplicidad

%system
system("Chatbots Paradigmas venta de automovil", 0, [CB0], S0),
%system("Chatbots Paradigmas venta de automovil", 0, [], S00), %Forma valida de crear un system
%system("Chatbots Paradigmas venta de automovil", 0, [CB0, CB0], S000), %Daria falso por duplicidad
systemAddChatbot(S0, CB10, S1),
systemAddChatbot(S1, CB21, S2),
%systemAddChatbot(S2, CB21, S22),   %Daria falso por duplicidad
%systemLogout(S2,S22), %Falso por falta de usuarios
systemAddUser(S2, "usuario_1", S3),
systemAddUser(S3, "usuario_2", S4),
systemAddUser(S4, "usuario_3", S5),
systemLogin(S5, "usuario_2",S6),
%systemLogin(S5, "usuario_2",S66), %Falso por usuario ya logueado
systemLogout(S6,S7),
%systemLogout(S7,S8), %Falso por ningun usuario logueado
systemLogin(S7, "usuario_1",S8),


%ChatHistory
systemTalkRec(S8, "hola", S9),
systemTalkRec(S9, "1", S10),
systemTalkRec(S10, "2", S11),
systemTalkRec(S11, "1", S12),
systemTalkRec(S12, "4", S13), %vuelve chatbot 0
systemTalkRec(S13, "2", S14),
systemTalkRec(S14, "dos", S15),
systemSynthesis(S15, "usuario_1", Str1),
%systemSynthesis(S15, "usuario_3", Str2),  %Falso por usuario incorrecto
%systemSynthesis(S15, "usuario_1", Str3),  %Variantes de resultado

%Simulate
systemSimulate(S8, 4, 123123, S17), 
systemSimulate(S8, 3, 212312, S18).
%systemSimulate(S7, 3, 212312, S19). %Falso por usuario no encontrase logueado un usuario