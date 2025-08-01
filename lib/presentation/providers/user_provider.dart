import 'package:flutter/material.dart';
import 'package:my_app/data/models/user.dart';
import 'package:my_app/data/datasources/user_datasource.dart';

class UserProvider extends ChangeNotifier {
  final UserDataSource _dataSource = UserDataSource();
  List<User> users = [];
  bool _loggedIn = false;

  bool isLoading = false;
  bool get isLoggedIn => _loggedIn;

  void login() {
    _loggedIn = true;
    notifyListeners();
  }

  void logout() {
    _loggedIn = false;
    notifyListeners();
  }

  Future<void> loadUsers() async {
    isLoading = true;
    notifyListeners();
    users = await _dataSource.fetchUsers();
    isLoading = false;
    notifyListeners();
  }
}
