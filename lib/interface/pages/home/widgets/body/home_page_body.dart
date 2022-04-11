import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku_flutter/interface/pages/sudoku/sudoku_page.dart';

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
            child: ElevatedButton(
                onPressed: () async {
                  Get.to(const SudokuPage());
                },
                child: const Text("Continue")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () async {
                  Get.to(const SudokuPage(
                    newGame: true,
                  ));
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
