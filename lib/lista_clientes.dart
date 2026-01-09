import 'package:flutter/material.dart'; 
import 'database_helper.dart'; 
import 'cadastro_cliente.dart'; 
 
class ListaClientes extends StatefulWidget { 
  @override 
  _ListaClientesState createState() => _ListaClientesState(); 
} 
 
class _ListaClientesState extends State<ListaClientes> { 
  List<Map<String, dynamic>> clientes = []; 
 
  @override 
  void initState() { 
    super.initState(); 
    carregarClientes(); 
  } 
 
  Future<void> carregarClientes() async { 
    final dados = await DatabaseHelper.getClientes(); 
    setState(() { 
 
      clientes = dados; 
    }); 
  } 
 
  void _editarCliente(int id, String nome, String email) { 
    TextEditingController nomeController = TextEditingController(text: nome); 
    TextEditingController emailController = TextEditingController(text: email); 
 
    showDialog( 
      context: context, 
      builder: (context) => AlertDialog( 
        title: Text('Editar Cliente'), 
        content: Column( 
          mainAxisSize: MainAxisSize.min, 
          children: [ 
            TextField(controller: nomeController, decoration: InputDecoration(labelText: 'Nome')), 
            TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email')), 
          ], 
        ), 
        actions: [ 
          TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancelar')), 
          ElevatedButton( 
            onPressed: () async { 
              await DatabaseHelper.updateCliente(id, nomeController.text, emailController.text); 
              Navigator.pop(context); 
              carregarClientes(); 
            }, 
            child: Text('Salvar'), 
          ), 
        ], 
      ), 
    ); 
  } 
 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar(title: Text('Lista de Clientes')), 
      body: ListView.builder( 
        itemCount: clientes.length, 
        itemBuilder: (context, index) { 
          final cliente = clientes[index]; 
          return ListTile( 
 
            title: Text(cliente['nome']), 
            subtitle: Text(cliente['email']), 
            trailing: Row( 
              mainAxisSize: MainAxisSize.min, 
              children: [ 
                IconButton(icon: Icon(Icons.edit, color: Colors.blue), onPressed: () => _editarCliente(cliente['id'], cliente['nome'], cliente['email'])), 
                IconButton(icon: Icon(Icons.delete, color: Colors.red), onPressed: () async { 
                  await DatabaseHelper.deleteCliente(cliente['id']); 
                  carregarClientes(); 
                }), 
              ], 
            ), 
          ); 
        }, 
      ), 
      floatingActionButton: FloatingActionButton( 
        child: Icon(Icons.add), 
        onPressed: () => Navigator.push(context, 
MaterialPageRoute(builder: (context) => CadastroCliente())), 
      ), 
    ); 
  } 
}