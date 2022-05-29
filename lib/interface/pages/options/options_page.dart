import 'package:flutter/material.dart';
import 'package:sudoku_flutter/interface/widgets/buttons/expanded_button.dart';

class OptionsPage extends StatelessWidget {
  const OptionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Options", style: TextStyle(color: Colors.black)),
          elevation: 0,
          leading: const BackButton(color: Colors.black),
          backgroundColor: Colors.transparent),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ExpandedButton(onPressed: () {}, text: ""),
            ExpandedButton(onPressed: () {}, text: ""),
            ExpandedButton(onPressed: () {}, text: ""),
          ],
        ),
      ),
    );
  }
}
