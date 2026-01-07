import 'package:flutter/material.dart'; 
void main() { 
  runApp(const MyApp()); // Inicia o aplicativo 
} 
// O app principal que exibe a SplashScreen primeiro 
class MyApp extends StatelessWidget { 
  const MyApp({super.key}); 
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      debugShowCheckedModeBanner: false, // Remove o banner de debug 
      title: 'Tela de Abertura', 
      theme: ThemeData( 
        primarySwatch: Colors.blue, // Cor principal azul 
      ), 
      home: const SplashScreen(), // Define a SplashScreen como primeira tela 
    ); 
  } 
} 
// Tela de Abertura (Splash Screen) 
class SplashScreen extends StatefulWidget { 
 
  const SplashScreen({super.key}); 
 
  @override 
  _SplashScreenState createState() => _SplashScreenState(); 
} 
 
// Estado da SplashScreen 
class _SplashScreenState extends 
State<SplashScreen> { 
  @override 
  void initState() { 
    super.initState(); 
 
    // Aguarda 3 segundos e navega para a Tela Principal 
    Future.delayed(const Duration(seconds: 3), () { 
      Navigator.pushReplacement( 
        context, 
        MaterialPageRoute(builder: (context) => const HomeScreen()), 
      ); 
    }); 
  } 
 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      backgroundColor: Colors.blue, // Fundo azul para a SplashScreen 
      body: Center( 
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [ 
            // Ícone do app (pode ser substituído por um logo) 
            const Icon( 
              Icons.flutter_dash, // Ícone do Flutter 
              size: 100, 
              color: Colors.white, 
            ), 
             
            const SizedBox(height: 20), // Espaço entre os widgets 
             
            // Texto animado (Fade-in) 
            TweenAnimationBuilder<double>( 
              tween: Tween<double>(begin: 0, end: 1), 
              duration: const Duration(seconds: 3), 
              builder: (context, value, child) { 
                return Opacity( 
 
                  opacity: value, 
                  child: const Text( 
                    'Bem-vindo ao App!', 
                    style: TextStyle( 
                      fontSize: 24, 
                      fontWeight: FontWeight.bold, 
                      color: Colors.white, 
                    ), 
                  ), 
                ); 
              }, 
            ), 
          ], 
        ), 
      ), 
    ); 
  } 
} 
 
// Tela Principal do App 
class HomeScreen extends StatelessWidget { 
  const HomeScreen({super.key}); 
 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        title: const Text('Tela Principal'), 
      ), 
      body: const Center( 
        child: Text( 
          'Esta é a Tela Principal!', 
          style: TextStyle(fontSize: 20), 
        ), 
      ), 
    ); 
  } 
}