import 'package:flutter/material.dart';

final fieldDecoration = InputDecoration(
  hintText: 'Hint Text',
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(
      width: 0,
      style: BorderStyle.none,
    ),
  ),
  filled: true,
  fillColor: const Color(0xffe1e1e1),
);
