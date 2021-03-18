
import 'package:flutter/material.dart';
import 'package:bmi_app/models/articles.dart';
import 'package:bmi_app/article_view.dart';

class NewsItem extends StatelessWidget {
  final String imgurl, title, decs, content, posturl, name;

  const NewsItem({this.imgurl, this.title, this.decs, this.content,@required this.posturl, this.name});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleView(postUrl:posturl)
          )
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 24),
        width: MediaQuery.of(context).size.width,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
             borderRadius: BorderRadius.only(
               bottomLeft: Radius.circular(8),
               bottomRight: Radius.circular(8))),
          child: Row(
            children: <Widget> [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imgurl,
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget> [
                    Text(
                      title,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,),
                    ),
                    SizedBox(height: 5),
                    Text(
                      decs,
                      maxLines: 2 ,
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: 14,
                    )
                    ),
                    SizedBox(height: 10),
                    Text(
                      name,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.black12,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: 0, ),
            ],
          ),
        ),
      ),
    );
  }
}

