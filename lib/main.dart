import 'package:flutter/material.dart'; 
 
void main() { 
  runApp(const MyApp()); // Inicia o aplicativo 
} 
 
// O app principal com um Drawer (Menu Lateral) 
class MyApp extends StatelessWidget { 
  const MyApp({super.key}); 
 
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      debugShowCheckedModeBanner: false, // Remove o banner de debug 
      title: 'Menu de Navegação', 
      theme: ThemeData( 
        primarySwatch: Colors.blue, // Cor principal azul 
      ), 
      home: const HomeScreen(), // Define a Tela Inicial 
    ); 
  } 
} 
 
// Tela Inicial com Menu de Navegação 
class HomeScreen extends StatelessWidget { 
  const HomeScreen({super.key}); 
 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar(title: const Text('Tela Inicial')), 
 
      // Drawer: Menu de navegação lateral 
      drawer: Drawer( 
        child: ListView( 
          padding: EdgeInsets.zero, 
          children: [ 
            // Cabeçalho do Drawer 
            DrawerHeader( 
              decoration: BoxDecoration(color: Colors.blue), 
              child: const Text( 
                'Menu de Navegação', 
 
                style: TextStyle(color: Colors.white, fontSize: 20), 
              ), 
            ), 
 
            // Item 1: Tela Inicial 
            ListTile( 
              leading: const Icon(Icons.home), 
              title: const Text('Tela Inicial'), 
              onTap: () { 
                Navigator.pop(context); // Fecha o menu 
              }, 
            ), 
 
            // Item 2: Tela de Configurações 
            ListTile( 
              leading: const Icon(Icons.settings), 
              title: const Text('Configurações'), 
              onTap: () { 
                Navigator.pop(context); // Fecha o menu 
                Navigator.push( 
                  context, 
                  MaterialPageRoute(builder: (context) => const SettingsScreen()), 
                ); 
              }, 
            ), 
 
            // Item 3: Tela Sobre 
            ListTile( 
              leading: const Icon(Icons.info), 
              title: const Text('Sobre'), 
              onTap: () { 
                Navigator.pop(context); // Fecha o menu 
                Navigator.push( 
                  context, 
                  MaterialPageRoute(builder: (context) => const AboutScreen()), 
                ); 
              }, 
            ), 
          ], 
        ), 
      ), 
 
      body: const Center( 
        child: Text('Bem-vindo à Tela Inicial!', style: TextStyle(fontSize: 20)), 
      ), 
    ); 
 
  } 
} 
 
// Tela de Configurações 
class SettingsScreen extends StatelessWidget { 
  const SettingsScreen({super.key}); 
 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar(title: const Text('Configurações')), 
      body: const Center( 
        child: Text('Aqui você pode alterar as configurações.', style: TextStyle(fontSize: 18)), 
      ), 
    ); 
  } 
} 
 
// Tela Sobre 
class AboutScreen extends StatelessWidget { 
  const AboutScreen({super.key}); 
 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar(title: const Text('Sobre')), 
      body: const Center( 
        child: Text('Este é um exemplo de menu de navegação.', style: TextStyle(fontSize: 18)), 
      ), 
    ); 
  } 
}