import 'package:flutter/material.dart';
import 'package:sudoku_flutter/domain/enums/difficulty.dart';
import 'package:sudoku_flutter/interface/pages/sudoku/widgets/body/widgets/number_buttons.dart';
import 'package:sudoku_flutter/interface/pages/sudoku/widgets/body/widgets/speccial_button.dart';
import 'package:sudoku_flutter/interface/pages/sudoku/widgets/body/widgets/sudoku_board.dart';
import 'package:sudoku_flutter/interface/pages/sudoku/widgets/body/widgets/sudoku_timer.dart';

import 'widgets/conffeti_overlay.dart';

class SudokuPageBody extends StatelessWidget {
  final Difficulty difficulty;
  const SudokuPageBody({Key? key, required this.difficulty}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SudokuTimer(),
            Center(child: SudokuBoard(difficulty: difficulty)),
            const NumberButtons(),
            const SpecialButtons()
          ],
        ),
        const ConfettiOverlay()
      ],
    );
  }
}
