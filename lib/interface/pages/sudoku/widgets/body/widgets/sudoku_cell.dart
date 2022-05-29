import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku_flutter/domain/controllers/pages/sudoku_page_controller.dart';
import 'package:sudoku_flutter/interface/pages/sudoku/widgets/body/widgets/sudoku_cell_annotations.dart';

class SudokuCell extends StatelessWidget {
  final int cellIndex;
  const SudokuCell({Key? key, required this.cellIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SudokuPageController controller = Get.find();
    return Obx(() {
      int x = controller.getXAxis(cellIndex);
      int y = controller.getYAxis(cellIndex);
      BorderSide top = controller.getTopBorder(y);
      BorderSide bottom = controller.getBottomBorder(y);
      BorderSide left = controller.getLeftBorder(x);
      BorderSide right = controller.getRightBorder(x);
      return GestureDetector(
        onTap: () => controller.selectCell(cellIndex),
        child: Container(
          decoration: BoxDecoration(
              border:
                  Border(top: top, bottom: bottom, left: left, right: right),
              color: controller.getCellColor(x, y)),
          child: Stack(
            children: [
              Visibility(
                  visible: controller.valueAtIndex(cellIndex).isEmpty,
                  child: SudokuCellAnnotations(cellIndex: cellIndex)),
              Visibility(
                visible: controller.valueAtIndex(cellIndex).isNotEmpty,
                child: Center(
                    child: Text(
                  controller.valueAtIndex(cellIndex),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: controller.getFontWeight(cellIndex)),
                )),
              ),
            ],
          ),
        ),
      );
    });
  }
}
