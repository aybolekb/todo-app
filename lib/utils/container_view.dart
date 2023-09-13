import 'package:flutter/material.dart';
import 'package:todo/data.dart';
import 'package:todo/model.dart/Group.dart';
import 'package:todo/utils/card_list.dart';

class ContainerView extends StatelessWidget {
  ContainerView({super.key});

  final List<Map<String, dynamic>> itemList = [
    {
      "name": "Work",
      "description": "16 task 4 completed",
      "value": 0.6,
    },
    {
      "name": "Study",
      "description": "10 chapters 7 completed",
      "value": 0.7,
    },
    {
      "name": "Exercise",
      "description": "3 miles run",
      "value": 0.3,
    },
    {
      "name": "Hobby",
      "description": "Painting",
      "value": 0.4,
    },
    {
      "name": "Chores",
      "description": "House cleaning",
      "value": 0.2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
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
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: GridView.builder(
            itemCount: groups.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 25.0,
              childAspectRatio: 1.5,
              crossAxisSpacing: 18.0,
            ),
            itemBuilder: (BuildContext context, int index) {
              final item = groups[index];
              return CardList(
                name: item.title,
                description: "kndw",
                value: 30,
                group: groups[index],
              );
            },
          )),
        ],
      ),
    );
  }
}
