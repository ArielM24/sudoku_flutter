import 'package:flutter/material.dart';

class ExpandedButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const ExpandedButton({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 200),
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(onPressed: onPressed, child: Text(text)),
    );
  }
}
