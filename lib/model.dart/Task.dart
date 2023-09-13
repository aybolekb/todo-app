import 'package:hive/hive.dart';

part 'Task.g.dart';

@HiveType(typeId: 1)
class Task {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final int id;
  @HiveField(2)
  bool isCompleted;

  Task(this.title, this.id, {this.isCompleted = false});
}
