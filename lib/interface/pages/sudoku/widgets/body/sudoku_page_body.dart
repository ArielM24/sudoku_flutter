import 'package:flutter/material.dart';
import 'package:sudoku_flutter/interface/pages/sudoku/widgets/body/widgets/number_buttons.dart';
import 'package:sudoku_flutter/interface/pages/sudoku/widgets/body/widgets/speccial_button.dart';
import 'package:sudoku_flutter/interface/pages/sudoku/widgets/body/widgets/sudoku_board.dart';
import 'package:sudoku_flutter/interface/pages/sudoku/widgets/body/widgets/sudoku_timer.dart';

class SudokuPageBody extends StatelessWidget {
  const SudokuPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SudokuTimer(),
        Center(child: SudokuBoard()),
        NumberButtons(),
        SpeccialButtons()
      ],
    );
  }
}
