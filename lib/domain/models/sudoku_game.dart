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
  @HiveField(3)
  List<int> errorIndexes = [];

  Duration get gameDuration => Duration(seconds: totalSeconds);
  bool get isSolved => errorIndexes.isEmpty;

  @override
  String toString() {
    return "$board";
  }

  setInitialErrors() {
    for (int i = 0; i < board.length; i++) {
      if (!isCellValid(i)) {
        errorIndexes.add(i);
      }
    }
  }

  bool isCellValid(int cellIndex) {
    return board[cellIndex].value == solvedBoard[cellIndex].value;
  }

  bool editCellValue(int cellIndex, int value) {
    if (!board[cellIndex].isBaseCell) {
      board[cellIndex].value = value;
      if (!isCellValid(cellIndex)) {
        if (!errorIndexes.contains(cellIndex)) {
          errorIndexes.add(cellIndex);
        }
        return true;
      } else {
        errorIndexes.remove(cellIndex);
      }
    }
    return false;
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
