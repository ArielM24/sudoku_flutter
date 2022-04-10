import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku_flutter/domain/database/hive_service.dart';
import 'package:sudoku_flutter/interface/pages/home/home_page.dart';

class SudokuApp extends StatelessWidget {
  const SudokuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: AnimatedSplashScreen.withScreenFunction(
        splashIconSize: 280,
        splash: Column(
          children: const [
            Icon(
              Icons.app_registration_sharp,
              color: Colors.blue,
              size: 180,
            ),
            Text("Sudoku Flutter",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))
          ],
        ),
        screenFunction: () async {
          await _initServices();
          return const HomePage();
        },
      ),
    );
  }

  _initServices() async {
    await Get.putAsync(() => HiveService().init());
  }
}
