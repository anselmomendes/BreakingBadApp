import 'dart:convert';

class QuotesModel {
  final String quote;
  final String author;
  QuotesModel({
    this.quote,
    this.author,
  });

  QuotesModel copyWith({
    String quote,
    String author,
  }) {
    return QuotesModel(
      quote: quote ?? this.quote,
      author: author ?? this.author,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'quote': quote,
      'author': author,
    };
  }

  static QuotesModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return QuotesModel(
      quote: map['quote'],
      author: map['author'],
    );
  }

  String toJson() => json.encode(toMap());

  static QuotesModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'QuotesModel(quote: $quote, author: $author)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is QuotesModel && o.quote == quote && o.author == author;
  }

  @override
  int get hashCode => quote.hashCode ^ author.hashCode;
}
