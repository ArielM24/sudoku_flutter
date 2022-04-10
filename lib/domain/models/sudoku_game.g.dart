// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sudoku_game.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SudokuGameAdapter extends TypeAdapter<SudokuGame> {
  @override
  final int typeId = 0;

  @override
  SudokuGame read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SudokuGame()
      ..board = (fields[0] as List).cast<SudokuCellData>()
      ..solvedBoard = (fields[1] as List).cast<SudokuCellData>()
      ..totalSeconds = fields[2] as int;
  }

  @override
  void write(BinaryWriter writer, SudokuGame obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.board)
      ..writeByte(1)
      ..write(obj.solvedBoard)
      ..writeByte(2)
      ..write(obj.totalSeconds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SudokuGameAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
