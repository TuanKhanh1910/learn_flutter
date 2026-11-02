import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final String text;
  final void Function() onTab;
  const ButtonCustom({super.key, required this.text, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTab,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 33, 1, 95),
      ),
      child: Text(text),
    );
  }
}
