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
      print("실행");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [1, 2, 3]
            .map((number) => Image.asset(
                  'asset/img/banner$number.png',
                  fit: BoxFit.fitWidth,
                ),
        ).toList(),
      ),
    );
  }
}
