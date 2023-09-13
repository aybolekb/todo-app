import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/utils/card_list.dart';

import '../main.dart';

class ContainerView extends StatelessWidget {
  const ContainerView({super.key});

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
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: ValueListenableBuilder(
                  valueListenable: groups.listenable(),
                  builder: (context, value, child) {
                    if (value.length == 0) {
                      return const Icon(Icons.add_box_rounded, size: 40);
                    }
                    return GridView.builder(
                      itemCount: groups.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 25.0,
                        childAspectRatio: 1.5,
                        crossAxisSpacing: 18.0,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        final item = value.getAt(index);
                        return CardList(
                          name: item.title,
                          description: "kndw",
                          value: 30,
                          group: item,
                        );
                      },
                    );
                  })),
        ],
      ),
    );
  }
}
