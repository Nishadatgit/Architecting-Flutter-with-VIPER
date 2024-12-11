// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:viper_form_app/shared/custom_fields/custom_field.dart';

class CustomTextFieldV1 extends CustomField {
  final String value;
  final ValueChanged<String>? onChanged;
  final String label;

  CustomTextFieldV1({
    super.key,
    required this.label,
    this.onChanged,
    this.value = "",
  });

  InputDecoration buildTextFieldDecoration() => InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: borderWidth),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: borderWidth),
        ),
      );

  late final TextEditingController controller;

  final Color borderColor = const Color(0xFF000000);
  final double borderWidth = 1;

  @override
  State<CustomTextFieldV1> createState() => _CustomTextFieldV1State();
}

class _CustomTextFieldV1State extends State<CustomTextFieldV1> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label),
        const Gap(8),
        TextField(
          controller: controller,
          onChanged: widget.onChanged,
          decoration: widget.buildTextFieldDecoration(),
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
