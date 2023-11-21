// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class QuestionModel {
  String question;
  num time;
  List<AnswerModel> answers;
  QuestionModel({
    required this.question,
    required this.time,
    required this.answers,
  });

  QuestionModel copyWith({
    String? question,
    num? time,
    List<AnswerModel>? answers,
  }) {
    return QuestionModel(
      question: question ?? this.question,
      time: time ?? this.time,
      answers: answers ?? this.answers,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question,
      'time': time,
      'answers': answers.map((x) => x.toMap()).toList(),
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      question: map['question'] as String,
      time: map['time'] as num,
      answers: List<AnswerModel>.from(
        (map['answers'] as List<int>).map<AnswerModel>(
          (x) => AnswerModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'QuestionModel(question: $question, time: $time, answers: $answers)';

  @override
  bool operator ==(covariant QuestionModel other) {
    if (identical(this, other)) return true;

    return other.question == question &&
        other.time == time &&
        listEquals(other.answers, answers);
  }

  @override
  int get hashCode => question.hashCode ^ time.hashCode ^ answers.hashCode;
}

class AnswerModel {
  String answer;
  bool isCorrect;
  AnswerModel({
    required this.answer,
    required this.isCorrect,
  });

  AnswerModel copyWith({
    String? answer,
    bool? isCorrect,
  }) {
    return AnswerModel(
      answer: answer ?? this.answer,
      isCorrect: isCorrect ?? this.isCorrect,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'answer': answer,
      'isCorrect': isCorrect,
    };
  }

  factory AnswerModel.fromMap(Map<String, dynamic> map) {
    return AnswerModel(
      answer: map['answer'] as String,
      isCorrect: map['isCorrect'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnswerModel.fromJson(String source) =>
      AnswerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AnswerModel(answer: $answer, isCorrect: $isCorrect)';

  @override
  bool operator ==(covariant AnswerModel other) {
    if (identical(this, other)) return true;

    return other.answer == answer && other.isCorrect == isCorrect;
  }

  @override
  int get hashCode => answer.hashCode ^ isCorrect.hashCode;
}
