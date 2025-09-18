import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(myBmi());
}

class myBmi extends StatelessWidget {
  const myBmi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BmiHome(),
    );
  }
}

class BmiHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BmiHomeState();
  }
}

class BmiHomeState extends State<BmiHome> {
  TextEditingController inchController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController feetController = TextEditingController();
  double bmi = 0.0;
  String type = "";
  Color bgColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Measure You BMI",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox.square(
              dimension: 20,
            ),
            TextField(
              controller: weightController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.more_horiz),
                hintText: "Weight",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox.square(
              dimension: 20,
            ),
            TextField(
              controller: feetController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.upgrade_sharp),
                hintText: "Feet",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox.square(
              dimension: 20,
            ),
            TextField(
              controller: inchController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.insert_chart_outlined),
                hintText: "Inch",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox.square(
              dimension: 20,
            ),
            TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.blueAccent),
                onPressed: () {
                  calculateBMI();
                },
                child: Text(
                  "Calculate BMI",
                  style: TextStyle(color: Colors.white),
                )),
            SizedBox.square(
              dimension: 20,
            ),
           bmi == 0.0 ? Container() : Text("Your BMI Is: ${bmi.toStringAsFixed(2)}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey),),
            type == "" ? Container() : Text("You are : $type",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey),)
          ],
        ),
      ),
    );
  }
  /// BMI calculation Here...///
  void calculateBMI() {
    double weight = double.parse(weightController.text);
    double feet = double.parse(feetController.text);
    double inch = double.parse(inchController.text);
    double totalInch = (feet * 12) + inch;
    double totalCm = totalInch * 2.54;
    double totalM = totalCm / 100;
    /// to get the type from bmi (healthy, overweight and underweight)///
    if(bmi > 25){
      type = "Overweight";
      bgColor = Colors.red.shade200;
    }else if(bmi < 18.5){
      type = "Underweight";
      bgColor = Colors.red.shade100;
    }else{
      type = "Healthy";
      bgColor = Colors.green.shade200;
    }
    setState(() {
      bmi = weight / (pow(totalM, 2.0));
      weightController.text = "";
      feetController.text = "";
     inchController.text = "";
    });
    print(bmi);
  }
}
