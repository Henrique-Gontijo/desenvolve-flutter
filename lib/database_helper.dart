import 'package:sqflite/sqflite.dart'; 
import 'package:path/path.dart'; 
 
class DatabaseHelper { 
  static Future<Database> getDatabase() async { 
    final path = join(await getDatabasesPath(), 'clientes.db'); 
    return openDatabase( 
      path, 
      onCreate: (db, version) { 
        return db.execute( 
          'CREATE TABLE clientes(id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT, email TEXT)', 
        ); 
      }, 
      version: 1, 
 
    ); 
  } 
 
  static Future<void> insertCliente(String nome, String email) async { 
    final db = await getDatabase(); 
    await db.insert('clientes', {'nome': nome, 'email': email}); 
  } 
 
  static Future<List<Map<String, dynamic>>> getClientes() async { 
    final db = await getDatabase(); 
    return db.query('clientes'); 
  } 
 
  static Future<void> updateCliente(int id, String nome, String email) async { 
    final db = await getDatabase(); 
    await db.update('clientes', {'nome': nome, 'email': email}, where: 'id = ?', whereArgs: [id]); 
  } 
 
  static Future<void> deleteCliente(int id) async { 
    final db = await getDatabase(); 
    await db.delete('clientes', where: 'id = ?', whereArgs: [id]); 
  } 
} 