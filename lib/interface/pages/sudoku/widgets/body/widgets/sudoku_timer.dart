import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku_flutter/domain/controllers/pages/sudoku_page_controller.dart';

class SudokuTimer extends StatelessWidget {
  const SudokuTimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SudokuPageController controller = Get.find();
    return Container(
      child: Obx(() {
        return Text(controller.timerText.value,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold));
      }),
    );
  }
}
