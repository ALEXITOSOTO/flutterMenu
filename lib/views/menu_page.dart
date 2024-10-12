import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String nombreUsuario = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Menu"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Bienvenido $nombreUsuario"),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text("Ir a Login"),
            ),
          ],
        ),
      ),
      //Boton flotante
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/productos/insertar');
        },
        child: Icon(Icons.add),
        shape: CircleBorder(),
        backgroundColor: const Color.fromARGB(255, 95, 137, 210),
      ),
    );
  }
}
