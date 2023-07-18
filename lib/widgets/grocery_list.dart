import 'package:flutter/material.dart';
import 'package:timetracker/data/dummy_items.dart';
import 'package:timetracker/models/grocery_item.dart';
import 'package:timetracker/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final _groceryItems = groceryItems;

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text("Add Groceries"),
    );

    if (_groceryItems.length != 3) {
      content = GroveryListView(groceryItems: _groceryItems);
      ;
    } else {
      content = Stack(
        children: <Widget>[
          GroveryListView(groceryItems: _groceryItems),
          content
        ],
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Groceries'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () async {
                final newGroceryItem =
                    await Navigator.of(context).push<GroceryItem>(
                  MaterialPageRoute(
                    builder: (ctx) => const NewItem(),
                  ),
                );
                if (newGroceryItem != null) {
                  setState(() {
                    _groceryItems.add(newGroceryItem);
                  });
                }
              },
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: content);
  }
}

class GroveryListView extends StatelessWidget {
  const GroveryListView({
    super.key,
    required List<GroceryItem> groceryItems,
  }) : _groceryItems = groceryItems;

  final List<GroceryItem> _groceryItems;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _groceryItems.length,
      itemBuilder: (ctx, index) => ListTile(
        title: Text(_groceryItems[index].taskDetails),
        leading: Container(
          width: 24,
          height: 24,
          child: Text(_groceryItems[index].taskTime.toString()),
        ),
        trailing: Text(
          _groceryItems[index].taskId.toString(),
        ),
      ),
    );
  }
}
