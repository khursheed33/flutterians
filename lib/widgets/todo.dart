import 'package:flutter/material.dart';
import 'package:flutterians/constants.dart';
import 'package:flutterians/models/todoModel.dart';
import 'package:flutterians/widgets/createTodo.dart';
import 'package:flutterians/widgets/todoList.dart';
import 'package:intl/intl.dart';

class FlutteriansTodo extends StatefulWidget {
  FlutteriansTodo({Key? key}) : super(key: key);

  @override
  _FlutteriansTodoState createState() => _FlutteriansTodoState();
}

class _FlutteriansTodoState extends State<FlutteriansTodo> {
  final _inputText = TextEditingController();
  List<TodoModel> _todos = [
    TodoModel(
      todoId: "xmsnsjdf",
      category: "Gaming",
      title: "Football standium for practice",
      date: DateTime.now(),
    ),
    TodoModel(
      todoId: "skjksjjslfdlkf",
      category: "Programming",
      title: "Java and Python Practice on HackerRank",
      date: DateTime.now(),
    ),
  ];
  void createTodo(TodoModel todo) {
    setState(() {
      _todos.add(todo);
    });
  }

  void deleteTodo(String _todoId) {
    _todos.removeWhere((todo) => todo.todoId == _todoId);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                // color: Colors.red,
                height: MediaQuery.of(context).size.height * 0.35,
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  children: [
                    // Profile Section
                    Row(
                      children: [
                        Container(
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(
                              profileImage,
                            ),
                            backgroundColor: Colors.blue,
                          ),
                        ),
                        Spacer(),
                        Container(
                          child: Text(
                            "Maira C.",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              // color: normalText,
                              letterSpacing: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Title
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "My Daily Activities",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          // color: Colors.white,
                          letterSpacing: 1.3,
                        ),
                      ),
                    ),
                    // Date
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${DateFormat.yMMMd().format(DateTime.now())} | ${DateFormat.j().format(DateTime.now())}",
                        style: TextStyle(
                          color: lightText,
                          letterSpacing: 1.3,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Create Todo
                    FlutteriansCreateTodo(
                      inputText: _inputText,
                      todos: _todos,
                      todoHandler: createTodo,
                    )
                  ],
                ),
              ),
              // List of Todo
              Container(
                // color: Colors.blue,
                height: MediaQuery.of(context).size.height * 0.62,
                child: _todos.length == 0
                    ? Center(
                        child:
                            Text("There is no Todo to show! Please add one."),
                      )
                    : FlutteriansTodoList(
                        todoDeleteHandler: deleteTodo,
                        todos: _todos,
                        key: UniqueKey(),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
