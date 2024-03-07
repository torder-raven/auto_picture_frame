import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    initTimer(pageController);
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

  @override
  void dispose() {
    timer?.cancel();
    pageController.dispose();
    super.dispose();
  }
}

// Timer 초기화 함수
void initTimer(PageController pageController) {
  const int timerUnit = 2;
  Timer.periodic(Duration(seconds: timerUnit), (timer) {
    createPageController(pageController);
  });
}

// PagerController 생성 함수
void createPageController(PageController pageController) {
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
