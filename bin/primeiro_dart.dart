/* 
*	Da mesma maneira que o Java, em Dart é necessária a chamada do método`void main() {}`
*	para indicar o código a ser executado para o compilador.

* Também é necessário colocar ';' após as intruções
*/

void main() {

	//? ==================== LISTAS ====================

	// Criando uma lista de números inteiros 
	List<int> numeros = [10, 20, 30, 40]; 

	// Acessando elementos pelo índice (começa do 0) 
	print(numeros[0]); // 10 

	// Adicionando um novo elemento à lista 
	numeros.add(50); 
	print(numeros); // [10, 20, 30, 40, 50] 

	// Removendo um elemento 
	numeros.remove(20); 
	print(numeros); // [10, 30, 40, 50] 

	// Iterando sobre a lista 
	for (int numero in numeros) { 
		print(numero); 
	}


	//? ==================== MAPAS ====================

	// Criando um mapa associando países às suas capitais 
	Map<String, String> capitais = { 
		'Brasil': 'Brasília', 
		'França': 'Paris', 
		'Japão': 'Tóquio' 
	}; 
 
	// Acessando um valor pela chave 
	print(capitais['Brasil']); // Brasília 

	// Adicionando um novo par chave-valor 
	capitais['EUA'] = 'Washington, D.C.'; 
	print(capitais); 

	// Removendo um elemento 
	capitais.remove('França'); 
	print(capitais); 

	// Iterando sobre um mapa 
	capitais.forEach((pais, capital) { 
		print('$pais: $capital'); 
	});


	//? ==================== CoONJUNTOS (Set's) ====================

	// Criando um conjunto de números 
	Set<int> numerosUnicos = {1, 2, 3, 4, 5, 5, 5}; 

	// Exibindo o conjunto (valores duplicados são ignorados) 
	print(numerosUnicos); // {1, 2, 3, 4, 5} 

	// Adicionando um novo número 
	numerosUnicos.add(6); 
	print(numerosUnicos); // {1, 2, 3, 4, 5, 6} 

	// Removendo um número 
	numerosUnicos.remove(2); 
	print(numerosUnicos); // {1, 3, 4, 5, 6} 

	// Verificando se um número está no conjunto 
	print(numerosUnicos.contains(3)); // true 

	// Iterando sobre um conjunto 
	for (int num in numerosUnicos) { 
		print(num); 
	}
}