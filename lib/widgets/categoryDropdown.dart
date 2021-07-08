import 'package:flutter/material.dart';

class FlutteriansCategroyDropdown extends StatefulWidget {
  final Function currentCatHandler;
  const FlutteriansCategroyDropdown({required this.currentCatHandler, Key? key})
      : super(key: key);

  @override
  _FlutteriansCategroyDropdownState createState() =>
      _FlutteriansCategroyDropdownState();
}

class _FlutteriansCategroyDropdownState
    extends State<FlutteriansCategroyDropdown> {
  final List<String> _category = [
    "Programming",
    "Gaming",
    "Educational",
    "Work",
    "Exercise",
    "Reading",
  ];
  String _currentItem = "Programming";
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      underline: Container(),
      iconSize: 40,
      iconEnabledColor: Theme.of(context).primaryColorDark,
      iconDisabledColor: Theme.of(context).errorColor,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).primaryColor,
      ),
      value: _currentItem,
      onChanged: (String? val) {
        setState(() {
          _currentItem = val!;
          widget.currentCatHandler(_currentItem);
        });
      },
      items: _category.map((String catItem) {
        return DropdownMenuItem(
          value: catItem,
          child: Text(catItem),
        );
      }).toList(),
    );
  }
}
