import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vpfut/services/auth_service.dart';

class Auth extends StatefulWidget {
  static const routeName = '/auth';

  const Auth({Key? key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  var novoUsuario = false;
  var email = '';
  var senha = '';
  var confirmacaoSenha = '';
  var ocultarSenha = true;
  final formKey = GlobalKey<FormState>();
  var processando = false;
  var erro = '';

  mudaNovoUsuario() {
    setState(() {
      novoUsuario = !novoUsuario;
    });
  }

  mudaOcultarSenha() {
    setState(() {
      ocultarSenha = !ocultarSenha;
    });
  }

  submeter(AuthService servicoAutenticacao) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      setState(() {
        processando = true;
        erro = '';
      });

      try {
        if (novoUsuario) {
          await servicoAutenticacao.signUp(email, senha);
        } else {
          await servicoAutenticacao.signIn(email, senha);
        }
      } catch (e) {
        setState(() {
          erro = e.toString();
        });
      }
      setState(() {
        processando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final servicoAutenticacao =
        Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sistema de monitoramento marinho'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _CustomForm(
                label: "Email",
                hint: "Digite seu email",
                icon: const Icon(Icons.email),
                save: (text) {
                  setState(() {
                    email = text ?? '';
                  });
                },
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "Não pode ser vazio";
                  }
                  if (!text.contains('@') || !text.contains('.')) {
                    return "Digite um email válido";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              _CustomForm(
                label: "senha",
                hint: "Digite a sua senha",
                icon: const Icon(Icons.vpn_key),
                obscureText: ocultarSenha,
                sufixIcon: IconButton(
                  icon: Icon(
                      ocultarSenha ? Icons.visibility : Icons.visibility_off),
                  onPressed: mudaOcultarSenha,
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "Não pode ser vazio";
                  }
                  if (text.length < 6) {
                    return "A senha necessita de no mínimo 6 caracteres";
                  }
                  if (novoUsuario && senha != confirmacaoSenha) {
                    return "As senhas não são iguais";
                  }
                  return null;
                },
                save: (text) {
                  setState(() {
                    senha = text ?? '';
                  });
                },
                onChanged: (text) {
                  setState(() {
                    senha = text ?? '';
                  });
                },
              ),
              if (novoUsuario) const SizedBox(height: 8),
              if (novoUsuario)
                _CustomForm(
                    label: "Confirmação da senha",
                    hint: "Digite a senha novamente",
                    icon: const Icon(Icons.vpn_key),
                    obscureText: ocultarSenha,
                    sufixIcon: IconButton(
                      icon: Icon(
                        ocultarSenha ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: mudaOcultarSenha,
                    ),
                    validator: (text) {
                      if (novoUsuario) {
                        if (text == null || text.isEmpty) {
                          return "Não pode ser vazio";
                        }
                        if (text.length < 6) {
                          return "A senha necessita de no mínimo 6 caracteres";
                        }
                        if (senha != confirmacaoSenha) {
                          return "As senhas não são iguais";
                        }
                      }
                      return null;
                    },
                    onChanged: (text) {
                      setState(() {
                        confirmacaoSenha = text ?? '';
                      });
                    }),
              const SizedBox(height: 20),
              processando
                  ? const CircularProgressIndicator()
                  : Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            submeter(servicoAutenticacao);
                          },
                          child: Text(novoUsuario ? "Cadastrar" : "Login"),
                        ),
                        TextButton(
                          onPressed: mudaNovoUsuario,
                          child: Text(novoUsuario ? "Login" : "Novo usuário"),
                        ),
                      ],
                    ),
              if (erro.isNotEmpty) const SizedBox(height: 50),
              if (erro.isNotEmpty)
                Text(
                  erro,
                  style: const TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomForm extends StatelessWidget {
  final String label;
  final String hint;
  final Icon? icon;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Function(String?)? save;
  final Function(String?)? onChanged;
  final bool obscureText;
  final Widget? sufixIcon;

  const _CustomForm({
    Key? key,
    required this.label,
    required this.hint,
    this.icon,
    this.keyboardType,
    this.validator,
    this.save,
    this.onChanged,
    this.obscureText = false,
    this.sufixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onSaved: save,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: sufixIcon,
        prefixIcon: icon,
        labelText: label,
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
