import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/model.dart/Group.dart';
import 'package:todo/model.dart/Task.dart';
import 'package:todo/pages/home.dart';

import 'package:hive_flutter/adapters.dart';

late Box box;
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(GroupAdapter());
  box = await Hive.openBox<Group>('groups');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
