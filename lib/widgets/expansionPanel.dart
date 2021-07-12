import 'package:flutter/material.dart';

class FlutteriansExpansionPanel extends StatefulWidget {
  const FlutteriansExpansionPanel({Key? key}) : super(key: key);

  @override
  _FlutteriansExpansionPanelState createState() =>
      _FlutteriansExpansionPanelState();
}

class _FlutteriansExpansionPanelState extends State<FlutteriansExpansionPanel> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Expansion"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            // Expansion
            PhysicalModel(
              color: Colors.black,
              elevation: 5,
              borderRadius: BorderRadius.circular(100),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: ExpandIcon(
                  size: 50,
                  isExpanded: _isExpanded,
                  onPressed: (val) {
                    setState(
                      () {
                        _isExpanded = !_isExpanded;
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
