import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sudoku_flutter/domain/database/hive_sudoku_game.dart';

class HiveService extends GetxService {
  Future<HiveService> init() async {
    await _initBoxes();
    return this;
  }

  _initBoxes() async {
    await Hive.openBox(HiveSudokuGame.boxName, path: await _appDirectory());
    debugPrint("boxes openned");
  }

  static Future<String> _appDirectory() async {
    return (await getApplicationDocumentsDirectory()).path +
        Platform.pathSeparator +
        "sudoku";
  }
}
