import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'component/pageview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(body: LandScapePageView());
  }
}
