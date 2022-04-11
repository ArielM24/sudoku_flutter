import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku_flutter/domain/controllers/pages/sudoku_page_controller.dart';
import 'package:sudoku_flutter/interface/pages/sudoku/widgets/body/widgets/sudoku_cell.dart';

class SudokuBoard extends StatelessWidget {
  const SudokuBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SudokuPageController controller = Get.find();

    return SizedBox(
      height: 270,
      width: 270,
      child: Obx(() {
        return GridView.count(
          crossAxisCount: 9,
          children: [
            for (int i = 0; i < controller.game.value.board.length; i++)
              SudokuCell(cellIndex: i)
          ],
        );
      }),
    );
  }
}
