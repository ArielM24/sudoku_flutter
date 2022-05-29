import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku_flutter/domain/controllers/pages/sudoku_page_controller.dart';

class NumberButtons extends StatelessWidget {
  const NumberButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SudokuPageController controller = Get.find();

    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 1; i <= 9; i++)
            Expanded(
                child: TextButton(onPressed: () {
              controller.editSelectedValue(i);
            }, child: Obx(() {
              Color color = controller.isAnnotationMode.value
                  ? Colors.blue
                  : Colors.black;
              return Text(
                "$i",
                style: TextStyle(color: color, fontSize: 18),
              );
            })))
        ],
      ),
    );
  }
}
