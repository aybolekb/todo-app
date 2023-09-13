import 'package:hive/hive.dart';
import 'package:todo/model.dart/Task.dart';

part 'Group.g.dart';

@HiveType(typeId: 0)
class Group extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final List<Task> tasks;
  Group({required this.title, required this.tasks});
}


// Future<void> openHiveBoxes() async {
//   await Hive.openBox<Group>('groupss');
//   await Hive.openBox<Task>('tasks');
// }

// void saveCategory(Group group) async {
//   final categoriesBox = await Hive.openBox<Group>('groupss');
//   categoriesBox.add(group);
// }

// Future<List<Group>> getCategories() async {
//   final categoriesBox = await Hive.openBox<Group>('groupss');
//   return categoriesBox.values.toList();
// }
