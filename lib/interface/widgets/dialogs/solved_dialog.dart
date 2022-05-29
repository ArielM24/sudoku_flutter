import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku_flutter/interface/pages/home/home_page.dart';

class SolvedDialog extends StatelessWidget {
  final String time;
  const SolvedDialog({Key? key, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Text("Solved"),
      content: Text("Puzzle solved in: $time"),
      actions: [
        TextButton(
            onPressed: () => Get.offAll(const HomePage()),
            child: const Text("Ok"))
      ],
    );
  }
}
