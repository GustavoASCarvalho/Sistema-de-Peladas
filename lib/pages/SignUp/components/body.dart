import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vpfut/components/rounded_button.dart';
import 'package:vpfut/components/rounded_outline_button.dart';
import 'package:vpfut/pages/SignIn/components/rounded_input_field.dart';
import 'package:vpfut/pages/SignIn/components/rounded_password_field.dart';
import 'package:vpfut/services/auth_service.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _email = '';
  var _password = '';
  var _name = '';
  var _phone = '';
  var _cpf = '';
  var _cnpj = '';
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
        await authService.signUp(_email, _password, _name, _phone, _cpf, _cnpj);
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
    return Form(
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
              : RoundedInputField(
                  labelText: "Nome",
                  hintText: "Fulano de Tal",
                  icon: Icons.person,
                  onChanged: (value) {
                    setState(() {
                      _name = value ?? '';
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      _name = value ?? '';
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor digite um nome';
                    }
                    if (value.length < 2) {
                      return 'Por favor digite um nome válido';
                    }
                    return null;
                  },
                ),
          _isLoading
              ? Container()
              : RoundedInputField(
                  labelText: "Telefone",
                  hintText: "41 99999-9999",
                  icon: Icons.phone,
                  keyboardType: TextInputType.phone,
                  onChanged: (value) {
                    setState(() {
                      _phone = value ?? '';
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      _phone = value ?? '';
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor digite um telefone';
                    }
                    if (value.length != 11 || !value.contains('9')) {
                      return 'Por favor digite um telefone válido';
                    }
                    return null;
                  },
                ),
          _isLoading
              ? Container()
              : RoundedInputField(
                  labelText: "CPF",
                  hintText: "000.000.000-00",
                  icon: Icons.badge,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      _cpf = value ?? '';
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      _cpf = value ?? '';
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor digite um CPF';
                    }
                    if (value.length != 11) {
                      return 'Por favor digite um CPF válido';
                    }
                    return null;
                  },
                ),
          _isLoading
              ? Container()
              : RoundedInputField(
                  labelText: "CNPJ",
                  hintText: "00.000.000/0000-00",
                  icon: Icons.business,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      _cnpj = value ?? '';
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      _cnpj = value ?? '';
                    });
                  },
                  validator: (value) {
                    if (value!.isNotEmpty && value.length != 14) {
                      return 'Por favor digite um CNPJ válido';
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
                      _password = value ?? '';
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      _password = value ?? '';
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor digite uma senha';
                    }
                    if (value.length < 6) {
                      return 'Sua senha deve ter no mínimo 6 caracteres';
                    }
                    return null;
                  },
                ),
          _isLoading
              ? Container()
              : RoundedPasswordField(
                  labelText: "Repetir Senha",
                  hintText: "********",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor digite uma senha';
                    }
                    if (value.length < 6) {
                      return 'Sua senha deve ter no mínimo 6 caracteres';
                    }
                    if (value != _password) {
                      return 'As senhas não conferem';
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
                  text: "Cadastrar",
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
          SizedBox(height: size.height * 0.05),
        ],
      ),
    );
  }
}
