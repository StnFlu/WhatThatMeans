import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:whats_that_mean/app/models/pronunciation.dart';
import 'package:whats_that_mean/app/models/syllables.dart';
import 'package:whats_that_mean/app/models/word.dart';

class FullWord extends Equatable{
  final String? word;
  final List<Word>? words;
  final Syllables? syllables;
  final String? singlePronunciation;
  final Pronunciation? pronunciation;


  const FullWord({this.word, this.syllables, this.words, this.singlePronunciation ,this.pronunciation,});

  static List<FullWord> fromJsonList(List list) {
    return list.map((item) => FullWord.fromJson(item)).toList();
  }

  factory FullWord.fromJson(Map<String, dynamic> json) {
    return FullWord(
      word: json['word'],
      words: json.containsKey('results') ?  Word.fromJsonList(json['results']) : null,
      syllables: json['typeOf'],
      singlePronunciation: json.containsKey('pronunciation') && json['pronunciation'] is String ? json['pronunciation']: null,
      pronunciation : json.containsKey('pronunciation') && json['pronunciation'] is Map<String, dynamic> ? Pronunciation.fromJson(json['pronunciation']) : null,
    );
  }



  Map<String, dynamic> toJson() {

    return {
      "word": word,
      "results": words,
      "typeOf" : syllables,
      "pronunciation" : pronunciation is String ? singlePronunciation : pronunciation
    };
  }
  @override
  bool get stringify => true;

  @override
  List<Object> get props => [word ?? ""];
}
