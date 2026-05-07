class Book {
  String title;
  String author;
  int publicationYear;

  Book(this.title, this.author, this.publicationYear);

  static void validateTitle(String title) {
    // Función para validar el título del libro
    if (title.trim().isEmpty) {
      throw ArgumentError('El título no puede estar vacío');
    }
  }

  static void validateAuthor(String author) {
    // Función para validar el autor del libro
    if (author.trim().isEmpty) {
      throw ArgumentError('El autor no puede estar vacío');
    }
  }

  static void validatePublicationYear(int year) {
    // Función para validar el año de publicación del libro
    final currentYear = DateTime.now().year;
    if (year <= 0 || year > currentYear) {
      throw ArgumentError('El año debe estar entre 1 y $currentYear');
    }
  }

  static void validate(Book book) {
    validateTitle(book.title);
    validateAuthor(book.author);
    validatePublicationYear(book.publicationYear);
  }

  @override
  String toString() {
    return 'Book{title: $title, author: $author, publicationYear: $publicationYear}';
  }
}
