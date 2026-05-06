import '../core/interfaces/services/Book.dart';
import '../core/models/Book.dart';
import '../core/utils/AppException.dart';
import '../repositories/BookRepository.dart';

class BookService implements IBookService {
  final BookRepository _repository;

  BookService(this._repository);

  @override
  void createBook(String title, String author, int year) {
    try {
      final book = Book(title, author, year);
      Book.validate(book);
      _repository.create(book);
    } catch (e) {
      throw AppException('Error al crear el libro: $e');
    }
  }

  @override
  Book getById(int id) {
    try {
      return _repository.getById(id);
    } catch (e) {
      throw AppException('Error al obtener el libro: $e');
    }
  }

  @override
  List<Book> getAll() {
    try {
      return _repository.getAll();
    } catch (e) {
      throw AppException('Error al listar los libros: $e');
    }
  }

  @override
  List<Book> searchByTitle(String title) {
    try {
      if (title.trim().isEmpty) {
        throw AppException('El término de búsqueda no puede estar vacío');
      }

      return _repository.searchByTitle(title);
    } catch (e) {
      throw AppException('Error al buscar libros: $e');
    }
  }

  @override
  void update(int id, String title, String author, int year) {
    try {
      final updatedBook = Book(title, author, year);
      Book.validate(updatedBook);
      _repository.update(id, updatedBook);
    } catch (e) {
      throw AppException('Error al actualizar el libro: $e');
    }
  }

  @override
  void delete(int id) {
    try {
      _repository.delete(id);
    } catch (e) {
      throw AppException('Error al eliminar el libro: $e');
    }
  }
}