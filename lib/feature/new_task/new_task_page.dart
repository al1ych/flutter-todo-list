import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testovoe/feature/new_task/widget/basic_datetime_field.dart';
import 'package:testovoe/feature/new_task/widget/dropdown_field.dart';
import 'package:testovoe/feature/new_task/widget/field_decoration.dart';
import 'package:testovoe/shared/custom_appbar/custom_appbar.dart';

import 'controller/new_task_controller.dart';

class NewTaskPage extends StatelessWidget {
  final newTaskController = Get.find<NewTaskController>();

  final _formKey = GlobalKey<FormState>();

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
                      _buildTextFormField('Title', 'title'),
                      const SizedBox(height: 16),
                      _buildTextFormField('Deadline', 'date'),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(child: _buildTextFormField('Start time', 'time')),
                          const SizedBox(width: 16),
                          Expanded(child: _buildTextFormField('End time', 'time')),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _buildTextFormField('Remind', 'dropdown'),
                      const SizedBox(height: 16),
                      _buildTextFormField('Repeat', 'dropdown'),
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

  Widget _buildTextFormField(String fieldTitle, String fieldType) {
    Widget _field;
    switch (fieldType) {
      case 'title':
        _field = TextFormField(
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

  _onCreateTask(context) {
    _submitForm(context);
  }

  _submitForm(context) {
    if (_formKey.currentState!.validate()) {
      Get.snackbar(
        'Create task',
        'Successfully added the task!',
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.symmetric(vertical: 86, horizontal: 16),
        icon: const Icon(CupertinoIcons.app_fill, color: Colors.greenAccent),
      );
    } else {
      Get.snackbar(
        'Create task',
        'Oops... Check if you filled everything correctly.',
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.symmetric(vertical: 86, horizontal: 16),
        icon: const Icon(CupertinoIcons.app_fill, color: Color(0xFFF06969)),
      );
      newTaskController.disableSubmit();
    }
  }
}
