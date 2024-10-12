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
}
