import 'dart:io';

import '../Domain/User.dart';
import '../Repositories/UserRepository.dart';

class UserController {
  UserRepository _repo = UserRepository();

  void create() {
    try {
      print("Ingrese nombre:");
      String name = stdin.readLineSync() ?? "";
      User user = User(name);
      _repo.create(user);
      print("Usuario creado correctamente.");
    } catch (e) {
      print("Error: $e");
    }
  }

  void read() {
    final users = _repo.read();
    if (users.isEmpty) {
      print("No hay usuarios.");
      return;
    }

    for (var i = 0; i < users.length; i++) {
      print("${i + 1}. ${users[i]}");
    }
  }

  void readOne() {
    print("Ingrese nombre a buscar:");
    String name = stdin.readLineSync() ?? "";

    final user = _repo.readOne(name);

    if (user == null) {
      print("Usuario no encontrado.");
    } else {
      print("Encontrado: $user");
    }
  }

  void update() {
    try {
      final users = _repo.read();

      if (users.isEmpty) {
        print("No hay usuarios para actualizar.");
        return;
      }

      for (var i = 0; i < users.length; i++) {
        print("${i + 1}. ${users[i]}");
      }

      print("Seleccione el número del usuario a actualizar:");
      int? input = int.tryParse(stdin.readLineSync() ?? "");
      if (input == null) {
        print("Entrada inválida.");
        return;
      }
      int index = input - 1;

      print("Nuevo nombre:");
      String newName = stdin.readLineSync() ?? "";

      _repo.updateByIndex(index, newName);
      print("Usuario actualizado.");
    } catch (e) {
      print("Error: $e");
    }
  }

  void delete() {
    try {
      final users = _repo.read();

      if (users.isEmpty) {
        print("No hay usuarios para eliminar.");
        return;
      }

      for (var i = 0; i < users.length; i++) {
        print("${i + 1}. ${users[i]}");
      }

      print("Seleccione el número del usuario a eliminar:");
      int? input = int.tryParse(stdin.readLineSync() ?? "");
      if (input == null) {
        print("Entrada inválida.");
        return;
      }
      int index = input - 1;

      _repo.deleteByIndex(index);
      print("Usuario eliminado.");
    } catch (e) {
      print("Error: $e");
    }
  }
}
