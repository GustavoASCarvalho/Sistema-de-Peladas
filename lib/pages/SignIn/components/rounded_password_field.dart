import 'package:flutter/material.dart';
import 'package:vpfut/constants.dart';

import 'text_field_container.dart';

class RoundedPasswordField extends StatefulWidget {
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final String hintText;
  const RoundedPasswordField({
    Key? key,
    this.onChanged,
    this.validator,
    this.onSaved,
    required this.hintText,
  }) : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _obscureText = true;

  toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        obscureText: _obscureText,
        validator: widget.validator,
        onSaved: widget.onSaved,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.white),
          icon: const Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: IconButton(
            onPressed: toggleObscureText,
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
            ),
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
