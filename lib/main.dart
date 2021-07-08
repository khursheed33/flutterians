import 'package:flutter/material.dart';
import 'package:flutterians/screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        brightness: Brightness.light,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      title: 'Flutterians',
      home: FlutteriansHomepage(),
    );
  }
}
