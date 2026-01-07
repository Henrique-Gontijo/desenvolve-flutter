import 'package:flutter/material.dart'; 
 
void main() { 
  runApp(const MyApp()); // Inicia o aplicativo 
} 
 
// Criamos um StatelessWidget que NÃO pode mudar depois de construído 
class TextoFixo extends StatelessWidget { 
  const TextoFixo({super.key}); 
 
  @override 
  Widget build(BuildContext context) { 
    return const Text( 
      'Eu sou um StatelessWidget e nunca mudo!', 
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), 
      textAlign: TextAlign.center, 
    ); 
  } 
} 
 
// Criamos um StatefulWidget que PODE mudar após ser construído 
class Contador extends StatefulWidget { 
  const Contador({super.key}); 
 
  @override 
  State<Contador> createState() => _ContadorState(); 
} 
 
// A classe de estado para o Contador (StatefulWidget) 
class _ContadorState extends State<Contador> { 
  int _contador = 0; // Estado mutável (variável que muda) 
 
  void _incrementar() { 
    setState(() { 
      _contador++; // Altera o estado e reconstrói a interface 
    }); 
  } 
 
  @override 
  Widget build(BuildContext context) { 
    return Column( 
 
      mainAxisAlignment: MainAxisAlignment.center, 
      children: [ 
        const Text( 
          'Eu sou um StatefulWidget e eu mudo!', 
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), 
        ), 
        Text( 
          'Contador: $_contador', // Exibe o valor atualizado do contador 
          style: const TextStyle(fontSize: 24), 
        ), 
        const SizedBox(height: 10), // Espaço entre os elementos 
        ElevatedButton( 
          onPressed: _incrementar, // Chama _incrementar() quando pressionado 
          child: const Text('Incrementar'), 
        ), 
      ], 
    ); 
  } 
} 
 
// O app principal que exibe os dois widgets na tela 
class MyApp extends StatelessWidget { 
  const MyApp({super.key}); 
 
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      debugShowCheckedModeBanner: false, // Remove o banner de debug 
      home: Scaffold( 
        appBar: AppBar( 
          title: const Text('Stateless vs Stateful'), 
          backgroundColor: Colors.blueAccent, 
        ), 
        body: const Center( 
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [ 
              TextoFixo(), // Exemplo de um StatelessWidget (não muda) 
              SizedBox(height: 20), // Espaçamento entre os widgets 
              Contador(), // Exemplo de um StatefulWidget (muda ao interagir) 
            ], 
          ), 
        ), 
      ), 
    ); 
  }
}