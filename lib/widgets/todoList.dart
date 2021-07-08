import 'package:flutter/material.dart';
import 'package:flutterians/models/todoModel.dart';
import 'package:flutterians/widgets/todoCard.dart';

class FlutteriansTodoList extends StatelessWidget {
  final List<TodoModel>? todos;
  final Function? todoDeleteHandler;
  const FlutteriansTodoList(
      {@required this.todoDeleteHandler, @required this.todos, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos!.length,
      itemBuilder: (ctx, index) {
        return FlutteriansTodoCard(
          todoDelete: todoDeleteHandler,
          index: index,
          todos: todos,
          key: ValueKey(index),
        );
      },
    );
  }
}
