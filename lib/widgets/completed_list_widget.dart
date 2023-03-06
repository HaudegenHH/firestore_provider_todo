import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firestore_todo/provider/todos.dart';
import 'package:firestore_todo/widgets/todo_widget.dart';

class CompletedListWidget extends StatelessWidget {
  const CompletedListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.completedTodos;
    return todos.isEmpty
        ? const Center(
            child: Text("No completed todos",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )))
        : ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return TodoWidget(
                todo: todo,
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                Container(height: 8),
          );
  }
}
