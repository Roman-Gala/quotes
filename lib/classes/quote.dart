class Quote {
  String text;
  String author;
  String id;

  Quote({this.text = '', this.author = '', this.id = ''});

  Map toJson() => {
        'id': id,
        'text': text,
        'author': author,
      };

  Quote.fromJson(Map json)
      : id = json['id'],
        text = json['text'],
        author = json['author'];
}
