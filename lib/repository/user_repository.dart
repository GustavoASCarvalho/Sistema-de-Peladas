import 'dart:collection';
import 'dart:convert';
import 'dart:developer';

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

  Future<User> searchByEmail(String email) async {
    return _users.firstWhere((user) => user.email == email);
  }

  loadUsers() async {
    _users.clear();
    if (authService.logado) {
      final resp = await http.get(_getApiUrl());

      final data = json.decode(resp.body);
      data.forEach((key, value) {
        value['id'] = key;
        _users.add(User.fromMap(value));
      });

      notifyListeners();
    }

    print('Usuários carregados -> ${_users.length}');
    print(_users);
  }

  Future<User> saveUser(User user) async {
    final resp = await http.post(_getApiUrl(), body: user.toJson());

    return user;
  }
}
