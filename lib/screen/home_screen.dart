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
    createTimer(pageController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GestureDetector(
        child: PageView(
          controller: pageController,
          children: buildImageWidgets([1, 2, 3]),
        ),
        onTap: () {
          onClickEvent(pageController, timer);
        },
      )),
    );
  }
}

// Timer 생성 함수
void createTimer(PageController pageController) {
  const int timerUnit = 2;
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

// 일시정지 이벤트 함수
void onClickEvent(PageController pageController, Timer? timer) {
  if (timer != null && timer.isActive) {
    timer.cancel();
  } else {
    createTimer(pageController);
  }
}
