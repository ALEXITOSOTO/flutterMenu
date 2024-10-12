import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbConnection {
  static const version = 1; //Inicializando la bdd en la version 1
  static const String dbname =
      'catalogo.db'; // Nombre de la bdd (siempore con la extension .db)

  //Sirve parta devolver un resultado asincrono, la palabra Future significa que la respuesta es Asincrona
  static Future<Database> getDatabase() async {
    //Abriendo la bdd desde la ruta con el path descargado - concatenamos la ruta con la bdd
    return openDatabase(join(await getDatabasesPath(), dbname),
        //Si no existe la bdd la crea con el onCreate y sus dos parametros
        onCreate: (db, version) async => {
              //Crear la tabla codigo sql para crear la tabla (lo que esta dentro de las ''' seignifica que va a ser string)
              await db.execute('''
                CREATE TABLE productos(
                  id INTEGER PRIMARY KEY AUTOINCREMENT,
                  nombre TEXT NOT NULL,
                  descripcion TEXT NULL,
                  precio REAL NOT NULL,
                  cantidad INTEGER NOT NULL,
                  categoria TEXT NULL
                )
              '''),
              // await db.execute("sql") -> Vale crear otra tabla aqui
            });
  }

  //Creando la funcion insertar
  static Future<int> insertar(String table, dynamic data) async {
    final db = await getDatabase();
    return db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  //Creando la fucnion actualizar
  static Future<int> actualizar(String table, dynamic data, int id) async {
    final db = await getDatabase();
    return db.update(table, data,
        where: 'id = ?',
        whereArgs: [id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  //Creando funcion para eliminar
  static Future<int> eliminar(String table, int id) async {
    final db = await getDatabase();
    return db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  //Creando la fucnion para seleccionar
  static Future<List<Map<String, dynamic>>> listar(String table) async {
    // Es como si hicieramos Select * from productos
    final db = await getDatabase();
    return await db.query(table);
  }

  //Filtrado
  static Future<List<Map<String, dynamic>>> filtrar(
      String table, String where, dynamic whereArgs) async {
    final db = await getDatabase();
    return await db.query(table, where: where, whereArgs: whereArgs);
  }
}
