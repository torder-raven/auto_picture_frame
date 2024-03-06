import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (kDebugMode) {
        print("tick");
      }
      int? nextPage = pageController.page?.toInt();

      if (nextPage == null) {
        return;
      }

      if (nextPage == 4) {
        nextPage = 0;
      } else {
        nextPage++;
      }

      pageController.animateToPage(nextPage,
          duration: const Duration(milliseconds: 300), curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          controller: pageController,
          children: [
            '17cCMVL-muVacidVZO_5p-9TzcTpaXDkz',
            '1AWoZ0fsibvFcL07KuAdvdYPUqcQWue3O',
            '1fOTu72xKi5Phe6qw9rG9URZoGzKDvEst',
            '1jSAiAPKjTUVUxjSBbsZOK-84gn8Lsfxq',
            '1kmP0Rxj1RBlw-HYGWb-WuaKye6522cb5'
          ]
              .map((e) => Stack(fit: StackFit.expand, children: <Widget>[
                    const Center(child: CircularProgressIndicator()),
                    FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image:
                          'https://drive.usercontent.google.com/download?id=$e&export=download&authuser=0',
                      fit: BoxFit.cover,
                    ),
                  ]))
              .toList()),
    );
  }
}
