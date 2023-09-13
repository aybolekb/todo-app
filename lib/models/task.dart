import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final int id;
  @HiveField(2)
  bool isCompleted;
  @HiveField(3)
  String groupTitle;

  Task(
      {required this.id,
      required this.groupTitle,
      this.isCompleted = false,
      required this.title});
}
