import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int timerUnit = 2;
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: timerUnit), (timer) {
      int? nextPage = pageController.page?.toInt();
      if (nextPage == null) {
        return;
      }

      if (nextPage == 2) {
        nextPage = 0;
      } else {
        nextPage++;
      }

      pageController.animateToPage(nextPage,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: pageController,
          children: buildImageWidgets([1, 2, 3]),
        ),
      ),
    );
  }

  // 이미지 위젯 생성 함수
  List<Widget> buildImageWidgets(List<int> numbers) {
    return numbers
        .map(
          (number) => Image.asset(
            'asset/img/banner$number.png',
            fit: BoxFit.fitWidth,
          ),
        )
        .toList();
  }
}
