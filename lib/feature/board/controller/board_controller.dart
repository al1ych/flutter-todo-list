import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../api/board_service.dart';
import '../dto/task_dto.dart';
import '../model/task_model.dart';

class BoardController extends GetxController with GetTickerProviderStateMixin {
  final tasks = <TaskModel>[].obs;
  final filteredTasks = <TaskModel>[].obs;
  final boardApi = Get.find<BoardService>();
  final currentCategory = 'all'.obs;

  late final animController = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat(reverse: false);

  late final Animation<double> animation = CurvedAnimation(
    parent: animController,
    curve: Curves.ease,
  );

  BoardController() {
    animController.forward();
    _init();
  }

  _init() async {
    await _fetch();
    applyCategory(category: 'all');
  }

  _fetch() async {
    List t = await boardApi.fetchTasks();
    for (var x in t) {
      TaskModel task = TaskModel.fromJson(x).copyWith(categories: ['all']);
      if (task.status == 'pending') {
        task = task.copyWith(
          categories: [...?task.categories, 'pending'],
        );
      }
      if (task.status == 'completed') {
        task = task.copyWith(
          categories: [...?task.categories, 'completed'],
        );
      }
      tasks.add(task);
      // print("task: $task");
    }
  }

  switchTaskStatus(TaskModel taskModel) {
    int index = tasks.indexWhere((t) => t.id == taskModel.id);
    if (index != -1) {
      String status = taskModel.status;
      String statusOpposite = taskModel.status == 'pending' ? 'completed' : 'pending';
      String newStatus = statusOpposite;
      var categories = [...taskModel.categories!];
      while (categories.contains(status)) {
        categories.remove(status);
      }
      categories.add(statusOpposite);
      tasks[index] = taskModel.copyWith(
        status: newStatus,
        categories: categories,
      );
    } else {
      print("cannot find the task");
    }
    tasks.refresh();
    applyCategory();
  }

  switchTaskCategory({
    required TaskModel taskModel,
    required String category,
  }) {
    int index = tasks.indexWhere((t) => t.id == taskModel.id);
    if (index != -1) {
      var categories = [...taskModel.categories!];
      if (categories.contains(category)) {
        while (categories.contains(category)) {
          categories.remove(category);
        }
      } else {
        categories.add(category);
      }
      tasks[index] = taskModel.copyWith(
        categories: categories,
      );
    } else {
      print("cannot find the task");
    }
    tasks.refresh();
    applyCategory();
  }

  applyCategory({String? category}) {
    category ??= currentCategory.value;
    currentCategory.value = category;
    filteredTasks.value = tasks
        .where(
          (t) => t.categories?.contains(category) ?? false,
        )
        .toList();
    filteredTasks.refresh();
  }
}
