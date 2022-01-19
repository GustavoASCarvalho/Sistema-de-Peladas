import 'package:flutter/material.dart';
import 'package:vpfut/utils/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Center(
          child: SizedBox(
            height: size.height * 0.15,
            child: Stack(
              children: <Widget>[
                Container(
                  height: size.height * 0.15 - 27,
                  decoration: const BoxDecoration(
                    color: kPrimaryLightColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(36),
                      bottomRight: Radius.circular(36),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.15 - 40,
                  child: Center(
                    child: RichText(
                      text: const TextSpan(
                        text: 'Agende já ',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "SUA PELADA!",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
