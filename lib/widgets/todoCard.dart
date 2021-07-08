import 'dart:math' as Math;
import 'package:flutter/material.dart';
import 'package:flutterians/models/todoModel.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

class FlutteriansTodoCard extends StatelessWidget {
  final int? index;
  final Function? todoDelete;
  final List<TodoModel>? todos;
  FlutteriansTodoCard(
      {@required this.todoDelete, @required this.todos, this.index, Key? key})
      : super(key: key);
  // List<Color?>  colors(){
  //   return
  // }
  @override
  Widget build(BuildContext context) {
    final rand = Math.Random();
    final myColor = Color(rand.nextInt(0xFFFFFFFF));

    return Dismissible(
      direction: DismissDirection.startToEnd,
      key: ValueKey(index),
      background: Container(
        color: myColor,
        alignment: Alignment.centerLeft,
        child: Icon(
          Icons.done_all,
          size: 30,
          color: Colors.white,
        ),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          final response = await showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text(
                "Are you sure?",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              content: Text(
                "This is an Irresversible Process, Once deleted will be gone forever.",
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      todoDelete!(todos![index!].todoId);
                      Navigator.of(ctx).pop(true);
                    },
                    child: Text("Yes")),
                TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop(false);
                    },
                    child: Text("Cancel")),
              ],
            ),
          );

          return response;
        } else {
          print("Right Swipe");
        }
        return null;
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        constraints: BoxConstraints(minHeight: 40, maxHeight: 120),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(colors: [
            myColor.withOpacity(0.0),
            myColor.withOpacity(0.1),
            myColor.withOpacity(0.3),
          ]),
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: myColor,
                width: 3,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Container(
                  child: Text(
                    "${todos![index!].category}",
                    style: TextStyle(
                        color: myColor,
                        fontSize: 16,
                        letterSpacing: 1.3,
                        fontWeight: FontWeight.w500,
                        shadows: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 1,
                            offset: Offset(1, 1),
                          ),
                        ]),
                  ),
                ),
                // Todo Text
                SizedBox(height: 5),
                Expanded(
                  child: Text(
                    "${todos![index!].title}",
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 1.3,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  child: Text(
                    "${DateFormat.yMEd().format(todos![index!].date!)}",
                    style: TextStyle(
                      color: lightText,
                      fontSize: 14,
                      letterSpacing: 1.3,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
