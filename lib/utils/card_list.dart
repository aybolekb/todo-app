import 'package:flutter/material.dart';
import 'package:todo/pages/task_page.dart';

import '../models/group.dart';

class CardList extends StatelessWidget {
  final Group group;
  const CardList(
      {super.key,
      required this.name,
      required this.description,
      required this.value,
      required this.group});
  final String name;
  final String description;
  final double value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => TaskPage(group: group)));
      },
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                description,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.all(
                    Radius.circular(10)), // Adjust the radius as needed
                child: LinearProgressIndicator(
                  value: value,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                      Color.fromARGB(255, 77, 183, 58)),
                  minHeight:
                      8, // Adjust this value to set the progress (0.0 to 1.0)
                  backgroundColor: Colors.grey, // Background color
                ),
              ),
            ]),
      ),
    );
  }
}
