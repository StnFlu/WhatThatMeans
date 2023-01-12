import 'package:equatable/equatable.dart';
import 'package:whats_that_mean/app/models/syllables.dart';
import 'package:whats_that_mean/app/models/word.dart';

class FullWord extends Equatable{
  final String? word;
  final List<Word>? words;
  final Syllables? syllables;


  const FullWord({this.word, this.syllables, this.words, });

  static List<FullWord> fromJsonList(List list) {
    return list.map((item) => FullWord.fromJson(item)).toList();
  }

  factory FullWord.fromJson(Map<String, dynamic> json) {
    print(json);
    return FullWord(
      word: json['word'],
      words: json.containsKey('results') ?  Word.fromJsonList(json['results']) : null,
      syllables: json['typeOf'],
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [];
}
