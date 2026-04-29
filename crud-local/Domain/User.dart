class User {
  String _name;

  User(String name) : _name = _validateName(name);

  String get name => _name;

  set name(String value) {
    _name = _validateName(value);
  }

  static String _validateName(String name) {
    if (name.trim().isEmpty) {
      throw Exception("El nombre no puede estar vacío.");
    }
    if (name.trim().length < 3) {
      throw Exception("El nombre debe tener al menos 3 caracteres.");
    }
    return name.trim();
  }

  @override
  String toString() => _name;
}