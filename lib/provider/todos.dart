import 'package:firestore_todo/models/todo.dart';
import 'package:flutter/material.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(
      createdTime: DateTime.now(),
      title: "Buy food 🍔 🍕 🍇 🍏",
    ),
    Todo(
      createdTime: DateTime.now(),
      title: "Plan vacation",
      description: '''rent a hotel, rent a car, pack my bag''',
    ),
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();
}
