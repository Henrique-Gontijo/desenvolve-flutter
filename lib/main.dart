import 'package:flutter/material.dart'; 

void main() { 
runApp(const MyApp()); // Inicia o app 
} 

// O app principal com temas personalizados 
class MyApp extends StatelessWidget { 
  const MyApp({super.key}); 

  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 

      debugShowCheckedModeBanner: false, // Remove o banner de debug 
      title: 'Estilos e Temas', 

      // Definição do Tema Global (claro e escuro) 
      theme: ThemeData( 
        brightness: Brightness.light, // Tema claro 
        primaryColor: Colors.green, // Cor principal 
        scaffoldBackgroundColor: Colors.white, // Cor de fundo do app 
        textTheme: const TextTheme( 
          bodyLarge: TextStyle(fontSize: 18, color: Colors.black), // Texto principal 
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black87), // Texto secundário 
        ), 
        elevatedButtonTheme: ElevatedButtonThemeData( 
          style: ElevatedButton.styleFrom( 
            backgroundColor: Colors.lightGreen, // Cor de fundo dos botões 
            foregroundColor: Colors.white, // Cor do texto 
            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), 
            shape: RoundedRectangleBorder( 
              borderRadius: BorderRadius.circular(10), // Bordas arredondadas 
            ), 
          ), 
        ), 
      ), 

      darkTheme: ThemeData( 
        brightness: Brightness.dark, // Tema escuro 
        primaryColor: Colors.blueGrey, 
        scaffoldBackgroundColor: Colors.black, 
        textTheme: const TextTheme( 
          bodyLarge: TextStyle(fontSize: 18, color: Colors.white), // Texto principal 
          bodyMedium: TextStyle(fontSize: 16, color: Colors.white70), //Texto secundário 

        ), 
        elevatedButtonTheme: ElevatedButtonThemeData( 
          style: ElevatedButton.styleFrom( 
            backgroundColor: Colors.blueGrey, // Cor no modo escuro 
            foregroundColor: Colors.white, // Cor do texto 
          ), 
        ), 
      ), 

      themeMode: ThemeMode.system, // Alterna automaticamente entre claro/escuro 

      home: const HomeScreen(), // Tela inicial 
    ); 
  } 
} 

// Tela principal do aplicativo 
class HomeScreen extends StatelessWidget { 
  const HomeScreen({super.key}); 

  @override 
  Widget build(BuildContext context) { 
      return Scaffold(
        appBar: AppBar( 
          title: const Text('Estilos e Temas'), 
          backgroundColor: Theme.of(context).primaryColor, // Usa a cor principal do tema 
        ), 
        body: Center( 
            child: Column( 
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [ 
              // Exemplo de texto estilizado pelo tema global 
              Text( 
                'Texto com estilo global!', 
                style: Theme.of(context).textTheme.bodyLarge, 
              ), 

              const SizedBox(height: 20), // Espaçamento 

              // Exemplo de texto com estilo personalizado (local) 
              const Text( 
                'Texto com estilo local!', 
                style: TextStyle( 
                  fontSize: 20, 
                  fontWeight: FontWeight.bold, 
                  color: Colors.deepPurple, 
                ), 
              ), 
              const SizedBox(height: 20), // Espaçamento 
              // Botão estilizado automaticamente pelo tema global 
              ElevatedButton( 
                onPressed: () {}, 
                child: const Text('Botão com Tema'), 
              ), 
            ], 
          ), 
        ), 
      ); 
  } // Widget
} // Home Screen