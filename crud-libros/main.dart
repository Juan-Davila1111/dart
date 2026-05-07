import 'dart:io';
import 'repositories/BookRepository.dart';
import 'services/Book.service.dart';

void main() {
  void _createBook(BookService service) {
    // Funcion para crear un libro
    print('Crear libro');
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
    // Funcion para listar todos los libros
    final books = service.getAll();
    for (var book in books) {
      print(book);
    }
  }

  void _getById(BookService service) {
    // Funcion para buscar un libro por ID
    stdout.write('ID: ');
    final id = int.parse(stdin.readLineSync()!);

    final book = service.getById(id);
    print(book);
  }

  void _search(BookService service) {
    // Funcion para buscar libros por título
    stdout.write('Título a buscar: ');
    final title = stdin.readLineSync()!;

    final results = service.searchByTitle(title);
    for (var book in results) {
      print(book);
    }
  }

  void _update(BookService service) {
    // Funcion para actualizar un libro
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
    // Funcion para eliminar un libro
    stdout.write('ID: ');
    final id = int.parse(stdin.readLineSync()!);

    service.delete(id);
    print('Libro eliminado');
  }

  final service = BookService(
    BookRepository(),
  ); // Instancia del servicio de libros

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
          _createBook(service); // Crear libro
          break;
        case '2':
          _listBooks(service); // Listar libros
          break;
        case '3':
          _getById(service); // Buscar por ID
          break;
        case '4':
          _search(service); // Buscar por título
          break;
        case '5':
          _update(service); // Actualizar libro
          break;
        case '6':
          _delete(service); // Eliminar libro
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
