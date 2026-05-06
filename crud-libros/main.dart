import 'dart:io';
import 'repositories/BookRepository.dart';
import 'services/Book.service.dart';

void main() {
  void _createBook(BookService service) {
    stdout.write('Título: ');
    final title = stdin.readLineSync()!;

    stdout.write('Autor: ');
    final author = stdin.readLineSync()!;

    stdout.write('Año: ');
    final year = int.parse(stdin.readLineSync()!);

    service.createBook(title, author, year);
    print('Libro creado.');
  }

  void _listBooks(BookService service) {
    final books = service.getAll();
    for (var book in books) {
      print(book);
    }
  }

  void _getById(BookService service) {
    stdout.write('ID: ');
    final id = int.parse(stdin.readLineSync()!);

    final book = service.getById(id);
    print(book);
  }

  void _search(BookService service) {
    stdout.write('Título a buscar: ');
    final title = stdin.readLineSync()!;

    final results = service.searchByTitle(title);
    for (var book in results) {
      print(book);
    }
  }

  void _update(BookService service) {
    stdout.write('ID: ');
    final id = int.parse(stdin.readLineSync()!);

    stdout.write('Nuevo título: ');
    final title = stdin.readLineSync()!;

    stdout.write('Nuevo autor: ');
    final author = stdin.readLineSync()!;

    stdout.write('Nuevo año: ');
    final year = int.parse(stdin.readLineSync()!);

    service.update(id, title, author, year);
    print('Libro actualizado');
  }

  void _delete(BookService service) {
    stdout.write('ID: ');
    final id = int.parse(stdin.readLineSync()!);

    service.delete(id);
    print('Libro eliminado');
  }

  final service = BookService(BookRepository());

  while (true) {
    print('\nCRUD de Libros');
    print('1. Crear libro');
    print('2. Listar libros');
    print('3. Buscar por ID');
    print('4. Buscar por título');
    print('5. Actualizar libro');
    print('6. Eliminar libro');
    print('0. Salir');
    stdout.write('Opción: ');

    final option = stdin.readLineSync();

    try {
      switch (option) {
        case '1':
          _createBook(service);
          break;
        case '2':
          _listBooks(service);
          break;
        case '3':
          _getById(service);
          break;
        case '4':
          _search(service);
          break;
        case '5':
          _update(service);
          break;
        case '6':
          _delete(service);
          break;
        case '0':
          print('Saliendo...');
          return;
        default:
          print('Opción inválida');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
