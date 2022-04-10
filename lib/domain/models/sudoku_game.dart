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
  Duration? duration;

  @override
  String toString() {
    return "$board";
  }
}
