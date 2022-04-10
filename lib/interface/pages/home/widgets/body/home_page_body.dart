import 'package:flutter/material.dart';
import 'package:sudoku_flutter/domain/controllers/models/sudoku_game_controller.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                ElevatedButton(onPressed: () {}, child: const Text("Continue")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () async {
                  await SudokuGameController().generate();
                },
                child: const Text("New game")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                ElevatedButton(onPressed: () {}, child: const Text("Options")),
          ),
        ],
      ),
    );
  }
}
