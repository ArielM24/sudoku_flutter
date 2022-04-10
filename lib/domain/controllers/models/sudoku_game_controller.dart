import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sudoku_api/sudoku_api.dart';
import 'package:sudoku_flutter/domain/models/sudoku_game.dart';

class SudokuGameController extends GetxController {
  Future<SudokuGame> generate() async {
    PuzzleOptions options = PuzzleOptions();
    Puzzle puzzle = Puzzle(options);
    await puzzle.generate();
    printGrid(puzzle.board());

    return SudokuGame();
  }
}
