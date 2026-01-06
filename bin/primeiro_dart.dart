/* 
*	Da mesma maneira que o Java, em Dart é necessária a chamada do método`void main() {}`
*	para indicar o código a ser executado para o compilador.

* Também é necessário colocar ';' após as intruções
*/

void main() {

	//? ==================== 
	//? BREAK 
	//? ====================

	print("====================\nBREAK\n====================\n");

	for (int i = 1; i <= 5; i++) { 
		if (i == 3) { 
			print('Parando no número 3'); 
			break; // Interrompe o loop 
		} 
		print(i); 
	} 

	String cor = "vermelho"; 

	switch (cor) { 

		case "azul": 
			print("A cor escolhida é azul."); 
			break; 
		case "vermelho": 
			print("A cor escolhida é vermelho."); 
			break; 
		default: 
			print("Cor não reconhecida."); 
	}



	//? ==================== 
	//? CONTINUE 
	//? ====================

	print("\n\n====================\nCONTINUE\n====================\n");


	for (int i = 1; i <= 5; i++) { 
		if (i == 3) { 
			print('Pulando o número 3'); 
			continue; // Pula essa iteração e vai para o próximo número 
		} 
		print(i); 
	} 

	int num = 0; 

	while (num < 5) { 
		num++; 
		if (num == 3) { 
			print('Pulando o número 3'); 
			continue; 
		} 
		print(num); 
	}



	//? ==================== 
	//? RETURN 
	//? ====================

	print("\n\n====================\nRETURN\n====================\n");

	int dobrar(int numero) { 
		return numero * 2; // Retorna o resultado 
	} 

	int resultado = dobrar(5); 
	print('O dobro de 5 é $resultado'); 

	void verificarIdade(int idade) { 
		if (idade < 18) { 
			print('Acesso negado.'); 
			return; // Sai da função imediatamente 
		} 
		print('Acesso permitido.'); 
	}

	verificarIdade(16); // Acesso negado. 
  	verificarIdade(20); // Acesso permitido. 
}