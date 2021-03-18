import 'package:bmi_app/helper/widget.dart';
import 'package:flutter/material.dart';
import 'package:bmi_app/helper/data_request.dart';
import 'package:flutter/widgets.dart';
import 'package:bmi_app/news_page.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  News news = News();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myAppBar(),
      body: SafeArea(
        child: FutureBuilder(
          future: news.getNews(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return NewsPage (snapshot.data);
            } else if (snapshot.hasError){
              print(snapshot.error);
              return Center(child: Text("Data tidak tersedia"));
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
