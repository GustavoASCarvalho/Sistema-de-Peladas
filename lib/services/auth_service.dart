import 'dart:developer';

import 'package:vpfut/repository/user_repository.dart';

import '../models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService with ChangeNotifier {
  static const _url = 'identitytoolkit.googleapis.com';
  static const _apiKey = 'AIzaSyCftbWRnr_cb6_XYZt0nu8_fu8i9MEXDVg';

  User? _user;
  bool _loggedIn = false;

  User? get usuario => _user;
  bool get logado => _loggedIn;

  Future<void> _signUpOrIn(
    UserRepository userRepository,
    String email,
    String password, {
    bool register = false,
    String name = '',
    String phone = '',
    String cpf = '',
    String cnpj = '',
  }) async {
    var endPoint = '';

    if (register) {
      endPoint = '/v1/accounts:signUp';
    } else {
      endPoint = '/v1/accounts:signInWithPassword';
    }

    final url = Uri.https(_url, endPoint, {'key': _apiKey});

    final resp = await http.post(
      url,
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );

    final data = json.decode(resp.body);

    if (resp.statusCode == 400) {
      var msg = '';
      if (register) {
        if (data['error']['message'] == 'EMAIL_EXISTS') {
          msg = 'E-mail já cadastrado!';
        } else {
          msg = 'Erro!';
        }
      } else {
        msg = 'Usuário e/ou senha inválidos';
      }

      throw Exception(msg);
    }

    if (register) {
      _user = User(
        id: data['localId'],
        email: email,
        name: name,
        phone: phone,
        token: data['idToken'],
        cpf: cpf,
        cnpj: cnpj,
        expiraEm: DateTime.now().add(
          Duration(
            seconds: int.parse(data['expiresIn']),
          ),
        ),
      );

      await userRepository.saveUser(_user!);
    } else {
      _user = await userRepository.searchById(data['localId']);
    }

    print(_user);

    _loggedIn = true;

    debugPrint('logou');
    debugPrint(_user!.toString());

    notifyListeners();
  }

  Future<void> signUp(
    String email,
    String senha,
    String name,
    String phone,
    String cpf,
    String cnpj,
    UserRepository userRepository,
  ) =>
      _signUpOrIn(
        userRepository,
        email,
        senha,
        name: name,
        phone: phone,
        cpf: cpf,
        cnpj: cnpj,
        register: true,
      );

  Future<void> signIn(
    String email,
    String senha,
    UserRepository userRepository,
  ) =>
      _signUpOrIn(
        userRepository,
        email,
        senha,
      );

  logout() {
    _user = null;
    _loggedIn = false;
    print('saiu');
    notifyListeners();
  }
}
