import 'dart:io';
import 'repositories/ProductRepository.dart';
import 'services/Product.service.dart';

void main() {
  void _createProduct(ProductService service) {
    // Funcion para crear un Producto
    stdout.write('Nobre del Producto: ');
    final name = stdin.readLineSync()!;

    stdout.write('Precio: ');
    final price = double.parse(stdin.readLineSync()!);

    stdout.write('Cantidad Disponible: ');
    final stock = int.parse(stdin.readLineSync()!);

    service.createProduct(name, price, stock);
    print("Producto creado con exito");
  }

  void _listProduct(ProductService service) {
    //Funcion Para listar todos los productos
    final products = service.getAll();
    for (var product in products) {
      print(product);
    }
  }

  void _updateProduct(ProductService service) {
    //Funcion para actualizar un producto
    stdout.write('ID: ');
    final id = int.parse(stdin.readLineSync()!);

    stdout.write('Nuevo nombre del producto: ');
    final name = stdin.readLineSync()!;

    stdout.write('Nuevo precio: ');
    final price = double.parse(stdin.readLineSync()!);

    stdout.write('Nueva Cantidad Disponible: ');
    final stock = int.parse(stdin.readLineSync()!);

    service.update(id, name, price, stock);
    print("Producto actualizado correctamente");
  }

  void _deleteProduct(ProductService service) {
    //Funcion para eliminar un producto

    stdout.write('ID: ');
    final id = int.parse(stdin.readLineSync()!);

    service.delete(id);
    print("Producto Elimina exitosamente");
  }

  final service = ProductService(ProductRepository());

  while (true) {
    print("\n Bienvenido al CRUD de productos");
    print("1. Crear producto");
    print("2. Listar productos");
    print("3. Actualizar producto");
    print("4. Eliminar producto");
    print("5. Salir del sistema");
    stdout.write('Opcion: ');

    final opcion = stdin.readLineSync();

    try {
      switch (opcion) {
        case '1':
          _createProduct(service); // Llama a la funcion de crear un producto
          break;
        case '2':
          _listProduct(service); // Llama a la funcion de listar los productos
          break;
        case '3':
          _updateProduct(
            service,
          ); // Llama a la funcion de actualizar un producto
          break;
        case '4':
          _deleteProduct(service); // Llama a la funcion de eliminar un producto
          break;
        case '5': // Salir del sistema
          print("Saliendo del sistema...");
          break;
        default:
          print("Opcion invalida");
          return;
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}
