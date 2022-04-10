import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku_flutter/domain/controllers/pages/sudoku_page_controller.dart';

class SudokuCellAnnotations extends StatelessWidget {
  final int cellIndex;
  const SudokuCellAnnotations({Key? key, required this.cellIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SudokuPageController controller = Get.find();

    return SizedBox(
      height: 27,
      width: 27,
      child: GridView.count(
        crossAxisCount: 3,
        children: [
          for (int i = 0; i < 9; i++)
            Obx(() {
              int annotation = controller.cellAt(cellIndex).annotations[i];
              if (annotation > 0) {
                return Text(
                  "$annotation",
                  style:
                      const TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                );
              }
              return Container();
            })
        ],
      ),
    );
  }
}
