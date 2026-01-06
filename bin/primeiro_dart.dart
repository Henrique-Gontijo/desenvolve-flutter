/* 
*	Da mesma maneira que o Java, em Dart é necessária a chamada do método`void main() {}`
*	para indicar o código a ser executado para o compilador.

* Também é necessário colocar ';' após as intruções
*/

void main() {

	print("========================== \nESTRUTURAS CONDICIONAIS\n========================== \n");
	//? ========================== 
	//? ESTRUTURAS CONDICIONAIS 
	//? ========================== 
 
	// IF-ELSE: Usado para tomar decisões com base em condições 
	int idade = 18; 
 
	if (idade >= 18) { 
	print('Você é maior de idade.'); 
	} else { 
	print('Você é menor de idade.'); 
	} 
 
	// IF-ELSE ANINHADO: Quando há múltiplas condições 
	int nota = 75; 
 
	if (nota >= 90) { 
		print('Nota A'); 
	} else if (nota >= 80) { 
		print('Nota B'); 
	} else if (nota >= 70) { 
		print('Nota C'); 
	} else { 
		print('Reprovado'); 
	}

 
	//? ========================== 
	//? ESTRUTURA SWITCH 
	//? ========================== 
 
	print("\n\n==========================\nOPERADORES \n==========================\n");

	// SWITCH-CASE: Alternativa ao if-else quando há muitas comparações de um mesmo valor
	String diaSemana = "segunda"; 
 
 
	switch (diaSemana) { 
		case "segunda": 
			print("Hoje é segunda-feira."); 
			break; 
		case "terça": 
			print("Hoje é terça-feira."); 
		break; 
			case "quarta": 
			print("Hoje é quarta-feira."); 
			break; 
		default: 
			print("Dia inválido ou não especificado.");
	}

	//? ========================== 
	//? LAÇOS DE REPETIÇÃO (LOOPS) 
	//? ========================== 
 
	print("\n\n==========================\nOPERADORES \n==========================\n");

	// FOR: Loop com número fixo de repetições 
	print('Contando de 1 a 5 com for:'); 
	for (int i = 1; i <= 5; i++) { 
		print('Número $i'); 
	} 
 
	// WHILE: Executa enquanto a condição for verdadeira 
	print('Contando de 5 a 1 com while:'); 
	int contador = 5; 
	while (contador >= 1) { 
		print('Número $contador'); 
		contador--; // Decremento para evitar loop infinito 
	} 
 
	// DO-WHILE: Semelhante ao while, mas garante que o bloco será executado pelo menos uma vez 
	print('Exemplo de do-while:'); 
	int num = 0; 
	do { 
		print('Executando do-while, número: $num'); 
		num++; 
	} while (num < 3);
 
  
}