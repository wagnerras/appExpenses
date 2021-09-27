import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';

class AdptativeTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function() submitForm;
  final String label;
  final TextInputType keyboardType;

  const AdptativeTextField({
    Key? key,
    required this.controller,
    required this.submitForm,
    required this.label,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CupertinoTextField(
              controller: controller,
              onSubmitted: (_) => submitForm,
              keyboardType: keyboardType,
              placeholder: label,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
            ),
          )
        : TextField(
            controller: controller,
            onSubmitted: (_) => submitForm,
            decoration: InputDecoration(
              labelText: label,
            ),
            keyboardType: keyboardType,
            inputFormatters: keyboardType ==
                    const TextInputType.numberWithOptions(decimal: true)
                ? [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}'))]
                : [],
          );
  }
}
