import 'package:flutter/material.dart';
import 'package:vpfut/utils/constants.dart';

import '../../../components/rounded_button.dart';

class SoccerFieldBox extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String address;
  final String date;

  const SoccerFieldBox({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.address,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width,
        height: size.width,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: size.width * 0.65,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    //imagem da url
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.width * 0.65,
              left: 0,
              right: 0,
              height: size.width * 0.35,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      address,
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(date),
                    RoundedButton(
                      text: 'Ver',
                      onPressed: () {},
                      textColor: kPrimaryLightColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
