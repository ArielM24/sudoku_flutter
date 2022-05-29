import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:get/get.dart';
import 'package:sudoku_flutter/domain/controllers/pages/sudoku_page_controller.dart';

class ConfettiOverlay extends StatelessWidget {
  const ConfettiOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SudokuPageController controller = Get.find();
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: IgnorePointer(
        ignoring: true,
        child: ConfettiWidget(
          confettiController: controller.confettiController,
          blastDirectionality: BlastDirectionality.explosive,
        ),
      ),
    );
  }
}
