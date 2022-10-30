import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function() onPressed;

  const AdaptativeButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !kIsWeb && Platform.isIOS
        ? CupertinoButton(
            color: Theme.of(context).primaryColor,
            child: Text(label),
            onPressed: onPressed,
            padding: const EdgeInsets.symmetric(horizontal: 20),
          )
        : ElevatedButton(
            child: Text(
              label,
              style: TextStyle(
                color: Theme.of(context).textTheme.button?.color,
              ),
            ),
            onPressed: onPressed,
          );
  }
}
