import 'package:flutter/material.dart';
import 'package:vpfut/utils/constants.dart';

import 'components/body.dart';

class MarkSoccerScrenn extends StatelessWidget {
  const MarkSoccerScrenn({Key? key}) : super(key: key);
  static const routeName = '/markSoccerScreen';

  @override
  Widget build(BuildContext context) {
    var parametros =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    //get imageUrl from parametros
    var imageUrl = parametros['imageUrl'] as String;
    var title = parametros['title'] as String;
    var description = parametros['description'] as String;

    Size size = MediaQuery.of(context).size;
    print('markSoccerScreen');
    return Scaffold(
      body: Container(
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://pantelas.com.br/wp-content/uploads/2016/12/quadra-de-futebol-society-2.jpg"),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
            opacity: 0.2,
          ),
        ),
        child: SingleChildScrollView(
          child:
              Body(imageUrl: imageUrl, description: description, title: title),
        ),
      ),
    );
  }
}
