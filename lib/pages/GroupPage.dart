import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/data.dart';
import 'package:todo/model.dart/Group.dart';
import 'package:todo/model.dart/Task.dart';

class GroupPage extends StatefulWidget {
  final Group group;

  const GroupPage({super.key, required this.group});

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  List<Task> tasks = [];
  void addTask(String taskTitle) {
    final newTask = Task('hello', 1);
    widget.group.tasks.add(newTask);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showNewTaskDialog(context);
          },
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          tooltip: 'Increment',
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
        appBar: AppBar(
            backgroundColor: Colors.grey.shade200,
            title: const Text(
              "Lists",
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Work",
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "12 task 4 completed",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: 28,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Search',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                          child: Slidable(
                              key: const ValueKey(0),
                              endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      onPressed: (value) {},
                                      flex: 1,
                                      backgroundColor: Colors.white,
                                      foregroundColor: Colors.red,
                                      icon: Icons.delete,
                                    )
                                  ]),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                color: Colors.white,
                                child: Row(children: [
                                  Checkbox(
                                      value: tasks[index].isCompleted,
                                      onChanged: (newValue) {
                                        setState(() {
                                          tasks[index].isCompleted = newValue!;
                                        });
                                      }),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        tasks[index].title,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const Text(
                                        "Create website mockup",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      )
                                    ],
                                  )
                                ]),
                              )),
                        ),
                      );
                    }),
              )
            ],
          ),
        ));
  }

  void _showNewTaskDialog(BuildContext context) {
    String newTaskTitle = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('New Task'),
          content: TextField(
            onChanged: (value) {
              newTaskTitle = value;
            },
            decoration: const InputDecoration(labelText: 'Task title'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  tasks.add(Task(newTaskTitle, 2));
                });
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('cancel'),
            ),
          ],
        );
      },
    );
  }
}
