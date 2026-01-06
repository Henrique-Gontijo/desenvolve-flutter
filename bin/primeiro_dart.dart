/* 
*	Da mesma maneira que o Java, em Dart é necessária a chamada do método`void main() {}`
*	para indicar o código a ser executado para o compilador.

* Também é necessário colocar ';' após as intruções
*/

//?	==============================
//? PERSONALIZAÇÃO DE EXCEPTION
//?	==============================

// Criando uma exceção personalizada 
class SaldoInsuficienteException implements Exception { 
  String errorMessage() { 
    return 'Erro: Saldo insuficiente para a operação!'; 
  } 
} 
 
// Classe Conta Bancária 
class ContaBancaria { 
  String titular; 
  double saldo; 
 
  ContaBancaria(this.titular, this.saldo); 
 
  // Método para sacar dinheiro 
 
  void sacar(double valor) { 
    if (valor > saldo) { 
      throw SaldoInsuficienteException(); // Lançando nossa exceção 
    } 
    saldo -= valor; 
    print('Saque de R\$ $valor realizado. Saldo atual: R\$ $saldo'); 
  } 
} 

void main() {

	print('Início do programa'); 

	Future<String> tarefa = Future.delayed(Duration(seconds: 3), () { 
		return 'Tarefa concluída!'; 
	}); 

	tarefa.then((resultado) => print(resultado)); 

	print('Fim do programa (mas a tarefa ainda está rodando)');

	/* 
		Explicação 
		Future.delayed(Duration(seconds: 3), () {...}) simula uma operação 
		demorada (3 segundos). 
		
		O then((resultado) => print(resultado)) aguarda e imprime o resultado 
		quando a tarefa é concluída. 
		O programa continua rodando sem esperar a tarefa terminar. 
	*/

}