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
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SudokuCellData(
      x: fields[0] as int,
      y: fields[1] as int,
      value: fields[2] as int?,
      annotations: (fields[3] as List?)?.cast<int>(),
      isBaseCell: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SudokuCellData obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.x)
      ..writeByte(1)
      ..write(obj.y)
      ..writeByte(2)
      ..write(obj.value)
      ..writeByte(3)
      ..write(obj.annotations)
      ..writeByte(4)
      ..write(obj.isBaseCell);
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
