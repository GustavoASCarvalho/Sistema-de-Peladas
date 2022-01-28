import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vpfut/components/rounded_button.dart';
import 'package:vpfut/components/rounded_input_field.dart';
import 'package:vpfut/pages/SoccerFieldRegister/components/time_picker.dart';
import 'package:vpfut/services/auth_service.dart';
import 'package:vpfut/utils/constants.dart';

import 'checkbox.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _name = '';
  var _description = '';
  var _address = '';
  var _url = '';
  var _isLoading = false;
  var _errorMessage = '';
  //intervalo de cada partida
  var _interval = 0;
  //tempo entre partidas
  var _timeBetween = 0;

  var _segunda = false;
  var _segundaBegin = TimeOfDay(hour: 8, minute: 30);
  var _segundaEnd = TimeOfDay(hour: 18, minute: 30);

  var _terca = false;
  var _tercaBegin = TimeOfDay(hour: 8, minute: 30);
  var _tercaEnd = TimeOfDay(hour: 18, minute: 30);

  var _quarta = false;
  var _quartaBegin = TimeOfDay(hour: 8, minute: 30);
  var _quartaEnd = TimeOfDay(hour: 18, minute: 30);

  var _quinta = false;
  var _quintaBegin = TimeOfDay(hour: 8, minute: 30);
  var _quintaEnd = TimeOfDay(hour: 18, minute: 30);

  var _sexta = false;
  var _sextaBegin = TimeOfDay(hour: 8, minute: 30);
  var _sextaEnd = TimeOfDay(hour: 18, minute: 30);

  var _sabado = false;
  var _sabadoBegin = TimeOfDay(hour: 8, minute: 30);
  var _sabadoEnd = TimeOfDay(hour: 18, minute: 30);

  var _domingo = false;
  var _domingoBegin = TimeOfDay(hour: 8, minute: 30);
  var _domingoEnd = TimeOfDay(hour: 18, minute: 30);

  submit(AuthService authService) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
        _errorMessage = '';
      });
      try {
        Navigator.of(context).pop();
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
                    labelText: "Nome",
                    hintText: "quadra poliesportiva",
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
                        return 'Por favor digite o nome da quadra';
                      }
                      if (value.length < 3) {
                        return 'Por favor digite um nome válido';
                      }
                      return null;
                    },
                  ),
            _isLoading
                ? const SizedBox()
                : RoundedInputField(
                    labelText: "Endereço",
                    hintText: "Rua dos bobos, nº 0",
                    icon: Icons.location_on,
                    onChanged: (value) {
                      setState(() {
                        _address = value ?? '';
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        _address = value ?? '';
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor digite o endereço';
                      }
                      if (value.length < 5) {
                        return 'Por favor digite um endereço válido';
                      }
                      return null;
                    },
                  ),
            _isLoading
                ? const SizedBox()
                : RoundedInputField(
                    labelText: "Descrição",
                    hintText:
                        "Quadra de futebol, aberta todos os dias das 18h às 22h",
                    icon: Icons.description,
                    onChanged: (value) {
                      setState(() {
                        _description = value ?? '';
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        _description = value ?? '';
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor digite o endereço';
                      }
                      if (value.length < 5) {
                        return 'Por favor digite um endereço válido';
                      }
                      return null;
                    },
                  ),
            _isLoading
                ? const SizedBox()
                : RoundedInputField(
                    labelText: "Url da imagem da quadra",
                    hintText:
                        "https://images.com/6ef6e892aea640c3b1f79f0f820caca5",
                    icon: Icons.image,
                    onChanged: (value) {
                      setState(() {
                        _url = value ?? '';
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        _url = value ?? '';
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor digite uma url';
                      }
                      if (!value.startsWith('http://') ||
                          !value.startsWith('https://')) {
                        return 'Por favor digite uma url válida';
                      }
                      return null;
                    },
                  ),
            _isLoading
                ? const SizedBox()
                : const Text(
                    " Dia e horário de funcionamento",
                    style: TextStyle(
                      backgroundColor: kPrimaryColor,
                      color: kPrimaryLightColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            _isLoading
                ? const SizedBox()
                : LinkedLabelCheckbox(
                    label: 'Segunda',
                    value: _segunda,
                    onChanged: (bool newValue) {
                      setState(() {
                        _segunda = newValue;
                      });
                    },
                  ),
            _isLoading
                ? const SizedBox()
                : _segunda
                    ? Column(
                        children: [
                          TimePicker(
                            onPressed: () {
                              showTimePicker(
                                context: context,
                                initialTime: _segundaBegin,
                              ).then((value) {
                                setState(() {
                                  _segundaBegin = value!;
                                });
                              });
                            },
                            text:
                                'Início: ${_segundaBegin.hour}:${_segundaBegin.minute}',
                          ),
                          TimePicker(
                            onPressed: () {
                              showTimePicker(
                                context: context,
                                initialTime: _segundaBegin,
                              ).then((value) {
                                setState(() {
                                  _segundaBegin = value!;
                                });
                              });
                            },
                            text:
                                'Fim: ${_segundaEnd.hour}:${_segundaEnd.minute}',
                          ),
                        ],
                      )
                    : const SizedBox(),
            _isLoading
                ? const SizedBox()
                : LinkedLabelCheckbox(
                    label: 'Terça',
                    value: _terca,
                    onChanged: (bool newValue) {
                      setState(() {
                        _terca = newValue;
                      });
                    },
                  ),
            _isLoading
                ? const SizedBox()
                : _terca
                    ? Column(
                        children: [
                          TimePicker(
                            onPressed: () {
                              showTimePicker(
                                context: context,
                                initialTime: _tercaBegin,
                              ).then((value) {
                                setState(() {
                                  _tercaBegin = value!;
                                });
                              });
                            },
                            text:
                                'Início: ${_tercaBegin.hour}:${_tercaBegin.minute}',
                          ),
                          TimePicker(
                            onPressed: () {
                              showTimePicker(
                                context: context,
                                initialTime: _tercaBegin,
                              ).then((value) {
                                setState(() {
                                  _tercaBegin = value!;
                                });
                              });
                            },
                            text: 'Fim: ${_tercaEnd.hour}:${_tercaEnd.minute}',
                          ),
                        ],
                      )
                    : const SizedBox(),
            _isLoading
                ? const SizedBox()
                : LinkedLabelCheckbox(
                    label: 'Quarta',
                    value: _quarta,
                    onChanged: (bool newValue) {
                      setState(() {
                        _quarta = newValue;
                      });
                    },
                  ),
            _isLoading
                ? const SizedBox()
                : _quarta
                    ? Column(
                        children: [
                          TimePicker(
                            onPressed: () {
                              showTimePicker(
                                context: context,
                                initialTime: _quartaBegin,
                              ).then((value) {
                                setState(() {
                                  _quartaBegin = value!;
                                });
                              });
                            },
                            text:
                                'Início: ${_quartaBegin.hour}:${_quartaBegin.minute}',
                          ),
                          TimePicker(
                            onPressed: () {
                              showTimePicker(
                                context: context,
                                initialTime: _quartaBegin,
                              ).then((value) {
                                setState(() {
                                  _quartaBegin = value!;
                                });
                              });
                            },
                            text:
                                'Fim: ${_quartaEnd.hour}:${_quartaEnd.minute}',
                          ),
                        ],
                      )
                    : const SizedBox(),
            _isLoading
                ? const SizedBox()
                : LinkedLabelCheckbox(
                    label: 'Quinta',
                    value: _quinta,
                    onChanged: (bool newValue) {
                      setState(() {
                        _quinta = newValue;
                      });
                    },
                  ),
            _isLoading
                ? const SizedBox()
                : _quinta
                    ? Column(
                        children: [
                          TimePicker(
                            onPressed: () {
                              showTimePicker(
                                context: context,
                                initialTime: _quintaBegin,
                              ).then((value) {
                                setState(() {
                                  _quintaBegin = value!;
                                });
                              });
                            },
                            text:
                                'Início: ${_quintaBegin.hour}:${_quintaBegin.minute}',
                          ),
                          TimePicker(
                            onPressed: () {
                              showTimePicker(
                                context: context,
                                initialTime: _quintaBegin,
                              ).then((value) {
                                setState(() {
                                  _quintaBegin = value!;
                                });
                              });
                            },
                            text:
                                'Fim: ${_quintaEnd.hour}:${_quintaEnd.minute}',
                          ),
                        ],
                      )
                    : const SizedBox(),
            _isLoading
                ? const SizedBox()
                : LinkedLabelCheckbox(
                    label: 'Sexta',
                    value: _sexta,
                    onChanged: (bool newValue) {
                      setState(() {
                        _sexta = newValue;
                      });
                    },
                  ),
            _isLoading
                ? const SizedBox()
                : _sexta
                    ? Column(
                        children: [
                          TimePicker(
                            onPressed: () {
                              showTimePicker(
                                context: context,
                                initialTime: _sextaBegin,
                              ).then((value) {
                                setState(() {
                                  _sextaBegin = value!;
                                });
                              });
                            },
                            text:
                                'Início: ${_sextaBegin.hour}:${_sextaBegin.minute}',
                          ),
                          TimePicker(
                            onPressed: () {
                              showTimePicker(
                                context: context,
                                initialTime: _sextaBegin,
                              ).then((value) {
                                setState(() {
                                  _sextaBegin = value!;
                                });
                              });
                            },
                            text: 'Fim: ${_sextaEnd.hour}:${_sextaEnd.minute}',
                          ),
                        ],
                      )
                    : const SizedBox(),
            _isLoading
                ? const SizedBox()
                : LinkedLabelCheckbox(
                    label: 'Sábado',
                    value: _sabado,
                    onChanged: (bool newValue) {
                      setState(() {
                        _sabado = newValue;
                      });
                    },
                  ),
            _isLoading
                ? const SizedBox()
                : _sabado
                    ? Column(
                        children: [
                          TimePicker(
                            onPressed: () {
                              showTimePicker(
                                context: context,
                                initialTime: _sabadoBegin,
                              ).then((value) {
                                setState(() {
                                  _sabadoBegin = value!;
                                });
                              });
                            },
                            text:
                                'Início: ${_sabadoBegin.hour}:${_sabadoBegin.minute}',
                          ),
                          TimePicker(
                            onPressed: () {
                              showTimePicker(
                                context: context,
                                initialTime: _sabadoBegin,
                              ).then((value) {
                                setState(() {
                                  _sabadoBegin = value!;
                                });
                              });
                            },
                            text:
                                'Fim: ${_sabadoEnd.hour}:${_sabadoEnd.minute}',
                          ),
                        ],
                      )
                    : const SizedBox(),
            _isLoading
                ? const SizedBox()
                : LinkedLabelCheckbox(
                    label: 'Domingo',
                    value: _domingo,
                    onChanged: (bool newValue) {
                      setState(() {
                        _domingo = newValue;
                      });
                    },
                  ),
            _isLoading
                ? const SizedBox()
                : _domingo
                    ? Column(
                        children: [
                          TimePicker(
                            onPressed: () {
                              showTimePicker(
                                context: context,
                                initialTime: _domingoBegin,
                              ).then((value) {
                                setState(() {
                                  _domingoBegin = value!;
                                });
                              });
                            },
                            text:
                                'Início: ${_domingoBegin.hour}:${_domingoBegin.minute}',
                          ),
                          TimePicker(
                            onPressed: () {
                              showTimePicker(
                                context: context,
                                initialTime: _domingoBegin,
                              ).then((value) {
                                setState(() {
                                  _domingoBegin = value!;
                                });
                              });
                            },
                            text:
                                'Fim: ${_domingoEnd.hour}:${_domingoEnd.minute}',
                          ),
                        ],
                      )
                    : const SizedBox(),
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
            SizedBox(height: size.height * 0.1),
          ],
        ),
      ),
    );
  }
}
