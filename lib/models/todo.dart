// ignore_for_file: public_member_api_docs, sort_constructors_first
class TodoField {
  static const createdTime = 'createdTime';
}

class Todo {
  DateTime createdTime;
  String? id;
  String title;
  String description;
  bool isDone;

  Todo({
    required this.createdTime,
    required this.title,
    this.description = '',
    this.id,
    this.isDone = false,
  });
}
