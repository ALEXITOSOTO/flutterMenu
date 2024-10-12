import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool aceptarTerminos = false;
  String nombre = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: const Color.fromARGB(255, 76, 162, 175),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Center(
          child: Column(
            children: [
              Text("Inicio de Sesión"),
              SizedBox(height: 20),
              Image.network(
                  "https://static.vecteezy.com/system/resources/previews/006/925/139/non_2x/play-button-white-color-lock-user-account-login-digital-design-logo-icon-free-photo.jpg"),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(labelText: "Nombre de Usuario"),
                onChanged: (value) {
                  setState(() {
                    nombre = value; //Obteniendo el nombre en la variable value
                  });
                },
              ),
              Row(
                children: [
                  Checkbox(
                      value: aceptarTerminos,
                      onChanged: (value) {
                        setState(() {
                          aceptarTerminos = value ??
                              false; //Cambiar el valor dependiendo el usuario
                        });
                      }),
                  Text("Acepto los términos y condiciones"),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (aceptarTerminos && nombre.isNotEmpty) {
                    //Navegabilidad
                    Navigator.pushNamed(context, '/menu',
                        arguments:
                            nombre); //Nabegar a la route - pantalla de menu
                  } else {
                    // Mostrar Snackbar (Mensaje) si faltan datos
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Llene la información'),
                      ),
                    );
                  }
                },
                child: Text('Continuar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
