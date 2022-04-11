import 'package:flutter/material.dart';
import 'package:sudoku_flutter/interface/pages/home/widgets/body/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomePageBody(),
    );
  }
}
