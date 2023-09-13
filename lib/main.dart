import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:todo/pages/home_page.dart';

import 'models/group.dart';
import 'models/task.dart';

late Box groups;
late Box tasks;

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(GroupAdapter());
  groups = await Hive.openBox<Group>('groups');
  tasks = await Hive.openBox<Task>('tasks');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
