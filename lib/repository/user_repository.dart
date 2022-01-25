import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vpfut/services/auth_service.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';
import '../utils/constants.dart';

class UserRepository with ChangeNotifier {
  final List<User> _users = [];

  final AuthService authService;

  Uri _getApiUrl() {
    return Uri.https(
      URL_API,
      '/users.json',
      {'auth': authService.usuario!.token},
    );
  }

  UserRepository(this.authService);

  List<User> get users => UnmodifiableListView(_users);

  Future<User> searchById(String id) async {
    await loadUsers();
    return _users.firstWhere((user) => user.id == id);
  }

  loadUsers() async {
    if (authService.logado) {
      final resp = await http.get(_getApiUrl());

      final data = json.decode(resp.body);

      data.forEach((key, value) {
        value['id'] = key;
        _users.add(User.fromJson(value));
      });

      notifyListeners();
    }

    print('Usuários carregados');
    print(_users);
  }

  Future _saveUser(User user) async {
    final resp = await http.post(_getApiUrl(), body: user.toJson());

    return resp.body;
  }

  Future<User> saveUser(User user) async {
    final data = await _saveUser(user);

    final User userSaved = User.fromJson(data);

    _users.add(userSaved);

    notifyListeners();

    return userSaved;
  }
}
