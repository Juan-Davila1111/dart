import '../../models/Book.dart';

abstract class IBookRepository {
  int create(Book book);

  Book getById(int id);

  List<Book> getAll();

  List<Book> searchByTitle(String title);

  void update(int id, Book book);

  void delete(int id);
}