import 'package:flutter/material.dart';
import 'package:flutter_app/features/number_trivia/domain/entities/NumberTrivia.dart';

class NumberTriviaModel extends NumberTrivia {
  NumberTriviaModel({@required int number, @required String text})
      : super(text: text, number: number);

  factory NumberTriviaModel.fromJson(Map<String, dynamic> json) {
    return NumberTriviaModel(
        number: (json["number"] as num).toInt(), text: json["text"]);
  }
  Map<String, dynamic> toJson() {
    return {'text': text, 'number': number};
  }
}
