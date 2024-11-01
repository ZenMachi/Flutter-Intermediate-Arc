import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<int> items = [26, 45];
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated List Project"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final randNumber = Random().nextInt(100);
          const index = 0;
          items.insert(index, randNumber);
          listKey.currentState?.insertItem(index);
        },
        child: const Icon(Icons.add),
      ),
      body: AnimatedList(
        key: listKey,
        initialItemCount: items.length,
        itemBuilder: (context, index, animation) {
          return MyItem(
            item: items[index],
            animation: animation,
            onDelete: () {
              final item = items.removeAt(index);
              listKey.currentState?.removeItem(
                index,
                (_, animation) => MyItem(item: item, animation: animation),
              );
            },
          );
        },
      ),
    );
  }
}

class MyItem extends StatelessWidget {
  final int item;
  final Animation<double> animation;
  final Function()? onDelete;

  const MyItem(
      {super.key, required this.item, required this.animation, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: const Offset(0, 0),
      ).animate(animation),
      child: Card(
        color: Colors.primaries[item % Colors.primaries.length],
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Text(
                "Number $item",
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
              IconButton(
                onPressed: () => onDelete!(),
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
