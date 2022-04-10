import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku_flutter/domain/controllers/models/sudoku_game_controller.dart';
import 'package:sudoku_flutter/domain/models/sudoku_cell_data.dart';
import 'package:sudoku_flutter/domain/models/sudoku_game.dart';

class SudokuPageController extends GetxController {
  Rx<SudokuGame> game = Rx<SudokuGame>(SudokuGame());
  RxInt selectedCell = (-1).obs;
  RxInt xSel = (-1).obs;
  RxInt ySel = (-1).obs;
  RxBool isAnnotationMode = false.obs;

  @override
  onInit() async {
    game.value = await SudokuGameController().generate();
    super.onInit();
  }

  selectCell(int index) {
    selectedCell.value = index;
    xSel.value = getXAxis(selectedCell.value);
    ySel.value = getYAxis(selectedCell.value);
    debugPrint("selected ${selectedCell.value}");
  }

  SudokuCellData cellAt(int index) {
    return game.value.board[index];
  }

  String valueAtIndex(int index) {
    int v = game.value.board[index].value ?? 0;
    return "${v > 0 ? v : ""}";
  }

  Color? getCellColor(int x, int y) {
    //debugPrint("$index x : $x y : $y");
    if (selectedCell.value == getIndex(x, y)) {
      return Colors.blue[200];
    } else if (xSel.value == x || ySel.value == y) {
      return Colors.grey[350];
    }
    return null;
  }

  int getIndex(int x, int y) {
    return 9 * y + x;
  }

  int getYAxis(int n) {
    return n ~/ 9;
  }

  int getXAxis(int n) {
    return n % 9;
  }

  BorderSide getTopBorder(int y) {
    if (y == 0 || y == 3 || y == 6) {
      return const BorderSide(width: 2);
    }
    return const BorderSide(width: 0.3);
  }

  BorderSide getBottomBorder(int y) {
    if (y == 8) {
      return const BorderSide(width: 2);
    }
    return const BorderSide(width: 0.3);
  }

  BorderSide getLeftBorder(int x) {
    if (x == 0 || x == 3 || x == 6) {
      return const BorderSide(width: 2);
    }
    return const BorderSide(width: 0.3);
  }

  BorderSide getRightBorder(int x) {
    if (x == 8) {
      return const BorderSide(width: 2);
    }
    return const BorderSide(width: 0.3);
  }
}
