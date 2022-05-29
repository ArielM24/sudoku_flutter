import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku_flutter/domain/controllers/models/sudoku_game_controller.dart';
import 'package:sudoku_flutter/domain/database/hive_sudoku_game.dart';
import 'package:sudoku_flutter/domain/enums/difficulty.dart';
import 'package:sudoku_flutter/domain/models/sudoku_cell_data.dart';
import 'package:sudoku_flutter/domain/models/sudoku_game.dart';
import 'package:sudoku_flutter/domain/util/time_utils.dart';
import 'package:sudoku_flutter/interface/widgets/dialogs/solved_dialog.dart';

class SudokuPageController extends GetxController {
  Rx<SudokuGame> game = Rx<SudokuGame>(SudokuGame());
  RxInt selectedCell = (-1).obs;
  RxInt xSel = (-1).obs;
  RxInt ySel = (-1).obs;
  RxBool isAnnotationMode = false.obs;
  RxString timerText = "00:00:00".obs;
  Timer? timer;
  Rx<Color> checkColor = Rx<Color>(Colors.black);
  Rx<Icon?> checkIcon = Rx<Icon?>(null);

  bool get isSolved => game.value.isSolved;

  @override
  onInit() async {
    await reload();
    super.onInit();
  }

  @override
  onClose() {
    debugPrint("reset");
    resetTimer();
    super.onClose();
  }

  reload(
      {bool newGame = true, Difficulty difficulty = Difficulty.normal}) async {
    debugPrint("init $newGame");
    if (newGame) {
      debugPrint("generate");
      game.value = await SudokuGameController().generate(difficulty);
      HiveSudokuGame.box.put("g1", game.value);
      resetTimer();
      _initSudokuTimer();
    } else {
      game.value = HiveSudokuGame.box.get("g1")!;
    }
    return true;
  }

  resetTimer() {
    timer?.cancel();
    timerText.value = "00:00:00";
  }

  _initSudokuTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (!isSolved) {
        game.value.totalSeconds++;
        game.value.save();
        _updateTimer();
      }
    });
  }

  _updateTimer() {
    timerText.value = formatDuration(game.value.gameDuration);
  }

  selectCell(int index) {
    selectedCell.value = index;
    xSel.value = getXAxis(selectedCell.value);
    ySel.value = getYAxis(selectedCell.value);
  }

  SudokuCellData cellAt(int index) {
    return game.value.board[index];
  }

  String valueAtIndex(int index) {
    int v = game.value.board[index].value ?? 0;
    return "${v > 0 ? v : ""}";
  }

  Color? getCellColor(int x, int y) {
    if (selectedCell.value == getIndex(x, y)) {
      return Colors.blue[200];
    } else if (xSel.value == x || ySel.value == y) {
      return Colors.grey[350];
    }
    return null;
  }

  FontWeight? getFontWeight(int cellIndex) {
    if (cellAt(cellIndex).isBaseCell) {
      return FontWeight.bold;
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

  editSelectedValue(int n) {
    if (!isSolved) {
      if (isAnnotationMode.value) {
        game.value.editAnnotations(selectedCell.value, n);
      } else {
        bool isError = game.value.editCellValue(selectedCell.value, n);
        if (isError) {
          debugPrint("${game.value.errorIndexes}");
        }
        if (isSolved) {
          Get.dialog(SolvedDialog(
              time:
                  formatDuration(Duration(seconds: game.value.totalSeconds))));
        }
      }
      game.refresh();
    }
  }

  switchAnnotations() {
    isAnnotationMode.toggle();
  }

  deleteSelectedValue() {
    if (!isSolved) {
      game.value.editCellValue(selectedCell.value, 0);
      game.value.clearAnnotations(selectedCell.value);
      game.refresh();
    }
  }

  void checkSelectedCell() {
    bool valid = game.value.isCellValid(selectedCell.value);
    debugPrint("valid $valid");
    checkColor.value = valid ? Colors.green : Colors.red;
    checkIcon.value = valid
        ? const Icon(Icons.check_outlined, color: Colors.green)
        : const Icon(Icons.error_outline, color: Colors.red);
    2.seconds.delay().then((_) {
      checkColor.value = Colors.black;
      checkIcon.value = null;
    });
  }
}
