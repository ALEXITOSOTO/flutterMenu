import 'package:flutter/material.dart';

class InsertProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 9, 121, 141),
        title: Text(
          "Inserción de productos",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Nombre del Producto",
                    border:
                        OutlineInputBorder(), // para mejorar el estilo del borde
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Descripcion del Producto",
                    border:
                        OutlineInputBorder(), // para mejorar el estilo del borde
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Precio del Producto x unidad",
                    border:
                        OutlineInputBorder(), // para mejorar el estilo del borde
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Cantidad del Producto",
                    border:
                        OutlineInputBorder(), // para mejorar el estilo del borde
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Categoria del Producto",
                    border:
                        OutlineInputBorder(), // para mejorar el estilo del borde
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Aceptar",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Cancelar",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
