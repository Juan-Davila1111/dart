import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/user_local_data_source.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final UserLocalDataSource localDataSource;
  final SharedPreferences sharedPreferences;

  AuthRepositoryImpl(this.localDataSource, this.sharedPreferences);

  @override
  Future<User?> login(String email, String password) async {
    final user = await localDataSource.getUserByEmail(email);
    if (user != null && user.password == password) {
      await sharedPreferences.setString('currentUser', jsonEncode(user.toJson()));
      return user;
    }
    return null;
  }

  @override
  Future<void> logout() async {
    await sharedPreferences.remove('currentUser');
  }

  @override
  Future<User?> getCurrentUser() async {
    final userJson = sharedPreferences.getString('currentUser');
    if (userJson != null) {
      return UserModel.fromJson(jsonDecode(userJson));
    }
    return null;
  }
}
