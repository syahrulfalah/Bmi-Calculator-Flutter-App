import 'package:flutter/material.dart';
import 'package:bmi_app/models/ResponseNews.dart';
import 'package:flutter/cupertino.dart';
import 'package:bmi_app/news_item.dart';

class NewsPage extends StatelessWidget {
  ResponseNews responseNews;

  NewsPage(this.responseNews);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            margin : EdgeInsets.only(top: 18),
            child: ListView.builder(
                itemCount: responseNews.articles.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index){
                  return NewsItem(
                    imgurl: responseNews.articles[index].urlToImage ?? "",
                    title: responseNews.articles[index].title ?? "",
                    decs: responseNews.articles[index].description ?? "",
                    content: responseNews.articles[index].content ?? "",
                    posturl: responseNews.articles[index].url ?? "",
                    name: responseNews.articles[index].source.name ?? "",
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}
