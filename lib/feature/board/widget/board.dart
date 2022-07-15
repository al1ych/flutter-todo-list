import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:testovoe/feature/board/controller/board_controller.dart';
import 'package:testovoe/feature/board/widget/task_tile.dart';

import '../model/task_model.dart';

class Board extends StatelessWidget {
  Board({Key? key}) : super(key: key);

  final boardController = Get.find<BoardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: boardController.filteredTasks.length,
        itemBuilder: (_, index) => FadeTransition(
          opacity: boardController.animation,
          child: Slidable(
            key: const ValueKey(0),
            child: TaskTile(
              taskModel: boardController.filteredTasks[index],
            ),
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  // An action can be bigger than the others.
                  onPressed: (context) => _onArchive(boardController.filteredTasks[index]),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  icon: boardController.filteredTasks[index].categories!.contains('archived')
                      ? Icons.unarchive
                      : Icons.archive_outlined,
                  label:
                      boardController.filteredTasks[index].categories!.contains('archived') ? 'Unarchive' : 'Archive',
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) => _onFavorite(boardController.filteredTasks[index]),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  icon: boardController.filteredTasks[index].categories!.contains('favorite')
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                  label:
                      boardController.filteredTasks[index].categories!.contains('favorite') ? 'Unfavorite' : 'Favorite',
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  _onFavorite(TaskModel taskModel) {
    print("favorite: ${taskModel.title}");
    boardController.switchTaskCategory(taskModel: taskModel, category: 'favorite');
  }

  _onArchive(TaskModel taskModel) {
    print("archived: ${taskModel.title}");
    boardController.switchTaskCategory(taskModel: taskModel, category: 'archived');
  }
}
