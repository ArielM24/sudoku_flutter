import 'package:flutter/material.dart';
import 'package:sudoku_flutter/domain/enums/difficulty.dart';
import 'package:sudoku_flutter/interface/pages/sudoku/sudoku_page.dart';
import 'package:sudoku_flutter/interface/widgets/buttons/expanded_button.dart';

class DifficultyPage extends StatelessWidget {
  const DifficultyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const BackButton(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ExpandedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const SudokuPage(
                        newGame: true, difficulty: Difficulty.hard);
                  }));
                },
                text: "Hard"),
            ExpandedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const SudokuPage(newGame: true);
                  }));
                },
                text: "Normal"),
            ExpandedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const SudokuPage(
                        newGame: true, difficulty: Difficulty.easy);
                  }));
                },
                text: "Easy"),
          ],
        ),
      ),
    );
  }
}
