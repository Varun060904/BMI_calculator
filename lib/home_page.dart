import 'dart:ffi';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _textController1 = TextEditingController();
  final _textController2 = TextEditingController();
  final _textController3 = TextEditingController();
  double weight = 1;
  double height = 1;
  int age = 1;
  double bmi = 1;
  String _bmi = "";
  double bmi_2 = 1;
  String ratings = "";
  var color = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Center(child: Text('BMI Calculator')),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text('Check Your BMI',
                style: TextStyle(
                    fontSize: 50, 
                    fontWeight: FontWeight.w300,
                foreground: Paint() ..color=Colors.black ..strokeWidth=2 ..style=PaintingStyle.stroke,
                ),
                textAlign: TextAlign.center),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: Text(
                  _bmi,
                  style: const TextStyle(fontSize: 40,fontWeight: FontWeight.w300,),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  ratings,
                  style: const TextStyle(fontSize: 40,fontWeight: FontWeight.w300,),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: _textController3,
              decoration: InputDecoration(
                  hintText: 'Whats\'s your Age? (Years)',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: () {
                        _textController3.clear();
                      },
                      icon: const Icon(Icons.clear))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: _textController1,
              decoration: InputDecoration(
                  hintText: 'What\'s your Weight? (Kg)',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: () {
                        _textController1.clear();
                      },
                      icon: const Icon(Icons.clear))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: _textController2,
              decoration: InputDecoration(
                  hintText: 'Whats\'s your Height? (Cm)',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: () {
                        _textController2.clear();
                      },
                      icon: const Icon(Icons.clear))),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                setState(() {
                  weight = double.parse(_textController1.text);
                  height = double.parse(_textController2.text);
                  height = (height / 100);

                  bmi = weight / (height * height);
                  _bmi = bmi.toStringAsFixed(2);
                  bmi_2 = double.parse(_bmi);
                  bmi_2 = double.parse(_bmi);
                  if (bmi_2 < 18.5) {
                    ratings = "Underweight Eat !";
                    color = Colors.yellowAccent.shade100;
                  } else if (bmi_2 < 25 && bmi_2 > 18.5) {
                    ratings = "Normal Yaay !";
                    color = Colors.greenAccent.shade100;
                  } else if (bmi_2 > 25 && bmi_2 < 30) {
                    ratings = "Overweight Oops !";
                    color = Colors.orangeAccent.shade100;
                  } else {
                    ratings = "Obese Bruh !";
                    color = Colors.redAccent.shade100;
                  }
                  clear_(_textController1, _textController2,_textController3);
                });
              },
              minWidth: 150,
              color: Colors.black54,
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.white,letterSpacing: 1.5)
              ),
            )
          ],
        ),
      ),
    );
  }
  void clear_(var t1,var t2,var t3){
    t1.clear();
    t2.clear();
    t3.clear();
    return ;
  }
}
