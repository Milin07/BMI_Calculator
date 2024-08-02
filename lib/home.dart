import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController weight = TextEditingController();
  TextEditingController height = TextEditingController();

  double? bmiresult = 0;
  void calculate_BMI() {
    double ht = double.parse(height.text) / 100;
    double wt = double.parse(weight.text);
    double result = wt / (ht * ht);
    setState(() {});
    bmiresult = result;
  }

  String Category({required double bmiresult}) {
    if (bmiresult < 1) {
      return '';
    } else if (bmiresult < 18.5) {
      return 'Underweight';
    } else if (bmiresult <= 24.9) {
      return 'Normal Weight';
    } else if (bmiresult <= 29.9) {
      return 'Overweight';
    } else if (bmiresult <= 34.9) {
      return 'Obesity Class I';
    } else if (bmiresult <= 39.9) {
      return 'Obesity Class II';
    } else {
      return 'Obesity Class III';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
          appBar: AppBar(
            title: Text("BMI Calculator",style: TextStyle(color: Colors.amber[500]),),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: Container(
            padding: EdgeInsets.all(10.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Enter Weight",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.amber[800],
                  )),
              TextField(
                controller: weight,
                style: TextStyle(color:Colors.amber[200]),
                decoration: InputDecoration(
                    hintText: "Enter Weight in kg",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange,width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange))),
              ),
              SizedBox(height: 20.0),
              Text("Enter Height:",
                  style: TextStyle(fontSize: 20.0, color: Colors.amber[800])),
              TextField(
                  controller: height,
                  style: TextStyle(color: Colors.amber[200]),
                  decoration: InputDecoration(
                      hintText: "Enter height in cm",
                      
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange,width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange)))),
              SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                    onPressed: () {
                      calculate_BMI();
                    },
                    child: Text(
                      "Calculate BMI",
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                      textAlign: TextAlign.center,
                    )),
              ),
              SizedBox(height: 20.0),
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.amber[300],
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Column(
                    children: [
                      Text(
                        "Result:${bmiresult!.toStringAsFixed(2)}",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        Category(bmiresult: bmiresult!),
                        style: TextStyle(fontSize: 20.0),
                      )
                    ],
                  )),
            ]),
          )),
    );
  }
}
