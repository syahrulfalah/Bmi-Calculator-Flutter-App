import 'package:bmi_app/calculator.dart';
import 'package:bmi_app/view/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Halsatu(),
    );
  }
}

class Halsatu extends StatefulWidget {
  @override
  _HalsatuState createState() => _HalsatuState();
}

class _HalsatuState extends State<Halsatu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SingleChildScrollView (
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 150.0
                ),
                Container(
                  width: double.infinity,
                  child : Text(
                  "Hai! Mau apa hari ini?",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black54
                  ),
                ),
                ),
                SizedBox(height: 50.0
                ),
                Container(
                  width: double.infinity,
                  height: 80.0,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return BmiCalculator();
                      }));
                    },
                    color: Colors.blue,
                    child: Text(
                      "Menghitung BMI",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 30.0
                ),
                Container(
                  width: double.infinity,
                  height: 80.0,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),

                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Homepage();
                      }));
                    },
                    color: Colors.blue,
                    child: Text(
                      "Membaca artikel",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                )

              ],
            ),
          ),
      ),
      ),
      );
  }
}
