import 'package:forgottenlandapp_utils/utils.dart';

class News {
  News({
    this.id,
    this.date,
    this.news,
    this.category,
    this.type,
    this.url,
    this.content,
  });

  News.fromJson(Map<String, dynamic> json) {
    json.clean();
    id = json['id'] as int?;
    date = json['date'] as String?;
    news = json['news'] as String?;
    category = json['category'] as String?;
    type = json['type'] as String?;
    url = json['url'] as String?;
    content = json['content'] as String?;
  }

  int? id;
  String? date;
  String? news;
  String? category;
  String? type;
  String? url;
  String? content;

  News copyWith({
    int? id,
    String? date,
    String? news,
    String? category,
    String? type,
    String? url,
    String? content,
  }) {
    return News(
      id: id ?? this.id,
      date: date ?? this.date,
      news: news ?? this.news,
      category: category ?? this.category,
      type: type ?? this.type,
      url: url ?? this.url,
      content: content ?? this.content,
    );
  }
}
