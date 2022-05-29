import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku_flutter/domain/controllers/pages/sudoku_page_controller.dart';
import 'package:sudoku_flutter/domain/enums/difficulty.dart';
import 'package:sudoku_flutter/interface/pages/sudoku/widgets/body/widgets/sudoku_cell.dart';

class SudokuBoard extends StatelessWidget {
  final Difficulty difficulty;
  const SudokuBoard({Key? key, required this.difficulty}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SudokuPageController controller = Get.find();

    return SizedBox(
      height: 270,
      width: 270,
      child: FutureBuilder(
          future: _paintBoard(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Obx(() {
                return GridView.count(
                  crossAxisCount: 9,
                  children: [
                    for (int i = 0; i < controller.game.value.board.length; i++)
                      SudokuCell(cellIndex: i)
                  ],
                );
              });
            }
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.grid_on),
                  SizedBox(width: 10),
                  Text("Loading"),
                ],
              ),
            );
          }),
    );
  }

  Future<List<Widget>> _paintBoard() async {
    SudokuPageController controller = Get.find();
    List<Widget> board = [];
    for (int i = 0; i < controller.game.value.board.length; i++) {
      board.add(SudokuCell(cellIndex: i));
    }
    return board;
  }
}
