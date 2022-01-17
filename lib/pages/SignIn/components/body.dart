import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vpfut/components/rounded_button.dart';
import 'package:vpfut/components/rounded_outline_button.dart';
import 'package:vpfut/services/auth_service.dart';

import 'rounded_input_field.dart';
import 'rounded_password_field.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _email = '';
  var _password = '';
  var _isLoading = false;
  var _errorMessage = '';

  submit(AuthService authService) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
        _errorMessage = '';
      });
      try {
        await authService.signIn(_email, _password);
      } catch (e) {
        setState(() {
          _errorMessage = e.toString();
        });
      }
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final authService = Provider.of<AuthService>(context, listen: false);
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.10),
            Image.asset(
              "assets/images/logo.png",
              width: size.width * 0.5,
            ),
            SizedBox(height: size.height * 0.05),
            _isLoading
                ? const CircularProgressIndicator()
                : RoundedInputField(
                    labelText: "Email",
                    hintText: "name@gmail.com",
                    icon: Icons.email,
                    onChanged: (value) {
                      setState(() {
                        _email = value ?? '';
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        _email = value ?? '';
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor digite um email';
                      }
                      if (!value.contains('@') || !value.contains('.')) {
                        return 'Por favor digite um email válido';
                      }
                      return null;
                    },
                  ),
            _isLoading
                ? Container()
                : RoundedPasswordField(
                    labelText: "Senha",
                    hintText: "********",
                    onChanged: (value) {
                      setState(() {
                        _password = value!;
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        _password = value!;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor digite uma senha';
                      }
                      if (value.length < 6) {
                        return 'Por favor digite uma senha com mais de 6 caracteres';
                      }
                      return null;
                    },
                  ),
            _errorMessage.isNotEmpty
                ? Text(
                    _errorMessage,
                    style: const TextStyle(color: Colors.red),
                  )
                : Container(),
            _isLoading
                ? Container()
                : RoundedButton(
                    text: "Entrar",
                    onPressed: () {
                      submit(authService);
                    },
                  ),
            _isLoading
                ? Container()
                : RoundedOutlineButton(
                    text: "Voltar",
                    onPressed: () {
                      Navigator.pop(context);
                    }),
          ],
        ),
      ),
    );
  }
}
