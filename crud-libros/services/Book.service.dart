import '../core/interfaces/services/Book.dart';
import '../core/models/Book.dart';
import '../core/utils/AppException.dart';
import '../repositories/BookRepository.dart';
import '../core/utils/SafeTryCatch.dart';

class BookService implements IBookService {
  final BookRepository _repository;

  BookService(this._repository);

  @override
  void createBook(String title, String author, int year) {
    execute(() {
      final book = _buildValidatedBook(title, author, year);
      _repository.create(book);
    }, 'crear el libro');
  }

  @override
  Book getById(int id) {
    return execute(
      () => _repository.getById(id),
      'obtener el libro',
    );
  }

  @override
  List<Book> getAll() {
    return execute(
      () => _repository.getAll(),
      'listar los libros',
    );
  }

  @override
  List<Book> searchByTitle(String title) {
    return execute(() {
      if (title.trim().isEmpty) {
        throw AppException(
          'El término de búsqueda no puede estar vacío',
        );
      }

      return _repository.searchByTitle(title.trim());
    }, 'buscar libros');
  }

  @override
  void update(int id, String title, String author, int year) {
    execute(() {
      final updatedBook = _buildValidatedBook(
        title,
        author,
        year,
      );

      _repository.update(id, updatedBook);
    }, 'actualizar el libro');
  }

  @override
  void delete(int id) {
    execute(() {
      _repository.delete(id);
    }, 'eliminar el libro');
  }

  Book _buildValidatedBook(
    String title,
    String author,
    int year,
  ) {
    final book = Book(title.trim(), author.trim(), year);

    Book.validate(book);

    return book;
  }
}