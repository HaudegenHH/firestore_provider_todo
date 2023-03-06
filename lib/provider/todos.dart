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
  List<Todo> get completedTodos =>
      _todos.where((todo) => todo.isDone == true).toList();

  void addTodo(todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();

    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;

    notifyListeners();
  }
}
