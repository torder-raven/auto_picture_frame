import 'dart:async';
import 'package:auto_picture_frame/common/extension/int_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandScapePageView extends StatefulWidget {
  @override
  State<LandScapePageView> createState() => _LandScapePageViewState();
}

class _LandScapePageViewState extends State<LandScapePageView> {
  final imageNumberList = [1, 2, 3, 4, 5];
  Timer? timer;

  PageController controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      int currentPage = controller.page!.toInt();
      int nextPage = currentPage + 1;

      if (nextPage > imageNumberList.length - 1) {
        nextPage = 0;
      }
      controller.animateToPage(nextPage,
          duration: const Duration(microseconds: 400), curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: imageNumberList
          .map(
            (e) => Image.asset(
              e.imageToPath(),
              fit: BoxFit.fitWidth,
            ),
          )
          .toList(),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    if (timer != null) {
      timer!.cancel();
    }
    super.dispose();
  }
}
