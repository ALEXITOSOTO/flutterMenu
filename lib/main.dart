import 'package:flutter/material.dart';
import 'package:menu/views/login_page.dart';
import 'package:menu/views/menu_page.dart';
import 'package:menu/views/products/insert_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Solo para el archivo main
      title: "Aplicacion de Menu", // Titulo de la aplicacion
      initialRoute: '/login', //Ruta inicial
      routes: {
        '/login': (context) => LoginPage(),
        '/menu': (context) => MenuPage(),
        '/productos/insertar': (context) =>
            InsertProductPage(), //Ruta para la gestion de productos
      },
    );
  }
}
