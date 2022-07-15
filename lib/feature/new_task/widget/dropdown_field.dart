import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testovoe/feature/new_task/widget/field_decoration.dart';

class DropdownField extends StatefulWidget {
  List<String> options;

  DropdownField({
    Key? key,
    required this.options,
  }) : super(key: key);

  @override
  State<DropdownField> createState() => _DropdownFieldState();
}

class _DropdownFieldState extends State<DropdownField> {
  late String dropdownValue = widget.options[0];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: dropdownValue,
      icon: const Icon(Icons.keyboard_arrow_down),
      decoration: fieldDecoration,
      elevation: 0,
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: widget.options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
