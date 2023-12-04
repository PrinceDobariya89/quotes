import 'dart:convert';

List<Quote> quoteFromJson(String str) =>
    List<Quote>.from(json.decode(str).map((x) => Quote.fromJson(x)));

class Quote {
  String? quote;
  String? author;
  String? category;

  Quote({this.quote, this.author, this.category});

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
      quote: json["quote"], author: json["author"], category: json["category"]);

  Map<String, dynamic> toMap() {
    return {'quote': quote, 'author': author, 'category': category};
  }
}
