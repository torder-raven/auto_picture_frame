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
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              children: [1, 2, 3]
                  .map(
                    (number) => Image.asset(
                      'asset/img/banner$number.png',
                      fit: BoxFit.fitWidth,
                    ),
                  )
                  .toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red, // 원하는 색상으로 설정
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.pause, color: Colors.white), // 아이콘 색상 지정
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(color: Colors.red),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('1'), Text('/3')],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
