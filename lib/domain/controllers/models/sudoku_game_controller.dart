import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sudoku_api/sudoku_api.dart';
import 'package:sudoku_flutter/domain/enums/difficulty.dart';
import 'package:sudoku_flutter/domain/models/sudoku_cell_data.dart';
import 'package:sudoku_flutter/domain/models/sudoku_game.dart';

class SudokuGameController extends GetxController {
  Future<SudokuGame> generate(Difficulty difficulty) async {
    int? clues;
    String pattern = "random";
    if (difficulty == Difficulty.easy) {
      clues = 45;
    } else if (difficulty == Difficulty.normal) {
      clues = 35;
    } else if (difficulty == Difficulty.spring) {
      pattern = "spring";
    } else if (difficulty == Difficulty.summer) {
      pattern = "summer";
    } else if (difficulty == Difficulty.fall) {
      pattern = "fall";
    } else if (difficulty == Difficulty.winter) {
      pattern = "winter";
    }
    PuzzleOptions options = PuzzleOptions(clues: clues, patternName: pattern);
    Puzzle puzzle = Puzzle(options);
    await puzzle.generate();
    SudokuGame game = SudokuGame();
    if (puzzle.board() != null) {
      game.board = _generateFromBoard(puzzle.board()!);
      game.solvedBoard = _generateFromBoard(puzzle.solvedBoard()!);
      game.setInitialErrors();
    }
    printGrid(puzzle.solvedBoard());

    return game;
  }

  List<SudokuCellData> _generateFromBoard(Grid board) {
    List<SudokuCellData> data = [];
    for (int y = 0; y < 9; y++) {
      for (int x = 0; x < 9; x++) {
        int cellValue =
            board.cellAt(Position(row: y, column: x)).getValue() ?? 0;
        data.add(SudokuCellData(
            x: x, y: y, isBaseCell: cellValue > 0, value: cellValue));
      }
    }
    return data;
  }
}
