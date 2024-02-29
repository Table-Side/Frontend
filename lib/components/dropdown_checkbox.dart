import 'package:flutter/material.dart';

class MyCheckbox extends StatefulWidget {
  final String checkboxText;
  final bool? value;
  final ValueChanged<bool?> onChanged;

  const MyCheckbox({
    Key? key,
    required this.checkboxText,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<MyCheckbox> createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: EdgeInsets.zero,
        title: Text(
          widget.checkboxText,
          textAlign: TextAlign.left,
          style: const TextStyle(fontSize: 14),
        ), // Display checkboxText as the title
        value: widget.value,
        onChanged: widget.onChanged,
      ),
    );
  }
}
