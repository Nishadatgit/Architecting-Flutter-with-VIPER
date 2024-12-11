import 'package:flutter/material.dart';
import 'package:viper_form_app/shared/custom_fields/checkbox.dart';
import 'package:viper_form_app/shared/custom_fields/spacing.dart';
import 'package:viper_form_app/shared/custom_fields/textfield.dart';

abstract class FormFieldWidget {
  Widget build(BuildContext context);
}

class TextFieldFormField extends FormFieldWidget {
  final String label;
  final String value;

  TextFieldFormField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return CustomTextFieldV1(label: label, value: value);
  }
}

class CheckboxFormField extends FormFieldWidget {
  final String label;
  final bool selected;
  final ValueChanged<bool> onChanged;

  CheckboxFormField(
      {required this.label, required this.selected, required this.onChanged});

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

  CustomSpacingField({this.spacing = 8});
  @override
  Widget build(BuildContext context) {
    return CustomSpacing(space: spacing);
  }
}
