import 'package:flutter/material.dart';

import 'package:timetracker/data/categories.dart';
import 'package:timetracker/models/grocery_item.dart';
import 'package:timetracker/models/mycategory.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  var _enteredName = '';
  var _enteredTaskDetails = '';
  var _enteredWeek = '';
  var _enteredQuantity = 0;
  var _enteredCategory = categories[Categories.development];

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 100,
                decoration: const InputDecoration(
                  label: Text('Task Details'),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.length >= 100) {
                    return 'Must be between 1 and 100 characters.';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _enteredTaskDetails = newValue!;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      maxLength: 11,
                      decoration: const InputDecoration(
                        label: Text('User Name'),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.trim().length <= 1 ||
                            value.length >= 11) {
                          return 'Must be between 1 and 11 characters.';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        _enteredName = newValue!;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      maxLength: 2,
                      decoration: const InputDecoration(
                        label: Text('WeekNo'),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.trim().length <= 1 ||
                            value.length >= 2) {
                          return 'Must be between 1 and 2 characters.';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        _enteredWeek = newValue!;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Time%'),
                      ),
                      initialValue: '1',
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return 'Must be valid, positive number';
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        _enteredQuantity = int.parse(newValue!);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField(
                        value: _enteredCategory,
                        items: [
                          for (final category in categories.entries)
                            DropdownMenuItem(
                              value: category.value,
                              child: Row(
                                children: [
                                  Container(
                                    width: 16,
                                    height: 16,
                                    child:
                                        Text(category.value.taskId.toString()),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(category.value.taskType),
                                ],
                              ),
                            )
                        ],
                        onChanged: (newValue) {
                          setState(() {
                            _enteredCategory = newValue;
                          });
                        }),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _formkey.currentState!.reset();
                    },
                    child: Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        _formkey.currentState!.save();
                        print(_enteredName);
                        print(_enteredQuantity.toString());
                        print(_enteredCategory!.taskType);
                        Navigator.of(context).pop(GroceryItem(
                            userName: _enteredName,
                            weekNo: int.parse(_enteredWeek),
                            year: DateTime.now().year,
                            buId: _enteredCategory!.buId,
                            taskId: _enteredCategory!.taskId,
                            taskDetails: _enteredTaskDetails,
                            taskTime: _enteredQuantity,
                            workingDays: 5,
                            createdBy: _enteredName));
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
