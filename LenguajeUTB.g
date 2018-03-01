grammar LenguajeUTB;


principal
	:	NOMBRE_EJERCICIO IDENTIFICADORES codigo FIN;
	
codigo	:	entrada | salida | condicion | igualacion | ciclo_mientras | ciclo_para;
entrada	:	LEER IDENTIFICADORES;
salida	:	ESCRIBIR (IDENTIFICADORES | C_TEXTO) ;
igualacion
	:	IDENTIFICADORES IGUAL validacion ;
condicion
	:	SI validacion ENTONCES codigo+ (SINO ENTONCES codigo+)?;

validacion
	:	NO? exp_booleana;
exp_booleana
	:	comparacion (C_BOOLEAN comparacion)*;
comparacion
	:	suma (((MAYOR QUE) | (MENOR QUE) | (MENOR_I QUE) | (MAYOR_I QUE) | DESIGUALDAD | IGUAL_QUE ) suma)*;
suma	:	mdm ((MAS | MENOS) mdm)*;
mdm	:	min ((POR | ENTRE | MOD) min)*;
min	:	(IDENTIFICADORES | N_ENTEROS | N_REALES | C_CARACTER | C_TEXTO | (PARENTESIS_A codigo PARENTESIS_C));
ciclo_mientras
	:	MIENTRAS validacion ENTONCES codigo+ FIN_MIENTRAS;
ciclo_para
	:	PARA PARENTESIS_A IDENTIFICADORES IGUAL N_ENTEROS PC validacion PC suma PARENTESIS_C;



NOMBRE_EJERCICIO
	:	'Nombre_del_ejercicio';
VARIABLES
	:	'variables';
FIN_VARIABLES
	:	'fin_variables';
FLUJO	:	'Flujo';
NOTA	:	'nota';
FIN_FLUJO
	:	'fin_flujo';
SI	:	'si';
RETURN	:	'retorna';
QUE	:	'que';
TIPO	:	'tipo';
ENTER0	:	'entero';
REAL	:	'real';
BOOL	:	'booleano';
CARACTER:	'caracter';
TEXTO	:	'texto';
NOMBRE 	:	'nombre';
IDENTIFICADORES
	:	'$'('a'..'z'|'_' | '0'..'9' )+;
N_ENTEROS
	:	'-'?('0'..'9')+;
N_REALES:	'-'?('0'..'9')+ '.' ('0'..'9')+;
C_TEXTO	:	'"' ('a'..'z'| 'A'..'Z' | ' ' | '0'..'9' | '-' | '_' | '?' | '.' | ':' | ';' | '!' | '[' | '{' | ']' | '}'| '=' | '+'| '*' | '/' | '%' )+ '"';
C_CARACTER
	:	'"'('a'..'z'| 'A'..'Z' | ' ' | '0'..'9' | '-' | '_' | '?' | '.' | ':' | ';' | '!' | '[' | '{' | ']' | '}'| '=' | '+' | '*' | '/' | '%' )? '`';
C_BOOLEAN	
	:	'y'|'o';
COMO	:	'como';
HASTA	:	'hasta';
FALSO	:	'falso';
IGUAL	:	'igual';
ENTONCES:	'entonces';
MIENTRAS:	'mientras';
FIN_MIENTRAS
	:	'fin_mientras';
CADA	:	'cada';
PARA	:	'para';
FIN_PARA:	'fin_para';
RETONAR	:	'retornar';
FIN	:	'fin';
DIFERENTE
	:	'diferente';
HACER	:	'hacer';
INICIO	:	'inicio';
DE	:	'de';
FUNCION	:	'funcion';
MAYOR	:	'mayor';
SINO	:	'sino';
NO	:	'no';
ES	:	'es';
PARAMETROS
	:	'parametros';
ARREGLO	:	'arreglo';
MATRIZ	:	'matriz';
LLAMAR	:	'llamar';
ESCRIBIR:	'mostrar_en_pantalla';
LEER	:	'leer';
VERDADERO
	:	'verdadero';
MENOR	:	'menor';
MAYOR_I	:	'mayor_o_igual';
MENOR_I	:	'menor_o_igual';
DESIGUALDAD
	:	'no_es_igual_a';
IGUAL_QUE
	:	'igual_que'; 
MAS	: 	'+';
MENOS	:	'-';
ENTRE	:	'/';
POR	:	'*';
MOD	:	'%';
PARENTESIS_A
	:	'(';
PARENTESIS_C
	:	')';
PC	:	';';



WS  :   ( ' '
        | '\t'
        | '\r'
        | '\n'
        ) {$channel=HIDDEN;}
    ;

