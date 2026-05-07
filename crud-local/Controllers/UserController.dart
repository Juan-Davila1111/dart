import 'dart:io';

import '../Domain/User.dart';
import '../Repositories/UserRepository.dart';

class UserController {
  final UserRepository _repo;

  UserController(this._repo);

  void create() {
    String name = _readInput("Ingrese nombre:").trim();

    if (name.isEmpty) {
      print("El nombre no puede estar vacío.");
      return;
    }

    final exists = _repo.readOne(name);

    if (exists != null) {
      print("El usuario ya existe.");
      return;
    }

    final user = User(name);

    _repo.create(user);

    print("Usuario creado correctamente.");
  }

  void read() {
    final users = _repo.read();

    if (users.isEmpty) {
      print("No hay usuarios.");
      return;
    }

    print("\n===== LISTA DE USUARIOS =====");

    for (var i = 0; i < users.length; i++) {
      print("${i + 1}. ${users[i]}");
    }
  }

  void readOne() {
    String name = _readInput("Ingrese nombre a buscar:").trim();

    if (name.isEmpty) {
      print("El nombre no puede estar vacío.");
      return;
    }

    final user = _repo.readOne(name);

    if (user == null) {
      print("Usuario no encontrado.");
    } else {
      print("Usuario encontrado: $user");
    }
  }

  void update() {
    final users = _showUsers();

    if (users.isEmpty) return;

    int? index = _readIndex(
      users.length,
      "Seleccione el número del usuario a actualizar:",
    );

    if (index == null) return;

    String newName = _readInput("Nuevo nombre:").trim();

    if (newName.isEmpty) {
      print("El nombre no puede estar vacío.");
      return;
    }

    final exists = _repo.readOne(newName);

    if (exists != null) {
      print("Ya existe un usuario con ese nombre.");
      return;
    }

    _repo.updateByIndex(index, newName);

    print("Usuario actualizado correctamente.");
  }

  void delete() {
    final users = _showUsers();

    if (users.isEmpty) return;

    int? index = _readIndex(
      users.length,
      "Seleccione el número del usuario a eliminar:",
    );

    if (index == null) return;

    _repo.deleteByIndex(index);

    print("Usuario eliminado correctamente.");
  }

  String _readInput(String message) {
    stdout.write("$message ");
    return stdin.readLineSync() ?? "";
  }

  List<User> _showUsers() {
    final users = _repo.read();

    if (users.isEmpty) {
      print("No hay usuarios.");
      return [];
    }

    print("\n===== USUARIOS =====");

    for (var i = 0; i < users.length; i++) {
      print("${i + 1}. ${users[i]}");
    }

    return users;
  }

  int? _readIndex(int length, String message) {
    stdout.write("$message ");

    int? input = int.tryParse(stdin.readLineSync() ?? "");

    if (input == null) {
      print("Entrada inválida.");
      return null;
    }

    int index = input - 1;

    if (index < 0 || index >= length) {
      print("Índice inválido.");
      return null;
    }

    return index;
  }
}