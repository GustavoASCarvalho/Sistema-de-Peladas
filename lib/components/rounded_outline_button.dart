import 'package:flutter/material.dart';
import 'package:vpfut/utils/constants.dart';

class RoundedOutlineButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final Color textColor, outlineColor;

  const RoundedOutlineButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.textColor = kPrimaryColor,
    this.outlineColor = kPrimaryColor,
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
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10,
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: outlineColor,
                width: 1,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}
