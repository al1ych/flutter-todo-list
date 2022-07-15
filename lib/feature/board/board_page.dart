import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testovoe/feature/board/widget/board.dart';
import 'package:testovoe/feature/board/widget/category_picker.dart';
import 'package:testovoe/shared/custom_appbar/custom_appbar.dart';

import '../new_task/new_task_page.dart';

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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          disabledElevation: 0,
          elevation: 0,
          onPressed: () => _onNewTask(),
          backgroundColor: const Color(0xff2f2f2f),
          label: const Text(
            'Add new task',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  _onNewTask() {
    Get.to(
      () => NewTaskPage(),
      transition: Transition.fade,
      duration: const Duration(seconds: 1),
    );
  }
}
