import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testovoe/feature/board/board_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), _navigateToBoard);
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text("Splash"),
        ),
      ),
    );
  }

  void _navigateToBoard() {
    Get.off(
      () => BoardPage(),
      transition: Transition.fade,
      duration: const Duration(seconds: 1),
    );
  }
}
