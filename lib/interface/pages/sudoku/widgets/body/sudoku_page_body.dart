import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku_flutter/domain/controllers/pages/sudoku_page_controller.dart';
import 'package:sudoku_flutter/interface/pages/sudoku/widgets/body/widgets/sudoku_board.dart';

class SudokuPageBody extends StatelessWidget {
  const SudokuPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(child: SudokuBoard()),
      ],
    );
  }
}
