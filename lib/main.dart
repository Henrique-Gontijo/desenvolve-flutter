import 'package:flutter/material.dart'; 
void main() { 
  runApp(const MyApp()); // Inicia o app 
} 
class MyApp extends StatelessWidget { 
  const MyApp({super.key}); 
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      debugShowCheckedModeBanner: false, 
      // Remove o banner de debug 
      title: 'Navegação entre Telas', 
      theme: ThemeData( 
        primarySwatch: Colors.blue, // Tema azul para o app 
      ), 
      home: const HomeScreen(), // Define a tela inicial 
    ); 
  } 
} 
// Tela Inicial 
class HomeScreen extends StatelessWidget { 

  const HomeScreen({super.key}); 

  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        title: const Text('Tela Inicial'), 
      ), 
      body: Center( 
        child: ElevatedButton( 
          onPressed: () { 
            // Navega para a Segunda Tela quando pressionado 
            Navigator.push( 
              context, 
              MaterialPageRoute(builder: 
              (context) => const SecondScreen()), 
            ); 
          }, 
          style: 
          ElevatedButton.styleFrom( 
            backgroundColor: Colors.blue, // Botão azul 
            foregroundColor: Colors.white, // Texto branco 
          ), child: const Text('Ir para a Segunda Tela'), 
        ), 
      ), 
    ); 
  } 
} 

// Segunda Tela 
class SecondScreen extends StatelessWidget { 
  const SecondScreen({super.key}); 

  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        title: const Text('Segunda Tela'), 
      ), 
      body: Center( 
        child: ElevatedButton( 
          onPressed: () { 
            // Retorna para a tela anterior quando pressionado 
            Navigator.pop(context); 
          }, 
          style: ElevatedButton.styleFrom( 
            backgroundColor: Colors.green, // Botão verde 
            foregroundColor: Colors.white, // Texto branco 
          ), 
          child: const Text('Voltar para a Tela Inicial'), 
        ),  
      ), 
    ); 
  } 
} 