import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {

  int currentindex = 0;
  String result = "";
  double height = 0;
  double weight = 0;
  String kategori = "";

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final black = Colors.black;
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator",style: TextStyle(color: black),),
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text(
                  "Your Height in Cm :", style: TextStyle(
                    fontSize: 18.0
                ),
                ),
                SizedBox(height: 8.0
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: heightController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Your height in cm",
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                SizedBox(height: 20.0,
                ),

                Text(
                  "Your Weight in Kg :", style: TextStyle(
                    fontSize: 18.0
                ),
                ),
                SizedBox(height: 8.0
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: weightController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Your Weight in Kg",
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 60.0,
                ),

                Container(
                  width: double.infinity,
                  height: 50.0,
                  child: FlatButton(

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),

                    onPressed: () {
                      setState(() {
                        height = double.parse(heightController.value.text);
                        weight = double.parse(weightController.value.text);

                      });
                      calculateBmi(height, weight);
                    },
                    color: Colors.blue,
                    child: Text("Calculate", style: TextStyle(color: Colors.white
                    ),),
                  ),
                ),
                SizedBox(height: 20.0
                ),
                Container(
                  width: double.infinity,
                  height: 50.0,
                  child: OutlineButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),

                    onPressed: () {
                        heightController.text = "";
                        weightController.text = "";
                    },

                    child: Text("Reset", style: TextStyle(color: Colors.black38
                    ),),
                  ),
                ),
                SizedBox(height: 50.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text("Your BMI is :",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 50),
                  width: double.infinity,
                  child: Text("$result",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 25),

                  width: double.infinity,
                  child: Text("$kategori",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculateBmi(double height, double weight){
    double finalresult = weight/ (height*height/10000);
    String bmi = finalresult.toStringAsFixed(2);
    setState(() {
      result = bmi;
      if( finalresult <= 18 )
      {
        kategori = " You are underweight ";
      }
      else if( finalresult <= 30)
      {
        kategori = " You are ideal ";
      }
      else if ( finalresult >= 30 )
      {
        kategori = " You are Overweight ";
      }
    });
  }

  void changeIndex(int index){
    setState(() {
      currentindex = index;
    });
  }


  Widget radioButton(String value, Color color, int index){
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.0),
        height: 80.0,
        child: FlatButton(
          color: currentindex == index ? color : Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),

          onPressed: (){

            changeIndex(index);
          },
          child: Text(value, style: TextStyle(
            color: currentindex == index ? Colors.white : color,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),),
        ),
      ),
    );
  }
}
