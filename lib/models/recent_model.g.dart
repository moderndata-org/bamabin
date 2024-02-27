// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecentModelAdapter extends TypeAdapter<RecentModel> {
  @override
  final int typeId = 0;

  @override
  RecentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecentModel()
      ..id = fields[0] as int?
      ..title = fields[1] as String?
      ..imdb = fields[2] as String?
      ..hasDubbed = fields[3] as String?
      ..hasSubtitle = fields[4] as String?
      ..year = fields[5] as String?
      ..cover = fields[6] as String?
      ..bg_cover = fields[7] as String?;
  }

  @override
  void write(BinaryWriter writer, RecentModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.imdb)
      ..writeByte(3)
      ..write(obj.hasDubbed)
      ..writeByte(4)
      ..write(obj.hasSubtitle)
      ..writeByte(5)
      ..write(obj.year)
      ..writeByte(6)
      ..write(obj.cover)
      ..writeByte(7)
      ..write(obj.bg_cover);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
