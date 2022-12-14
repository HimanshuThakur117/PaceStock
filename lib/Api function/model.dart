// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

Article articleFromJson(String str) => Article.fromJson(json.decode(str));

String articleToJson(Article data) => json.encode(data.toJson());

class Article {
    Article({
        required this.articles,
    });

    List<ArticleElement> articles;

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        articles: List<ArticleElement>.from(json["articles"].map((x) => ArticleElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
    };
}

class ArticleElement {
    ArticleElement({
      required  this.source,
        required this.author,
      required  this.title,
       required this.description,
        required this.url,
        required this.urlToImage,
        required this.publishedAt,
        required this.content,
    });

    Source source;
    dynamic author;
    String title;
    String description;
    String url;
    String urlToImage;
    DateTime publishedAt;
    dynamic content;

    factory ArticleElement.fromJson(Map<String, dynamic> json) => ArticleElement(
        source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
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
    Source({
       required this.id,
        required this.name,
    });

    dynamic id;
    String name;

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
