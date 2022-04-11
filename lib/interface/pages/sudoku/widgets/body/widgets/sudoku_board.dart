import 'package:flutter/material.dart';
import 'package:sudoku_flutter/interface/pages/sudoku/widgets/body/widgets/sudoku_cell.dart';

class SudokuBoard extends StatelessWidget {
  const SudokuBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      width: 270,
      child: GridView.count(
        crossAxisCount: 9,
        children: [for (int i = 0; i < 81; i++) SudokuCell(cellIndex: i)],
      ),
    );
  }
}
