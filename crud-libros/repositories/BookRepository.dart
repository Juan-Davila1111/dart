import '../core/interfaces/repositories/Book.dart';
import '../core/models/Book.dart';
import '../core/utils/AppException.dart';

class BookRepository implements IBookRepository {
  final Map<int, Book> _books = {};
  int _currentId = 0;

  @override
  int create(Book book) {
    Book.validate(book);

    _currentId++;
    _books[_currentId] = book;

    return _currentId;
  }

  @override
  Book getById(int id) {
    final book = _books[id];

    if (book == null) {
      throw AppException('No existe un libro con id $id');
    }

    return book;
  }

  @override
  List<Book> getAll() {
    return _books.values.toList();
  }

  @override
  List<Book> searchByTitle(String title) {
    if (title.trim().isEmpty) {
      throw AppException('El término de búsqueda no puede estar vacío');
    }

    return _books.values
        .where((book) => book.title.toLowerCase().contains(title.toLowerCase()))
        .toList();
  }

  @override
  void update(int id, Book updatedBook) {
    if (!_books.containsKey(id)) {
      throw AppException('No existe un libro con id $id');
    }

    Book.validate(updatedBook);
    _books[id] = updatedBook;
  }

  @override
  void delete(int id) {
    if (!_books.containsKey(id)) {
      throw AppException('No existe un libro con id $id');
    }

    _books.remove(id);
  }
}
