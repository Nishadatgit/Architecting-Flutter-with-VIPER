import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:viper_form_app/shared/custom_fields/checkbox.dart';
import 'package:viper_form_app/shared/custom_fields/textfield.dart';

abstract class FormFieldWidget {
  final String label;

  FormFieldWidget({required this.label});
  Widget build(BuildContext context);
}

class TextFieldFormField extends FormFieldWidget {
  final String value;
  final ValueChanged<String>? onChanged;

  TextFieldFormField(
      {required super.label, required this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CustomTextFieldV1(
      label: label,
      value: value,
      onChanged: onChanged,
    );
  }
}

class CheckboxFormField extends FormFieldWidget {
  final bool selected;
  final ValueChanged<bool> onChanged;

  CheckboxFormField(
      {required super.label, required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CustomCheckbox(
      label: label,
      selected: selected,
      onChanged: onChanged,
    );
  }
}

class CustomSpacingField extends FormFieldWidget {
  final double spacing;

  CustomSpacingField({this.spacing = 8, super.label = "SPACING"});
  @override
  Widget build(BuildContext context) {
    return Gap(spacing);
  }
}
