import 'package:flutter/material.dart';


void main() { 
runApp(const MyApp()); // Inicia o app 
}


class MyApp extends StatelessWidget { 
  const MyApp({super.key}); 
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      debugShowCheckedModeBanner: false, // Remove o banner de debug 
      home: Scaffold( 
        appBar: AppBar( 
          title: const Text('Exemplo de Layouts'), 
          backgroundColor: Colors.blueAccent, 
        ), 
        body: Column( 
          children: [ 
            // Stack para sobrepor widgets 
            Expanded( 
              child: Stack( 
                children: [ 
                  // Container de fundo (imagem de fundo simulada) 
                  Container( 
                    width: double.infinity, 
                    height: double.infinity, 
                    color: Colors.blue[100], // Fundo azul claro 
                  ), 
                  // Texto centralizado sobreposto na Stack 
                  const Center( 
                    child: Text( 
                      'Texto Centralizado no Stack', 
                      style: TextStyle( 
                        fontSize: 20, 
                        fontWeight: FontWeight.bold, 
                        color: Colors.black, 
                      ), 
                    ), 
                  ), 

                  // Um botão posicionado no canto inferior direito 
                  Positioned( 
                    bottom: 20, 
                    right: 20,
                    child: FloatingActionButton( 
                      onPressed: () {}, 
                      backgroundColor: Colors.blue, 
                      child: const Icon(Icons.add), 
                    ), 
                  ), 
                ], 
              ), 
            ), 

            // Espaço entre Stack e Row 
            const SizedBox(height: 20), 

            // Row para organizar elementos horizontalmente 
            Row( 
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
              children: [ 
                // Criando botões em um Row com tons de azul 
                ElevatedButton( 
                  onPressed: () {}, 
                  style: ElevatedButton.styleFrom( 
                    backgroundColor: Colors.blue, // Cor de fundo azul 
                    foregroundColor: Colors.white, // Cor do texto branca 
                  ), 
                  child: const Text('Botão 1'), 
                ), 
                ElevatedButton( 
                  onPressed: () {}, 
                  style: ElevatedButton.styleFrom( 
                    backgroundColor: Colors.blueAccent, // Tom diferente de azul 
                    foregroundColor: Colors.white, // Cor do texto branca 
                  ), 
                  child: const Text('Botão 2'), 
                ), 
                ElevatedButton( 
                  onPressed: () {}, 
                  style: ElevatedButton.styleFrom( 
                    backgroundColor: Colors.lightBlue, // Azul mais claro 
                    foregroundColor: Colors.white, // Cor do texto branca 
                  ), 
                  child: const Text('Botão 3'), 
                ), 

              ], 
            ), 
            // Espaço antes do Footer 
            const SizedBox(height: 20), 

            // Footer com Container 
            Container( 
              width: double.infinity,
              padding: const EdgeInsets.all(10), 
              color: Colors.blueAccent, 
              child: const Text( 
                'Footer - Exemplo de Layout', 
                textAlign: TextAlign.center, 
                style: TextStyle(color: Colors.white, fontSize: 16), 
              ), 
            ), 
          ], 
        ), 
      ), 
    ); 
  } 
}