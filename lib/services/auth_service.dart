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

  Future<void> _signUpOrIn(String email, String password,
      {bool register = false}) async {
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

    _user = User(
      id: data['localId'],
      email: email,
      name: 'gusteavop',
      phone: '+5511999999999',
      token: data['idToken'],
      expiraEm: DateTime.now().add(
        Duration(
          seconds: int.parse(data['expiresIn']),
        ),
      ),
    );

    _loggedIn = true;

    notifyListeners();
  }

  Future<void> signUp(String email, String senha) => _signUpOrIn(
        email,
        senha,
        register: true,
      );

  Future<void> signIn(String email, String senha) => _signUpOrIn(
        email,
        senha,
      );

  logout() {
    _user = null;
    _loggedIn = false;
    notifyListeners();
  }
}
