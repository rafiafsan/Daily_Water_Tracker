import 'package:flutter/material.dart';
import 'package:water_tracker/widgets/addwaterButton.dart';

class watertracker extends StatefulWidget {
  const watertracker({super.key});

  @override
  State<watertracker> createState() => _watertrackerState();
}

class _watertrackerState extends State<watertracker> {
  int _currentintake = 0;
  final int _goal = 2000;

  void _waterAdd(int amount){
    setState((){
      if(_currentintake < _goal){
        _currentintake = (_currentintake + amount).clamp(0, _goal);
      }
    });
  }
  void resetWater(){
    setState(() {
      _currentintake = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double progress = (_currentintake/_goal).clamp(0.0, 1.0);
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.shade400,
        title: Text(
          "Daily Water Tracker",
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 2,
                    )
                  ]),
              child: Column(
                children: [
                  Text(
                    "Today's Intake",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${_currentintake} ml",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: CircularProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey.shade500,
                    color: Colors.blueAccent,
                    strokeWidth: 10,
                  ),
                ),
                Text(
                  "${(progress * 100).toInt()}%",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Wrap(
              spacing: 13,
              children: [
                addwaterButton(amount: 200,icon: Icons.local_drink, Onclick: () { _waterAdd(200);},),
                addwaterButton(amount: 500,icon: Icons.local_cafe, Onclick: () { _waterAdd(500);},),
                addwaterButton(amount: 100, Onclick: () { _waterAdd(200);},),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                    onPressed: resetWater,
                    child: Text(
                      "Reset",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
