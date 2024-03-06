import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [1, 2, 3]
            .map((number) => Image.asset(
                  'asset/img/banner$number.png',
                  fit: BoxFit.cover,
                ))
            .toList(),
      ),
    );
  }
}
