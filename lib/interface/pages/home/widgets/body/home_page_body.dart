import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku_flutter/interface/pages/difficulty/difficulty_page.dart';
import 'package:sudoku_flutter/interface/pages/sudoku/sudoku_page.dart';
import 'package:sudoku_flutter/interface/widgets/buttons/expanded_button.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ExpandedButton(
              onPressed: () => Get.to(const SudokuPage()), text: "Continue"),
          ExpandedButton(
              onPressed: () => Get.to(const DifficultyPage()),
              text: "New game"),
          ExpandedButton(
              onPressed: () => Get.to(const DifficultyPage()), text: "Options"),
        ],
      ),
    );
  }
}
