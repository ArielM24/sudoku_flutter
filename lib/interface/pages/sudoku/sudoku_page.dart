import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku_flutter/domain/controllers/pages/sudoku_page_controller.dart';
import 'package:sudoku_flutter/domain/enums/difficulty.dart';
import 'package:sudoku_flutter/interface/pages/sudoku/widgets/body/sudoku_page_body.dart';

class SudokuPage extends StatelessWidget {
  final bool newGame;
  final Difficulty difficulty;
  const SudokuPage(
      {Key? key, this.newGame = false, this.difficulty = Difficulty.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SudokuPageController controller =
        Get.put(SudokuPageController(newGame: newGame));
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: FutureBuilder(
          future: controller.reload(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SudokuPageBody(
                difficulty: difficulty,
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
