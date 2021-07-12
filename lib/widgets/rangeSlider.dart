import 'package:flutter/material.dart';

class FlutteriansRangeSlider extends StatefulWidget {
  const FlutteriansRangeSlider({Key? key}) : super(key: key);

  @override
  _FlutteriansRangeSliderState createState() => _FlutteriansRangeSliderState();
}

class _FlutteriansRangeSliderState extends State<FlutteriansRangeSlider> {
  RangeValues _currentRangeVal1 = RangeValues(0, 100);
  RangeValues _currentRangeVal2 = RangeValues(0, 100);
  RangeValues _currentRangeVal3 = RangeValues(0, 100);
  double start2 = 0;
  double start3 = 0;

  @override
  Widget build(BuildContext context) {
    print(
        "START2: ${_currentRangeVal2.start} - END2: ${_currentRangeVal2.end}");
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
                    start2 = val.end;
                    _currentRangeVal2 = RangeValues(start2, 100);
                    print("START2: $start2");
                  });
                }),
            SizedBox(height: 20),
            RangeSlider(
                values: _currentRangeVal2,
                min: 0,
                max: 100,
                divisions: 5,
                labels: RangeLabels(
                  start2.round().toString(),
                  100.round().toString(),
                ),
                onChanged: (val) {
                  setState(() {
                    _currentRangeVal2 = val;
                    start3 = val.end;
                    _currentRangeVal3 = RangeValues(start3, 100);
                  });
                }),
            SizedBox(height: 20),
            RangeSlider(
                values: _currentRangeVal3,
                min: 0,
                max: 100,
                divisions: 5,
                labels: RangeLabels(
                  start3.round().toString(),
                  100.round().toString(),
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
