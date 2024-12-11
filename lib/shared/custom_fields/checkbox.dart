import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:viper_form_app/shared/custom_fields/custom_field.dart';

class CustomCheckbox extends CustomField {
  final bool selected;
  final ValueChanged<bool>? onChanged;

  final String label;
  const CustomCheckbox({
    super.key,
    required this.label,
    this.selected = false,
    this.onChanged,
  });

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = widget.selected;
  }

  void _handleCheckboxChange(bool? value) {
    if (value != null) {
      setState(() {
        isSelected = value;
      });
      if (widget.onChanged != null) {
        widget.onChanged!(isSelected);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label),
        const Gap(8),
        Checkbox(
          value: isSelected,
          onChanged: _handleCheckboxChange,
        ),
      ],
    );
  }
}
