import 'dart:convert';

NewsResponses newsResponsesFromJson(String str) => NewsResponses.fromJson(json.decode(str));

String newsResponsesToJson(NewsResponses data) => json.encode(data.toJson());

class NewsResponses {
    String status;
    int totalResults;
    List<Article> articles;

    NewsResponses({
        required this.status,
        required this.totalResults,
        required this.articles,
    });

    factory NewsResponses.fromJson(Map<String, dynamic> json) => NewsResponses(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
    };
}

class Article {
    Source source;
    String? author;
    String title;
    String? description;
    String? url;
    String? urlToImage;
    DateTime publishedAt;
    String? content;

    Article({
        required this.source,
        required this.author,
        required this.title,
        required this.description,
        required this.url,
        required this.urlToImage,
        required this.publishedAt,
        required this.content,
    });

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] != null ? json["author"] : null ,
        title: json["title"]!= null ? json["title"] : null,
        description: json["description"]!= null ? json["description"] : null,
        url: json["url"]!= null ? json["url"] : null,
        urlToImage: json["urlToImage"]!= null ? json["urlToImage"] : null,
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"]!= null ? json["content"] : null,
    );

    Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
    };
}

class Source {
    String? id;
    String? name;

    Source({
        this.id,
        this.name,
    });

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
