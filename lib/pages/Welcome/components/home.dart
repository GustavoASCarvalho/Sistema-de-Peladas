import 'package:flutter/material.dart';

import '../../../constants.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          width: size.width * 0.8,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Entrar',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              style: TextButton.styleFrom(
                backgroundColor: kPrimaryColor,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        SizedBox(
          width: size.width * 0.8,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Registrar',
                style: TextStyle(color: kPrimaryColor, fontSize: 18),
              ),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: kPrimaryColor,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
