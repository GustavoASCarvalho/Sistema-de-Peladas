import 'package:flutter/material.dart';
import 'package:vpfut/constants.dart';

import 'text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData icon;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final TextInputType? keyboardType;

  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.validator,
    this.onSaved,
    this.keyboardType,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        onChanged: onChanged,
        validator: validator,
        onSaved: onSaved,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.white),
          hintStyle: const TextStyle(
            color: Color.fromARGB(127, 255, 255, 255),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
