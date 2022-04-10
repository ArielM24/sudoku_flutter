import 'package:hive/hive.dart';
import 'package:sudoku_flutter/domain/models/sudoku_game.dart';

class HiveSudokuGame {
  static const String boxName = "sudoku_game";
  static Box<SudokuGame> get box => Hive.box(boxName);
}
