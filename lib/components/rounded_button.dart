import 'package:flutter/material.dart';
import 'package:vpfut/utils/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color color, textColor;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: 18),
          ),
          style: TextButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
          ),
        ),
      ),
    );
  }
}
