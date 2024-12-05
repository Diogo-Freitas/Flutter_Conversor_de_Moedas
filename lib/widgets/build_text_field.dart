import 'package:flutter/material.dart';

class BuildTextField extends StatelessWidget {
  const BuildTextField(
      {super.key,
      required this.label,
      required this.prefix,
      required this.controller,
      required this.onChanged});

  final String label;
  final String prefix;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.amber, fontSize: 25),
        prefixText: prefix,
        prefixStyle: const TextStyle(
          color: Colors.amber,
          fontSize: 18,
        ),
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.amber,
          width: 1,
        )),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.amber,
          width: 2,
        )),
      ),
      style: const TextStyle(color: Colors.amber, fontSize: 18),
      onChanged: onChanged,
    );
  }
}