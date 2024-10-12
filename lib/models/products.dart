//CON ESTAS CLASES VAMOS A TRABAJAR Y DE AQUI VA A IR A LA CONEXION
class Products {
  // El ? sirve para que sea opcional los datos ingresados osea puede ser nullo o no es necesario ingresarlos
  int? id;
  String nombre;
  String? descripcion;
  double precio;
  int cantidad;
  String? categoria;

  //Constructor
  Products(
      {
      //El required es que el campo es obligatorio
      this.id,
      required this.nombre,
      this.descripcion,
      required this.precio,
      required this.cantidad,
      this.categoria});
}
