import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
  }
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _heightSliderValue = 170;
  double _weightSliderValue = 70;
  double _bmi = 0;
  String _message = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("BMI Calculator")),
        body: Center(
          child: Column(children: [
            Text(
              "BMI Calculator",
              style: TextStyle(fontSize: 40, color: Colors.red),
            ),
            Image.network(
                "https://toppng.com/uploads/preview/heart-transparent-love-wallpaper-background-p-and-s-love-11563203477g7xhqpucns.png"),
                    Text(
              "We care about your health",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Height (${_heightSliderValue.round()} cm)"),
            Slider(
              value: _heightSliderValue,
              max: 200,
              label: _heightSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _heightSliderValue = value;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text("Weight: (${_weightSliderValue.round()} Kg)"),
            Slider(
              value: _weightSliderValue,
              max: 200,
              label: _weightSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _weightSliderValue = value;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextButton.icon(
                onPressed: () {
                  // when u do flutter or react, there is the motion of state
                  // state means update the value
                  //you use =
                  //in our case we want to  set the value and refresh the screen
                  var bmiTemp = _weightSliderValue / pow((_heightSliderValue / 100),2);
                  var messageTemp = "";
                  if (bmiTemp < 18){
                    messageTemp = "You're underweight";

                  }
                  else if( bmiTemp <25){
                    messageTemp = " You're normal";
                  }
                  else if ( bmiTemp <30){
                    messageTemp = "You're overweight";
                  }
                  else {
                    messageTemp ="You're obese";
                  }

                  setState((){
                    _bmi = bmiTemp;
                    _message = messageTemp;
                  });

                  // Add a new message at the bottom of BMI calculation
                  //If the bmi <18 => you're underweight
                  //if bmi > 18 <25 you're normal
                  // 25>> 30 you're overweight
                  //>> 30 => you're obese

                  print("Your BMI is ${_bmi.round()}");
                },
                icon: Icon(Icons.favorite),

                label: Text("Calculate")),
           _bmi !=0 ? Text("Your bmi is ${_bmi.round()}") :SizedBox(), // COnditional rendering
            Text(_message)
          ]),
        ));
  }
}
