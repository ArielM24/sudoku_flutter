import 'package:hive/hive.dart';
import 'package:sudoku_flutter/domain/models/sudoku_cell_data.dart';

part 'sudoku_game.g.dart';

@HiveType(typeId: 0)
class SudokuGame extends HiveObject {
  @HiveField(0)
  List<SudokuCellData> board = [];
  @HiveField(1)
  List<SudokuCellData> solvedBoard = [];
  @HiveField(2)
  int totalSeconds = 0;

  @override
  String toString() {
    return "$board";
  }

  editCellValue(int cellIndex, int value) {
    if (!board[cellIndex].isBaseCell) {
      board[cellIndex].value = value;
    }
  }

  editAnnotations(int cellIndex, int value) {
    if (!board[cellIndex].isBaseCell) {
      board[cellIndex].editAnnotations(value);
    }
  }

  clearAnnotations(int cellIndex) {
    if (!board[cellIndex].isBaseCell) {
      board[cellIndex].clearAnnotations();
    }
  }
}
