import 'package:flutter/material.dart'; 
import 'database_helper.dart'; 
import 'lista_clientes.dart'; 
 
class CadastroCliente extends StatelessWidget { 
  final TextEditingController nomeController = TextEditingController(); 
  final TextEditingController emailController = TextEditingController(); 
 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar(title: Text('Cadastro de Cliente')), 
      body: Padding( 
        padding: EdgeInsets.all(16.0), 
        child: Column( 
          children: [ 
 
            TextField(controller: nomeController, decoration: InputDecoration(labelText: 'Nome')), 
            TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email')), 
            SizedBox(height: 20), 
            ElevatedButton( 
              onPressed: () async { 
                if (nomeController.text.isNotEmpty && emailController.text.isNotEmpty) { 
                  await DatabaseHelper.insertCliente(nomeController.text, emailController.text); 
                  nomeController.clear(); 
                  emailController.clear(); 
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ListaClientes())); 
                } 
              }, 
              child: Text('Cadastrar'), 
            ), 
          ], 
        ), 
      ), 
    ); 
  } 
} 