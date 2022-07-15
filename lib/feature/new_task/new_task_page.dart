import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testovoe/feature/board/board_page.dart';
import 'package:testovoe/feature/new_task/widget/basic_datetime_field.dart';
import 'package:testovoe/feature/new_task/widget/dropdown_field.dart';
import 'package:testovoe/feature/new_task/widget/field_decoration.dart';
import 'package:testovoe/shared/custom_appbar/custom_appbar.dart';

import '../board/controller/board_controller.dart';
import '../board/model/task_model.dart';
import 'controller/new_task_controller.dart';

class NewTaskPage extends StatelessWidget {
  final newTaskController = Get.find<NewTaskController>();
  final boardController = Get.find<BoardController>();

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _dateController = TextEditingController();
  final _startController = TextEditingController();
  final _endController = TextEditingController();

  NewTaskPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: "New task"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      _buildTextFormField('Title', 'title', _titleController),
                      const SizedBox(height: 16),
                      _buildTextFormField('Deadline', 'date', _dateController),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(child: _buildTextFormField('Start time', 'time', _startController)),
                          const SizedBox(width: 16),
                          Expanded(child: _buildTextFormField('End time', 'time', _endController)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _buildTextFormField('Remind', 'dropdown', GlobalKey()),
                      const SizedBox(height: 16),
                      _buildTextFormField('Repeat', 'dropdown', GlobalKey()),
                      const SizedBox(height: 128),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Obx(() {
          bool isDisabled = newTaskController.isSubmitDisabled.value;
          return FloatingActionButton.extended(
            disabledElevation: 0,
            elevation: 0,
            onPressed: () => isDisabled ? null : _onCreateTask(context),
            backgroundColor: const Color(0xff2f2f2f),
            label: const Text(
              'Create task',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          );
        }),
      ),
    );
  }

  _onCreateTask(context) {
    _submitForm(context);
  }

  _submitForm(context) {
    var rng = Random();
    if (_formKey.currentState!.validate()) {
      Get.snackbar(
        'Create task',
        'Successfully added the task!',
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.symmetric(vertical: 86, horizontal: 16),
        icon: const Icon(CupertinoIcons.app_fill, color: Colors.greenAccent),
        duration: Duration(seconds: 1),
      );
      _formKey.currentState?.save();
      boardController.addNewTask(
        task: TaskModel(
          title: _titleController.text,
          dueOn: _dateController.text,
          userId: rng.nextInt(100000) + 1000,
          id: rng.nextInt(100000) + 1000,
          status: 'pending',
          categories: ['all', 'pending'],
        ),
      );
      Future.delayed(const Duration(seconds: 2), () {
        Get.off(
          () => BoardPage(),
          transition: Transition.fade,
          duration: const Duration(seconds: 1),
        );
      });
    } else {
      Get.snackbar(
        'Create task',
        'Oops... Check if you filled everything correctly.',
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.symmetric(vertical: 86, horizontal: 16),
        icon: const Icon(CupertinoIcons.app_fill, color: Color(0xFFF06969)),
      );
    }
    newTaskController.disableSubmit();
  }

  Widget _buildTextFormField(String fieldTitle, String fieldType, controller) {
    Widget _field;
    switch (fieldType) {
      case 'title':
        _field = TextFormField(
          controller: controller,
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          decoration: fieldDecoration.copyWith(hintText: 'Design team meeting'),
        );
        break;
      case 'date':
        _field = BasicDateField(
          controller: controller,
          validator: (DateTime? value) {
            if (value == null) {
              return 'Deadline cannot be empty';
            }
            if (value.isBefore(DateTime.now())) {
              return 'Deadline cannot be in the past';
            }
            return null;
          },
        );
        break;
      case 'time':
        _field = BasicTimeField(
          controller: controller,
          validator: (DateTime? value) {
            if (value == null) {
              return 'Deadline cannot be empty';
            }
          },
        );
        break;
      case 'dropdown':
        final opts = fieldTitle == 'Remind'
            ? const <String>[
                '15 min prior',
                '10 min prior',
                '5 min prior',
              ]
            : const <String>[
                'Daily',
                'Weekly',
                'Monthly',
              ];
        _field = DropdownField(
          options: opts,
        );
        break;
      default:
        _field = Container();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        _field,
      ],
    );
  }
}
