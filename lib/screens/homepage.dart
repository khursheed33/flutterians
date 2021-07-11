import 'package:flutter/material.dart';
import 'package:flutterians/widgets/rangeSlider.dart';

class FlutteriansHomepage extends StatelessWidget {
  const FlutteriansHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutteriansRangeSlider(),
    );
  }
}
