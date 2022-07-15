import 'package:flutter/material.dart';
import 'package:testovoe/feature/board/widget/board.dart';
import 'package:testovoe/feature/board/widget/category_picker.dart';
import 'package:testovoe/shared/custom_appbar/custom_appbar.dart';

class BoardPage extends StatelessWidget {
  const BoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: "Board"),
        body: Column(
          children: [
            SizedBox(
              height: 32,
              child: CategoryPicker(),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Board(),
            ),
          ],
        ),
      ),
    );
  }
}
