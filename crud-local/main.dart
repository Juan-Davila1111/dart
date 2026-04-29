import 'dart:io';

import 'Controllers/UserController.dart';

void main() {
    UserController userController = UserController(); 
  do {
    print("""
1. Listar
2. Crear
3. Editar
4. Eliminar
5. Buscar por nombre
6. Salir
Opción:
""");

    int option = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

    switch (option) {
      case 1:
        userController.read();
        break;
      case 2:
        userController.create();
        break;
      case 3:
        userController.update();
        break;
      case 4:
        userController.delete();
        break;
      case 5:
        userController.readOne();
        break;
      case 6:
        print("Saliendo...");
        return;
      default:
        print("Entrada inválida.");
    }
  } while (true);
}
