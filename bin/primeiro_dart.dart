
//?	==========================
//?	TIPOS DE DADOS E VARIÁVEIS
//?	==========================

/* 
*	Da mesma maneira que o Java, em Dart é necessária a chamada do método`void main() {}`
*	para indicar o código a ser executado para o compilador.

* Também é necessário colocar ';' após as intruções
*/

void main() {

	print("==========================\nTIPOS DE DADOS E VARIÁVEIS\n==========================\n");
//?	Tipo para números inteiros (int)
	int n = 5;
	print('${n.runtimeType}: $n');


//?	Tipo para números decimais (double)
	double d = 3.14;
	print('${d.runtimeType}: $d');

//?	Tipo booleano (boo)
	bool t = true;
	print('${t.runtimeType}: $t');

//?	Tipo texto (String)
	String text = "Hello World!";
	print('${text.runtimeType}: $text');

//?	Tipo dinâmico (var) - O Dart infere o tipo automáticamente
	var number = 0;
	print('var - ${number.runtimeType}: $number');

	var phrase = "Ao verme que primeiro roeu as frias carnes de meu cadáver dedico como saudosa lembrança estas memórias póstumas";
	print('var - ${phrase.runtimeType}: $phrase');

//? 	Tipo dinâmico (dynamic)
//?	- Permite a mudança de tipo, mas deve ser evitado (afinal, isto não é JavaScript)

	dynamic something = "text";
	print('dynamic/${something.runtimeType}: $something');
	something = 123;
	print('dynamic/${something.runtimeType}: $something');


//? ========================== 
//? 		OPERADORES 
//? ========================== 

print("\n\n==========================\nOPERADORES \n==========================\n");
 
  //? Operadores aritméticos 
  int a = 10, b = 3; 
  print('Soma: ${a + b}');        // Adição 
  print('Subtração: ${a - b}');   // Subtração 
  print('Multiplicação: ${a * b}'); // Multiplicação 
  print('Divisão: ${a / b}');     // Divisão (resultado double) 
  print('Divisão inteira: ${a ~/ b}'); // Divisão inteira 
  print('Resto da divisão: ${a % b}'); // Módulo (resto da divisão) 
 
  //? Operadores de comparação (retornam booleano) 
  print('É maior? ${a > b}');   // true 
  print('É menor? ${a < b}');   // false 
  print('É igual? ${a == b}');  // false 
  print('É diferente? ${a != b}'); // true 
 
  //? Operadores lógicos 
  bool cond1 = true, cond2 = false; 
  print('AND (&&): ${cond1 && cond2}'); // false (ambos precisam ser verdadeiros) 
  print('OR (|): ${cond1 | cond2}');  // true (basta um ser verdadeiro) 
  print('NOT (!): ${!cond1}');          // false (inverte o valor) 
 
  //? Operador de incremento e decremento 
  int contador = 5; 
  print('Antes do incremento: $contador'); 
  contador++; // Equivalente a contador = contador + 1; 
  print('Depois do incremento: $contador'); 
 
  contador--; // Equivalente a contador = contador - 1; 
  print('Depois do decremento: $contador'); 
 
  //? Operador de atribuição composta 
  int numero = 10; 
  numero += 5; // Equivalente a numero = numero + 5; 
  print('Número após += 5: $numero'); 
 
  numero *= 2; // Equivalente a numero = numero * 2; 
 
  print('Número após *= 2: $numero');
}