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
  List<int> annotations = List.generate(9, (index) => 0);

  SudokuCellData({this.x = 0, this.y = 0, this.value, List<int>? annotations}) {
    if (annotations != null && annotations.length == 9) {
      this.annotations = annotations;
    }
  }

  @override
  String toString() {
    return "{x: $x, y: $y, value: $value, annotations: $annotations}";
  }

  String getCellText(bool isAnnotationMode) {
    if (isAnnotationMode) {
      return annotations
          .map((a) => "$a${(a == 3 || a == 6) ? "\n" : ""}".padRight(1))
          .toList()
          .join();
    }

    return "${(value ?? 0) > 0 ? value : ""}";
  }
}
