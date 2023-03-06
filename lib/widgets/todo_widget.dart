import 'package:flutter/material.dart';
import 'package:firestore_todo/models/todo.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  const TodoWidget({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Scrollable(
          viewportBuilder: (BuildContext context, _) => Slidable(
            key: ValueKey(todo.id),
            startActionPane: ActionPane(
              motion: const DrawerMotion(),
              dismissible: DismissiblePane(onDismissed: () {}),
              children: [
                SlidableAction(
                  onPressed: (_) {
                    //print("tapped");
                  },
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue.shade600,
                  icon: Icons.edit,
                  label: 'Edit',
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: const DrawerMotion(),
              dismissible: DismissiblePane(onDismissed: () {}),
              children: [
                SlidableAction(
                  onPressed: (_) {},
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red.shade400,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),
            child: buildTodo(context),
          ),
        ),
      );

  Widget buildTodo(BuildContext context) => Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: Row(
          children: [
            Checkbox(
              activeColor: Theme.of(context).primaryColor,
              checkColor: Colors.white,
              value: todo.isDone,
              onChanged: (_) {},
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontSize: 22,
                    ),
                  ),
                  todo.description.isNotEmpty
                      ? Container(
                          margin: const EdgeInsets.only(top: 4),
                          child: Text(
                            todo.description,
                            style: const TextStyle(fontSize: 20, height: 1.5),
                          ),
                        )
                      : Container()
                ],
              ),
            )
          ],
        ),
      );
}
