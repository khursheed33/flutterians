import 'package:flutter/material.dart';
import 'package:flutterians/models/todoModel.dart';
import 'package:flutterians/widgets/categoryDropdown.dart';

class FlutteriansCreateTodo extends StatefulWidget {
  FlutteriansCreateTodo({
    Key? key,
    required TextEditingController inputText,
    required List<TodoModel> todos,
    required Function todoHandler,
  })  : _inputText = inputText,
        todos = todos,
        todoHandler = todoHandler,
        super(key: key);
  final Function todoHandler;
  final List<TodoModel> todos;
  final TextEditingController _inputText;

  @override
  _FlutteriansCreateTodoState createState() => _FlutteriansCreateTodoState();
}

class _FlutteriansCreateTodoState extends State<FlutteriansCreateTodo> {
  String? _selectedCategory = 'Programming';
  void updateCategory(String _cat) {
    _selectedCategory = _cat;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                "Category:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            FlutteriansCategroyDropdown(
              currentCatHandler: updateCategory,
            ),
          ],
        ),
        // Create Schedule

        Container(
          margin: const EdgeInsets.only(top: 10),
          child: TextField(
            controller: widget._inputText,
            decoration: InputDecoration(
              labelText: "Create one...",
              labelStyle: TextStyle(fontSize: 16),
              suffixIcon: Container(
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(
                  color: Colors.white,
                  onPressed: () {
                    if (widget._inputText.text.length >= 5) {
                      widget.todoHandler(
                        TodoModel(
                          todoId: DateTime.now().toIso8601String(),
                          category: _selectedCategory,
                          title: widget._inputText.text,
                          date: DateTime.now(),
                        ),
                      );
                    }
                    setState(() {
                      widget._inputText.text = '';
                    });
                  },
                  icon: Icon(Icons.add),
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFFFFFFF)),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
