import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:viper_form_app/shared/custom_fields/custom_field.dart';

class CustomSpacing extends CustomField {
  final double space;

  CustomSpacing({
    super.key,
    this.space = 8.0,
  });

  @override
  _CustomSpacingState createState() => _CustomSpacingState();
}

class _CustomSpacingState extends State<CustomSpacing> {
  @override
  Widget build(BuildContext context) {
    return Gap(widget.space);
  }
}
