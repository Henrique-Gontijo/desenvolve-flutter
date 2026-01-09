// Execute o comando (flutter pub add http) para instalar o pacote http 
 
import 'package:flutter/material.dart'; 
import 'package:http/http.dart' as http; 
import 'dart:convert'; 
 
void main() { 
  runApp(MyApp()); 
} 
 
class MyApp extends StatelessWidget { 
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp( 
      title: 'Flutter API Example', 
      theme: ThemeData( 
        primarySwatch: Colors.blue, 
      ), 
      home: ApiExamplePage(), 
    ); 
  } 
} 
 
class ApiExamplePage extends StatefulWidget { 
  @override 
  _ApiExamplePageState createState() => _ApiExamplePageState(); 
} 
 
class _ApiExamplePageState extends State<ApiExamplePage> { 
  String _data = ""; 
 
  Future<void> fetchData() async { 
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1')); 
     
    if (response.statusCode == 200) { 
      setState(() { 
        _data = json.decode(response.body)['title']; 
      }); 
    } else { 
      setState(() { 
        _data = 'Erro ao carregar os dados'; 
      }); 
    } 
  } 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( appBar: AppBar(title: Text('Consumo de API no Flutter')), 
      body: Center( 
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center, 
          children: <Widget>[ 
            Text(
              _data, 
              textAlign: TextAlign.center, 
              style: TextStyle(fontSize: 18)
            ), 
            SizedBox(height: 20), 
            ElevatedButton( 
              onPressed: fetchData, 
              child: Text('Buscar Dados'), 
            ), 
          ], 
        ), 
      ), 
    ); 
  } 
} 
