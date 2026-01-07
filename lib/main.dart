import 'package:flutter/material.dart'; 

void main() { 
  runApp(const MyApp()); 
} 
 
class MyApp extends StatelessWidget { 
  const MyApp({super.key}); 
 
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      debugShowCheckedModeBanner: false, // Remove o banner de debug 
      home: Scaffold( 
        appBar: AppBar( 
          title: const Text('Widgets Básicos', style: TextStyle(color: Colors.white)), 
          backgroundColor: Colors.redAccent, 
        ), 
        body: Center( 
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.center, // Centraliza os itens 
            children: [ 
              // Exemplo de Container com cor de fundo e borda arredondada 
              Container( 
                width: 200, 
                height: 100, 
                decoration: BoxDecoration( 
                  color: Colors.red, // Cor de fundo 
                  borderRadius: BorderRadius.circular(10), // Borda arredondada 
                ), 
                alignment: Alignment.center, // Centraliza o texto no Container 
                child: const Text( 
                  'Container Vermelho', 
                  style: TextStyle(color: Colors.white, fontSize: 18), 
                ), 
              ), 
 
              const SizedBox(height: 20), // Espaçamento 
 
 
              // Exemplo de Row com dois botões 
              Row( 
                mainAxisAlignment: MainAxisAlignment.center, // Centraliza na horizontal 
                children: [ 
                  ElevatedButton( 
                    onPressed: () {}, 
                    child: const Text('Botão 1'), 
                  ), 
                  const SizedBox(width: 20), // Espaçamento entre os botões 
                  ElevatedButton( 
                    onPressed: () {}, 
                    child: const Text('Botão 2'), 
                  ), 
                ], 
              ), 
 
              const SizedBox(height: 20), // Espaçamento 
 
              // Exemplo de texto simples 
              const Text( 
                'Meu "Hello World" no Flutter!', 
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), 
              ), 
            ], 
          ), 
        ), 
      ), 
    ); 
  } 
}