// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sudoku_cell_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SudokuCellDataAdapter extends TypeAdapter<SudokuCellData> {
  @override
  final int typeId = 1;

  @override
  SudokuCellData read(BinaryReader reader) {
    return SudokuCellData();
  }

  @override
  void write(BinaryWriter writer, SudokuCellData obj) {
    writer..writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SudokuCellDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
