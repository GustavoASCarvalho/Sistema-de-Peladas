import 'package:flutter/material.dart';
import 'package:vpfut/utils/constants.dart';

class Body extends StatelessWidget {
  const Body(
      {Key? key,
      required this.imageUrl,
      required this.description,
      required this.title})
      : super(key: key);
  final String imageUrl;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          SizedBox(height: size.height * 0.05),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                  height: size.height * 0.3,
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: size.height * 0.15,
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Quadra do João',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: kPrimaryLightColor,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: size.height * 0.15,
                          width: size.width * 0.8,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: kPrimaryLightColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                            ),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Rua dos bobos nº 0',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  'Aberto das 8h às 22h, todos os dias',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          Row(
            children: [
              Container(
                height: size.height * 0.2,
                width: size.width * 0.4,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Quarta \n(11:25 - 12:25)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: kPrimaryLightColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Jogo marcado por: João',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: kPrimaryLightColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                height: size.height * 0.2,
                width: size.width * 0.4,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Quarta \n(12:30 - 13:30)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: kPrimaryLightColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: size.width * 0.4,
                        height: size.height * 0.05,
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Marcar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.03),
          Row(
            children: [
              Container(
                height: size.height * 0.2,
                width: size.width * 0.4,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Quarta \n(13:35 - 14:35)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: kPrimaryLightColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: size.width * 0.4,
                        height: size.height * 0.05,
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Marcar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                height: size.height * 0.2,
                width: size.width * 0.4,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Quarta \n(14:40 - 15:40)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: kPrimaryLightColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Jogo marcado por: Nathan',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: kPrimaryLightColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.03),
          Row(
            children: [
              Container(
                height: size.height * 0.2,
                width: size.width * 0.4,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Quarta \n(15:45 - 16:45)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: kPrimaryLightColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Jogo marcado por: Guilherme',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: kPrimaryLightColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
