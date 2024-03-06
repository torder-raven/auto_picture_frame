import 'dart:async';

import 'package:auto_picture_frame/resources/resources.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final List<int> images;

  const HomeScreen({this.images = const [1, 2, 3, 4, 5], super.key});

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
    initAnimateToPageWithTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: widget.images
            .map(
              (e) => Image.asset(
                "image_$e".jpeg(),
                fit: BoxFit.cover,
              ),
            )
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

  void initAnimateToPageWithTimer({
    Duration timerDuration = const Duration(seconds: 3),
    Duration pageAnimateDuration = const Duration(milliseconds: 750),
  }) {
    timer = Timer.periodic(
      timerDuration,
      (timer) {
        int currentPage = pageController.page?.toInt() ?? 0;
        int nextPage = currentPage + 1;

        if (nextPage >= widget.images.length) {
          nextPage = 0;
        }

        pageController.animateToPage(
          nextPage,
          duration: pageAnimateDuration,
          curve: Curves.easeOut,
        );
      },
    );
  }
}
