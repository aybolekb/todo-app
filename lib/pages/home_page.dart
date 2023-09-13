import 'package:flutter/material.dart';
import 'package:todo/main.dart';
import 'package:todo/models/group.dart';
import 'package:todo/utils/container_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        title: Container(
          child: const Text(
            'Lists',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ContainerView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showBottomSheet(context);
        },
        tooltip: 'Increment',
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    TextEditingController textController2 = TextEditingController();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 15,
                right: 15),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                      controller: textController2,
                      decoration: const InputDecoration(
                          fillColor: Colors.red,
                          labelText: ' Group name',
                          border: OutlineInputBorder())),
                  const SizedBox(
                    height: 20,
                  ),

                  FilledButton(
                      onPressed: () {
                        groups.add(Group(title: textController2.text));
                        Navigator.pop(context);
                      },
                      style: FilledButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 115),
                        child: Text("Create group"),
                      )),
                  const SizedBox(
                    height: 20,
                  )
                  // Add more items as needed
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
