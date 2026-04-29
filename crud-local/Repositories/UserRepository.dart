import './../Domain/User.dart';

class UserRepository {
  final List<User> _users = [];

  void create(User user) {
    _users.add(user);
  }

  List<User> read() {
    return _users;
  }

  User? readOne(String name) {
    try {
      return _users.firstWhere(
        (user) => user.name.toLowerCase() == name.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }

  void updateByIndex(int index, String newName) {
    if (index < 0 || index >= _users.length) {
      throw Exception("Índice inválido.");
    }
    _users[index].name = newName;
  }

  void deleteByIndex(int index) {
    if (index < 0 || index >= _users.length) {
      throw Exception("Índice inválido.");
    }
    _users.removeAt(index);
  }
}
