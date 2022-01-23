import 'package:flutter/material.dart';
import 'package:vpfut/components/text_field_container.dart';
import 'package:vpfut/utils/constants.dart';

class TimePicker extends StatefulWidget {
  final Function()? onPressed;
  final String text;
  const TimePicker({Key? key, this.onPressed, required this.text})
      : super(key: key);

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: Row(
        children: [
          Text(
            widget.text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          TextButton(
            onPressed: widget.onPressed,
            child: const Icon(
              Icons.watch_later,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
