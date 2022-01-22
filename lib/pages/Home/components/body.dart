import 'package:flutter/material.dart';
import 'package:vpfut/pages/Home/components/soccer_field_box.dart';
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
            height: size.height * 0.15 - 27,
            child: Stack(
              children: <Widget>[
                Container(
                  height: size.height * 0.15 - 27,
                  decoration: const BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
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
                          fontSize: 23,
                          color: kPrimaryLightColor,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: " SUA PELADA! ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor,
                              backgroundColor: kPrimaryLightColor,
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
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: const <Widget>[
                SoccerFieldBox(
                  imageUrl:
                      'https://pantelas.com.br/wp-content/uploads/2016/12/quadra-de-futebol-society-2.jpg',
                  address: 'Rua dos bobos',
                  date: 'Aberto das 10:00 às 20:00',
                  title: 'Quadra do joão',
                ),
                SoccerFieldBox(
                  imageUrl:
                      'https://jundiai.sp.gov.br/noticias/wp-content/uploads/sites/32/2017/11/dal_santo_futebol-40.jpg',
                  address: 'Rua da praça',
                  date: 'Aberto das 12:00 às 19:00',
                  title: 'Fitiep',
                ),
                SoccerFieldBox(
                  imageUrl:
                      'https://wallau.com.br/wp-content/uploads/2019/01/quadras-de-futebol-7-e-5.jpg',
                  address: 'Av. Atlantica',
                  date: 'Aberto das 20:00 às 22:00',
                  title: 'Sesc',
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        )
      ],
    );
  }
}
