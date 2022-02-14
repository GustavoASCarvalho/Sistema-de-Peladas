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

  User? setUser(User user) {
    _user = user;
    notifyListeners();
    return _user;
  }

  Future<User?> _signUpOrIn(
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
          'displayName': name,
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

    _loggedIn = true;
    notifyListeners();

    return _user;
  }

  Future<User?> signUp(
    String email,
    String senha,
    String name,
    String phone,
    String cpf,
    String cnpj,
  ) =>
      _signUpOrIn(
        email,
        senha,
        name: name,
        phone: phone,
        cpf: cpf,
        cnpj: cnpj,
        register: true,
      );

  Future<User?> signIn(
    String email,
    String senha,
  ) =>
      _signUpOrIn(
        email,
        senha,
      );

  logout() {
    _user = null;
    _loggedIn = false;

    notifyListeners();
  }
}
