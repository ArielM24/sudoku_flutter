import 'package:flutter/material.dart';
import 'package:sudoku_flutter/interface/pages/sudoku/widgets/body/sudoku_page_body.dart';

class SudokuPage extends StatelessWidget {
  const SudokuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SudokuPageBody(),
    );
  }
}
