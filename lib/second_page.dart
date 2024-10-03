import 'package:bmi_application/bmi_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class second_page extends StatefulWidget {
  second_page({super.key, required this.iswoma});
  bool iswoma;

  @override
  State<second_page> createState() => _HomePageState();
}

class _HomePageState extends State<second_page> {
  @override
  double _weight = 20;
  double _height = 20;

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'vazir'),
      home: Scaffold(
        backgroundColor: Colors.indigo[170],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Image.asset(
                          widget.iswoma ? 'images/1.png' : 'images/2.png'),
                      width: 320,
                      height: 320,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'وزن خود را مشخص کنید ',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 380,
                      height: 100,
                      child: Slider(
                          activeColor: Colors.green,
                          thumbColor: Colors.black,
                          min: 0.0,
                          max: 270.0,
                          value: _weight,
                          divisions: 150,
                          label: '${_weight.round()}',
                          onChanged: (value) {
                            setState(() {
                              _weight = value;
                            });
                          }),
                    ),
                    Text(
                      'قد خود را مشخص کنید',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 380,
                      height: 100,
                      child: Slider(
                          thumbColor: Colors.black,
                          activeColor: Colors.indigo[500],
                          min: 0.0,
                          max: 270.0,
                          value: _height,
                          divisions: 150,
                          label: '${_height.round()}',
                          onChanged: (value) {
                            setState(() {
                              _height = value;
                            });
                          }),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(260, 40),
                      side: BorderSide(color: Colors.black)),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            bmi_page(weight: _weight, height: _height),
                      ),
                    );
                  },
                  child: Text(
                    'محاسبه کن',
                    style: TextStyle(fontSize: 19, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
