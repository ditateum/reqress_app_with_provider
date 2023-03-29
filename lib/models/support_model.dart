import 'dart:convert';

import 'package:equatable/equatable.dart';

class SupportModel extends Equatable {
  const SupportModel({
    required this.text,
    required this.url,
  });

  factory SupportModel.fromJson(String source) =>
      SupportModel.fromMap(json.decode(source));

  factory SupportModel.fromMap(Map<String, dynamic> map) {
    return SupportModel(
      text: map['text'] ?? '',
      url: map['url'] ?? '',
    );
  }

  final String text;
  final String url;

  @override
  List<Object> get props => [text, url];

  @override
  String toString() => 'SupportModel(text: $text, url: $url)';

  SupportModel copyWith({
    String? text,
    String? url,
  }) {
    return SupportModel(
      text: text ?? this.text,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'url': url,
    };
  }

  String toJson() => json.encode(toMap());
}
