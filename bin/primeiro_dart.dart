/* 
*	Da mesma maneira que o Java, em Dart é necessária a chamada do método`void main() {}`
*	para indicar o código a ser executado para o compilador.

* Também é necessário colocar ';' após as intruções
*/

//?	====================
//? CRIAÇÃO DE CLASSES
//?	====================

// Definição da classe "Carro" 
class Automovel { 
	// Atributos 
	String marca; 
	String modelo; 
	int ano; 

	// Construtor (método especial para criar objetos) 
	Automovel(this.marca, this.modelo, this.ano); 

	// Método (ação) 
	void exibirDetalhes() { 
		print('Carro: $marca $modelo, Ano: $ano'); 
	} 
}


//?	====================
//?	HERANÇA DE CLASSES
//?	====================

// Classe base (superclasse) 
class Animal { 
	String nome; 
	int idade; 

	Animal(this.nome, this.idade); 

	void emitirSom() { 
		print('O animal está fazendo um som.'); 
	} 
} 
 
// Classe derivada (subclasse) 
class Cachorro extends Animal { 
	String raca; 

	// Construtor que chama o da classe base 
	Cachorro(String nome, int idade, this.raca) : super(nome, idade); 

	// Sobrescrevendo um método da classe pai 
	@override 
	void emitirSom() { 
		print('O cachorro late: Au Au!'); 
	} 
}

//?	====================
//?	SUBCLASSES
//?	====================

class Forma { 
	void desenhar() { 
		print('Desenhando uma forma genérica.'); 
	} 
} 
 
// Subclasse 1 
class Circulo extends Forma { 
	@override 
	void desenhar() { 
		print('Desenhando um círculo.'); 
	} 
} 
 
// Subclasse 2 
class Quadrado extends Forma { 
	@override 
	void desenhar() { 
		print('Desenhando um quadrado.'); 
	} 
}


//?	====================
//?	GETTERS E SETTERS
//?	====================

class ContaBancaria { 
	String _titular; // Privado (só pode ser acessado dentro da classe) 
	double _saldo; 

	// Construtor 
	ContaBancaria(this._titular, this._saldo); 


	// Getter (permite acessar o saldo sem modificar diretamente) 
	double get saldo => _saldo; 

	// Setter (permite modificar o saldo de forma controlada) 
	set saldo(double valor) { 
		if (valor >= 0) { 
			_saldo = valor; 
		} else { 
			print('O saldo não pode ser negativo!'); 
		} 
	} 
 
	// Método para depositar dinheiro 
	void depositar(double valor) { 
		_saldo += valor; 
		print('Depósito de R\$ $valor realizado. Saldo atual: R\$ $_saldo'); 
	} 
 
	// Método para sacar dinheiro com verificação 
	void sacar(double valor) { 
		if (valor <= _saldo) { 
			_saldo -= valor; 
			print('Saque de R\$ $valor realizado. Saldo atual: R\$ $_saldo'); 
		} else { 
			print('Saldo insuficiente.'); 
		} 
	} 
}


//? ==========================
//? ABSTRAÇÃO (Classe Genérica) 
//? ========================== 
 
// Criamos uma classe abstrata "Veiculo", pois serve de base para carros, motos e barcos. 


// Classe abstrata (não pode ser instanciada diretamente) 
abstract class Veiculo { 
	String modelo; 
	int ano; 

	Veiculo(this.modelo, this.ano); 

	// Método abstrato (sem implementação, deve ser sobrescrito nas subclasses) 
	void ligar(); 
} 

// Subclasse que implementa a classe abstrata 
class Carro extends Veiculo { 
	Carro(String modelo, int ano) : super(modelo, ano); 

	// Implementando o método abstrato 
	@override 
	void ligar() { 
		print('O carro $modelo está ligado.'); 
	} 
} 

// Outra subclasse que herda de Veiculo 
class Moto extends Veiculo { 
	Moto(String modelo, int ano) : super(modelo, ano); 

	@override 
	void ligar() { 
		print('A moto $modelo está ligada.'); 
	} 
}

// ========================== 
// HERANÇA (Carro Sedan herda de Veículo) 
// ========================== 
class CarroSedan extends Veiculo { 
	String cor; 
	String _estofado; // ENCAPSULAMENTO: atributo privado 

	// Construtor 
	CarroSedan(String modelo, int ano, this.cor, this._estofado) 
	: super(modelo, ano); 

	// Getter e Setter para o estofado (ENCAPSULAMENTO) 
	String get estofado => _estofado; 
	set estofado(String novoEstofado) { 
		_estofado = novoEstofado; 
	} 

	@override 
	void ligar() { 
		print('Ligando o carro sedan modelo $modelo...'); 
	} 
} 

//? ========================== 
//? POLIMORFISMO (Subclasse altera comportamento) 
//? ========================== 
class CarroRet extends CarroSedan { 
	CarroRet(String modelo, int ano, String cor, String estofado) 
	: super(modelo, ano, cor, estofado); 


	@override 
	void ligar() { 
		print('Carro Ret ligado com modo esportivo ativado!'); 
	} 
} 

//? ========================== 
//? ABSTRAÇÃO (Barco herda de Veículo, mas não é um Carro) 
//? ========================== 
class Barco extends Veiculo { 
	String tipo; 

	Barco(String modelo, int ano, this.tipo) : super(modelo, ano); 

	@override 
	void ligar() { 
		print('Ligando o barco $modelo...'); 
	}
}

//? ========================== 
//? FUNÇÕES SEPARADAS PARA CADA CONCEITO DA POO 
//? ========================== 

// Função que demonstra Abstração 
void demonstrarAbstracao() { 
	print('🔹 Demonstração de Abstração:'); 
	Barco meuBarco = Barco('Lancha 3000', 2025, 'Lancha de Luxo'); 
	meuBarco.ligar(); 
	print(''); 
} 

// Função que demonstra Herança 
void demonstrarHeranca() { 
	print('🔹 Demonstração de Herança:'); 
	CarroSedan meuCarro = CarroSedan('Sedan Lux', 2024, 'Preto', 'Tecido'); 
	meuCarro.ligar(); 
	print(''); 
} 

// Função que demonstra Encapsulamento 
void demonstrarEncapsulamento() { 
	print('🔹 Demonstração de Encapsulamento:'); 
	CarroSedan meuCarro = CarroSedan('Sedan Lux', 2024, 'Preto', 'Tecido'); 

	// Encapsulamento - acessando atributo privado por getter 
	print('Estofado do carro: ${meuCarro.estofado}'); 

	// Encapsulamento - modificando o estofado usando setter 

	meuCarro.estofado = 'Couro'; 
	print('Novo estofado do carro: ${meuCarro.estofado}'); 
	print(''); 
} 

// Função que demonstra Polimorfismo 
void demonstrarPolimorfismo() { 
	print('🔹 Demonstração de Polimorfismo:'); 
	CarroRet meuCarroRet = CarroRet('Ret Turbo', 2024, 'Azul', 'Couro'); 
	meuCarroRet.ligar(); // Executará a versão diferente do método ligar() 
	print(''); 
}

void main() {

	print('\n\n====================\nCLASSES E OBJETOS\n====================\n\n');

	// Criando objetos da classe "Carro" 
	Automovel carro1 = Automovel('Toyota', 'Corolla', 2022); 
	Automovel carro2 = Automovel('Honda', 'Civic', 2023); 

	// Chamando o método 
	carro1.exibirDetalhes(); 
	carro2.exibirDetalhes();

	/* 
		Explicação: 

		Criamos a classe Carro com os atributos marca, modelo e ano. 
		Criamos um construtor (Carro(this.marca, this.modelo, this.ano)) para 
		facilitar a criação de objetos. 
		O método exibirDetalhes() exibe informações do carro. 
		Criamos dois objetos (carro1 e carro2) e chamamos o método para exibir os 
		detalhes. 

	*/

	print('\n\n====================\nHERANÇA DE CLASSES\n====================\n\n');

	// Criando um objeto da classe "Cachorro" 
	Cachorro meuCachorro = Cachorro('Rex', 3, 'Labrador'); 

	// Chamando métodos 
	print('Nome: ${meuCachorro.nome}, Raça: ${meuCachorro.raca}'); 
	meuCachorro.emitirSom(); // Vai chamar a versão sobrescrita do método

	/* 
		Explicação: 

		Criamos a classe Animal com nome, idade e o método emitirSom(). 
		Criamos a classe Cachorro que herda (extends Animal) os atributos e 
		métodos da classe Animal. 
		Sobrescrevemos (@override) o método emitirSom(). 
	*/

	print('\n\n====================\nSUBCLASSES\n====================\n\n');
	
	// Criando lista de formas polimórficas 
	List<Forma> formas = [Circulo(), Quadrado(), Forma()]; 

	// Chamando o método desenhar() para cada forma 
	for (var forma in formas) { 
		forma.desenhar(); 
	}

	 
	/* 
		Explicação: 

		Criamos a classe base Forma, que tem o método desenhar(). 
		Criamos duas subclasses (Circulo e Quadrado), cada uma sobrescreve 
		desenhar(). 
		No main(), armazenamos diferentes objetos na lista formas. 
		O Dart chama automaticamente a versão correta do método desenhar(). 
	*/

	print('\n\n====================\nGETTERS E SETTERS\n====================\n\n');

	ContaBancaria conta = ContaBancaria('Keila', 1000.0); 

	print('Saldo inicial: R\$ ${conta.saldo}'); // Usando o getter 

	conta.depositar(500.0); 
	conta.sacar(300.0); 

	conta.saldo = -100; // Tentativa de saldo negativo (não permitido pelo setter)

	/* 
		Atributos e métodos privados → Começam com _ (underscore) e só podem ser 
		acessados dentro da própria classe. 
		Getters e Setters → Métodos usados para ler (get) e modificar (set) 
		atributos privados.
	*/


	print('\n\n==========================\nABSTRAÇÃO (Classe Genérica)\n==========================\n\n');

	// Criando objetos das subclasses (não podemos instanciar Veiculo diretamente) 
	Carro carro = Carro('Civic', 2023); 
	Moto moto = Moto('Honda CB 500', 2022); 

	// Chamando os métodos implementados 
	carro.ligar(); 
	moto.ligar();

	/* 
		Classes abstratas → Não podem ser instanciadas diretamente. 
		Métodos abstratos → Não têm implementação na classe abstrata, devendo ser 
		implementados pelas subclasses. 

	*/

	print('\n\n==========================\nCONCEITOS DE POO\n==========================\n\n');

	print("ABSTRAÇÃO:");
	demonstrarAbstracao();

	print("\nHERANÇA:");
	demonstrarHeranca();

	print("\nENCAPSULAMENTO:"); 
	demonstrarEncapsulamento();

	print("\nPLIMORFISMO:");
	demonstrarPolimorfismo(); 

}