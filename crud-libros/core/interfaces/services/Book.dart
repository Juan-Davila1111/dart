import '../../models/Book.dart';

abstract class IBookService {
  void createBook(String title, String author, int year);

  Book getById(int id);

  List<Book> getAll();

  List<Book> searchByTitle(String title);

  void update(int id, String title, String author, int year);

  void delete(int id);
}