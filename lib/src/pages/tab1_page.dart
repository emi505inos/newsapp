import 'package:flutter/material.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:newsapp/src/widgets/list_news.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget{
  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context){
    
    final newsService = Provider.of<NewsService>(context);


    //ListNews(noticia: newsService.headlines);

    return Scaffold(
      body: (newsService.headlines.length == 0)
      ? Center(child: CircularProgressIndicator(),)
      : ListNews(noticia: newsService.headlines)
    );
  }
  
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}