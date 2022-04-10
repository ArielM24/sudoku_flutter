import 'package:hive/hive.dart';

part 'sudoku_cell_data.g.dart';

@HiveType(typeId: 1)
class SudokuCellData extends HiveObject {
  @HiveType(typeId: 0)
  int x = 0;
  @HiveType(typeId: 1)
  int y = 0;
  @HiveType(typeId: 2)
  int? value;
  @HiveType(typeId: 3)
  List<int> annotations = [];
}
