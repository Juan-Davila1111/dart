import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/user_model.dart';

abstract class UserLocalDataSource {
  Future<List<UserModel>> getUsers();
  Future<UserModel?> getUserByEmail(String email);
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  @override
  Future<List<UserModel>> getUsers() async {
    final String response =
        await rootBundle.loadString('assets/mock/users.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => UserModel.fromJson(json)).toList();
  }

  @override
  Future<UserModel?> getUserByEmail(String email) async {
    final users = await getUsers();
    try {
      return users.firstWhere((user) => user.email == email);
    } catch (e) {
      return null;
    }
  }
}
