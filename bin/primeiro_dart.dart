/* 
*	Da mesma maneira que o Java, em Dart é necessária a chamada do método`void main() {}`
*	para indicar o código a ser executado para o compilador.

* Também é necessário colocar ';' após as intruções
*/

//?	==============================
//? FUNÇÕES ASSÍNCRONAS
//?	==============================

// Função assíncrona simulando uma operação demorada 
Future<String> carregarDados() async { 
  print('Carregando dados...'); 
  await Future.delayed(Duration(seconds: 2)); // Simulando espera 
  return 'Dados carregados!'; 
}

//?	==============================
//? FUNÇÕES ASSÍNCRONAS E ERROS
//?	==============================

// Função que pode gerar erro 
Future<String> buscarUsuario() async { 
	await Future.delayed(Duration(seconds: 2)); 
	throw Exception('Erro ao buscar usuário!'); 
}

//?	==============================
//? SIMULAÇÃO DE CARREGAMENTO
//?	==============================

// Simulando carregamento de dados 
Future<String> carregarPerfil() async { 
	await Future.delayed(Duration(seconds: 2)); 
	return 'Perfil carregado'; 
} 
 
Future<String> carregarMensagens() async { 
	await Future.delayed(Duration(seconds: 3)); 
	return 'Mensagens carregadas'; 
}
 

/*
* Para a chamada de resultados assíncronos com `await` é preciso marcar a função como `async` (isso também vale para o "main")
*/
void main() async {

	print("\n\n==============================\nFUNÇÕES COMUNS\n==============================\n\n");

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

	print("\n\n==============================\nFUNÇÕES ASSÍCRONAS\n==============================\n\n");

	print('Início do programa'); 

	String resultado = await carregarDados(); // Aguarda o Future ser resolvido 
	print(resultado); 

	print('Fim do programa'); 

	/* 
		Explicação 
		async indica que carregarDados() retorna um Future. 
		await pausa a execução até que Future.delayed() termine. 
		Agora o código parece síncrono, mas sem travar o programa. 
	*/

	print("\n\n==============================\nFUNÇÕES ASSÍCRONAS E ERROS\n==============================\n\n");

	print('Buscando usuário...'); 

	try { 
		String usuario = await buscarUsuario(); 
		print('Usuário encontrado: $usuario'); 
	} catch (e) { 
		print('Erro capturado: $e'); 
	} 

	print('Programa finalizado'); 

	/* 
		Explicação 
		try-catch captura exceções em funções assíncronas. 
		Se buscarUsuario() falhar, o erro é tratado sem travar o programa. 
	*/

	print("\n\n==============================\nSIMULAÇÃO DE CARREGAMENTO\n==============================\n\n");

	print('Carregando perfil e mensagens ao mesmo tempo...'); 

	// Executa ambas as funções ao mesmo tempo 
	List<String> resultados = await Future.wait([carregarPerfil(), 
	carregarMensagens()]); 

	print(resultados[0]); // Perfil carregado 
	print(resultados[1]); // Mensagens carregadas 

	print('Tudo carregado!');

	/* 
		Explicação 
		Future.wait([...]) executa várias funções assíncronas ao mesmo tempo. 
		O programa espera todas terminarem antes de continuar. 
	*/

}