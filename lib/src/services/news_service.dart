

import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:http/http.dart'as http;

final _URL_NEWS = 'https://newsapi.org/v2/';
final _APIKEY = '6e10a7390e6c43729c96624fa4694ddb';

class NewsService with ChangeNotifier{
  
  List<Article> headlines = [];

  NewsService(){
    this.getTopHedlines();
  }
  getTopHedlines()async{
    final url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=us&category=business';
    final resp = await http.get(Uri.parse(url)); 

    final newsResponses = newsResponsesFromJson(resp.body);
    
    this.headlines.addAll(newsResponses.articles);
    notifyListeners();
  }
}