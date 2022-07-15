import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testovoe/feature/board/controller/board_controller.dart';
import 'package:testovoe/feature/board/dto/task_dto.dart';

import '../model/task_model.dart';

class TaskTile extends StatelessWidget {
  final boardController = Get.find<BoardController>();

  TaskModel taskModel;

  TaskTile({
    Key? key,
    required this.taskModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onTap(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 16,
        ),
        child: Row(
          children: [
            taskModel.status == 'pending' ? const Icon(CupertinoIcons.app) : const Icon(CupertinoIcons.app_fill),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                taskModel.title,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onTap() {
    print(taskModel);
    boardController.switchTaskStatus(taskModel);
  }
}
