import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku_flutter/domain/controllers/pages/sudoku_page_controller.dart';
import 'package:sudoku_flutter/interface/pages/sudoku/widgets/body/sudoku_page_body.dart';

class SudokuPage extends StatelessWidget {
  final bool newGame;
  const SudokuPage({Key? key, this.newGame = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SudokuPageController controller =
        Get.put(SudokuPageController(newGame: newGame));
    return WillPopScope(
      onWillPop: () async {
        controller.reset();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                controller.reset();
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_rounded, color: Colors.black)),
        ),
        body: const SudokuPageBody(),
      ),
    );
  }
}
