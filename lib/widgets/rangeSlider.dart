import 'package:flutter/material.dart';

class FlutteriansRangeSlider extends StatefulWidget {
  const FlutteriansRangeSlider({Key? key}) : super(key: key);

  @override
  _FlutteriansRangeSliderState createState() => _FlutteriansRangeSliderState();
}

class _FlutteriansRangeSliderState extends State<FlutteriansRangeSlider> {
  var sliderVal1 = 20.0;
  var sliderVal2 = 40.0;
  var sliderVal3 = 80.0;
  RangeValues _currentRangeVal1 = RangeValues(20, 40);
  RangeValues _currentRangeVal2 = RangeValues(40, 80);
  RangeValues _currentRangeVal3 = RangeValues(80, 100);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Range Slider"),
      ),
      body: Container(
        child: Column(
          children: [
            Text(
              "Range Slider",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            RangeSlider(
                values: _currentRangeVal1,
                min: 0,
                max: 100,
                divisions: 5,
                labels: RangeLabels(
                  _currentRangeVal1.start.round().toString(),
                  _currentRangeVal1.end.round().toString(),
                ),
                onChanged: (val) {
                  setState(() {
                    _currentRangeVal1 = val;
                  });
                }),
            SizedBox(height: 20),
            RangeSlider(
                values: _currentRangeVal2,
                min: _currentRangeVal1.start,
                max: _currentRangeVal2.end,
                divisions: 5,
                labels: RangeLabels(
                  _currentRangeVal2.start.round().toString(),
                  _currentRangeVal2.end.round().toString(),
                ),
                onChanged: (val) {
                  setState(() {
                    _currentRangeVal2 = val;
                  });
                }),
            SizedBox(height: 20),
            RangeSlider(
                values: _currentRangeVal3,
                min: 0,
                max: 100,
                divisions: 5,
                labels: RangeLabels(
                  _currentRangeVal3.start.round().toString(),
                  _currentRangeVal3.end.round().toString(),
                ),
                onChanged: (val) {
                  setState(() {
                    _currentRangeVal3 = val;
                  });
                }),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
