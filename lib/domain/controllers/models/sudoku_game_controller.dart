import 'package:get/get.dart';
import 'package:sudoku_api/sudoku_api.dart';
import 'package:sudoku_flutter/domain/models/sudoku_cell_data.dart';
import 'package:sudoku_flutter/domain/models/sudoku_game.dart';

class SudokuGameController extends GetxController {
  Future<SudokuGame> generate() async {
    PuzzleOptions options = PuzzleOptions();
    Puzzle puzzle = Puzzle(options);
    await puzzle.generate();
    SudokuGame game = SudokuGame();
    if (puzzle.board() != null) {
      game.board = _generateFromBoard(puzzle.board()!);
      game.solvedBoard = _generateFromBoard(puzzle.solvedBoard()!);
    }

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
