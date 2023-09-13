import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/main.dart';

import '../models/group.dart';
import '../models/task.dart';

class TaskPage extends StatefulWidget {
  final Group group;

  const TaskPage({super.key, required this.group});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  void addTask(String taskTitle) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showNewTaskDialog(context);
          },
          tooltip: 'Increment',
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
        appBar: AppBar(
            backgroundColor: Colors.grey.shade200,
            title: Text(
              widget.group.title,
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Work",
                style: TextStyle(
                    color: Colors.blue,
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
                child: Row(
                  children: const [
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
              ValueListenableBuilder(
                  valueListenable: tasks.listenable(),
                  builder: (context, value, child) {
                    final List<Task> groupTasks = getGroupTasks(value);

                    return Expanded(
                      child: ListView.builder(
                          itemCount: groupTasks.length,
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
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      color: Colors.white,
                                      child: Row(children: [
                                        Checkbox(
                                            value:
                                                groupTasks[index].isCompleted,
                                            onChanged: (newValue) {
                                              setState(() {
                                                groupTasks[index].isCompleted =
                                                    newValue!;
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
                                              groupTasks[index].title,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const Text(
                                              "Create website mockup",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey),
                                            )
                                          ],
                                        )
                                      ]),
                                    )),
                              ),
                            );
                          }),
                    );
                  })
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
                tasks.add(Task(
                    id: 0,
                    groupTitle: widget.group.title,
                    title: newTaskTitle));
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

  List<Task> getGroupTasks(Box value) {
    final List<Task> task = [];
    for (Task element in value.values) {
      if (element.groupTitle == widget.group.title) {
        task.add(element);
      }
    }

    return task;
  }
}
