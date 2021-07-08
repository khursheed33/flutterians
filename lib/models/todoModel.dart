import 'package:flutter/foundation.dart';

class TodoModel {
  final String? todoId;
  final String? category;
  final String? title;
  final DateTime? date;
  TodoModel({
    @required this.todoId,
    @required this.category,
    @required this.title,
    @required this.date,
  });
}
