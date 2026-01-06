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

	print('\n\n==============================\nTRY - CATCH\n==============================\n\n');

	try { 
		int resultado = 10 ~/ 0; // ERRO: Divisão por zero 
		print('O resultado é $resultado'); 
	} catch (e) { 
		print('Erro capturado: $e'); 
	}

	/* 
		Explicação 
		O código dentro do try tenta dividir 10 por 0 (erro). 
		O catch captura a exceção e exibe a mensagem "Erro capturado: 
		IntegerDivisionByZeroException". 
		O programa não trava e continua executando.
	*/

	print('\n\n==============================\nTRY - ON [Error] - CATCH\n==============================\n\n');

	try { 
		List<int> numeros = [1, 2, 3]; 
		print(numeros[5]); // ERRO: Índice fora do intervalo 
	} on RangeError { 
		print('Erro: Tentou acessar um índice inválido.'); 
	} catch (e) { 
		print('Erro genérico capturado: $e'); 
	}

	/* 
		Explicação 
		on RangeError captura exclusivamente erros de índice inválido em listas. 
		O catch genérico pega outros erros, caso ocorram. 
	*/

	print('\n\n==============================\nTRY - CATCH - FINALLY\n==============================\n\n');

	try { 
		int resultado = 10 ~/ 0; 
		print('Resultado: $resultado'); 
	} catch (e) { 
		print('Erro capturado: $e'); 
	} finally { 
		print('Execução finalizada.'); 
	}

	/* 
		Explicação 
		O catch captura o erro de divisão por zero. 
		O finally executa "Execução finalizada.", independente do erro. 
	*/

	print('\n\n==============================\nPERSONALIZAÇÃO DE EXCEPTION\n==============================\n\n');

	ContaBancaria conta = ContaBancaria('Keila', 500.0); 

	try { 
		conta.sacar(600.0); // Vai gerar erro pois saldo é insuficiente 
	} catch (e) { 
		print(e is SaldoInsuficienteException ? e.errorMessage() : 'Erro desconhecido.'); 
	}
	/*
		Explicação 
		Criamos a exceção personalizada SaldoInsuficienteException. 
		No método sacar(), se o valor for maior que o saldo, lançamos a exceção 
		(throw). 
		No catch, verificamos se o erro é do tipo correto. 
	*/ 
}