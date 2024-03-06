import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? timer;
  PageController pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      int currentPage = pageController.page?.toInt() ?? 0;
      int nextPage = currentPage + 1;

      if (nextPage > 4) {
        nextPage = 0;
      }

      pageController.animateToPage(nextPage,
          duration: Duration(milliseconds: 750), curve: Curves.easeOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [1, 2, 3, 4, 5]
            .map((e) => Image.asset(
                  "asset/images/image_$e.jpeg",
                  fit: BoxFit.cover,
                ))
            .toList(),
      ),
    );
  }

  // deactivate는 언제?
  // 앱이 Background로 빠졌을 때는 어떻게?
  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    timer?.cancel();
    pageController.dispose();
    super.dispose();
  }
}
