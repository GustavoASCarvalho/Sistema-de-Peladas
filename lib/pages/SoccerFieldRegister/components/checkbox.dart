import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vpfut/utils/constants.dart';

class LinkedLabelCheckbox extends StatelessWidget {
  const LinkedLabelCheckbox({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.75,
      child: Row(
        children: <Widget>[
          Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: kPrimaryColor,
            ),
            child: Checkbox(
              checkColor: kPrimaryLightColor,
              activeColor: kPrimaryColor,
              value: value,
              onChanged: (bool? newValue) {
                onChanged(newValue!);
              },
            ),
          ),
          RichText(
            text: TextSpan(
              text: label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  debugPrint('Label has been tapped.');
                },
            ),
          ),
        ],
      ),
    );
  }
}
