import 'package:flutter/material.dart';
import 'package:todo/data.dart';
import 'package:todo/hive.dart';
import 'package:todo/model.dart/Group.dart';
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
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
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
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)))),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 115),
                        child: Text(
                          "Create group",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
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
