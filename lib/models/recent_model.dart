import 'package:hive/hive.dart';

part 'recent_model.g.dart';

@HiveType(typeId: 0)
class RecentModel extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? imdb;
  @HiveField(3)
  String? hasDubbed;
  @HiveField(4)
  String? hasSubtitle;
  @HiveField(5)
  String? year;
  @HiveField(6)
  String? cover;
  @HiveField(7)
  String? bg_cover;
  RecentModel(
      {this.id,
      this.bg_cover,
      this.cover,
      this.hasDubbed,
      this.hasSubtitle,
      this.imdb,
      this.title,
      this.year});
}
