import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/board_controller.dart';

class CategoryButton extends StatelessWidget {
  final boardController = Get.find<BoardController>();

  String category;

  CategoryButton({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Obx(() {
        return FlatButton(
          color: boardController.currentCategory.value == category ? const Color(0xff343434) : const Color(0xffe1e1e1),
          child: Text(
            category,
            style: TextStyle(
                color: boardController.currentCategory.value == category
                    ? const Color(0xffe1e1e1)
                    : const Color(0xff343434)),
          ),
          onPressed: () {
            print(category);
            boardController.applyCategory(category: category);
          },
        );
      }),
    );
  }
}
