import 'package:equatable/equatable.dart';

class Word extends Equatable{
  final String? definition, partOfSpeech;
  final List<String>? synonyms;
  final List<String>? typeOf;
  final List<String>? hasTypes;
  final List<String>? derivation;
  final List<String>? examples;




  const Word({this.definition, this.partOfSpeech, this.synonyms, this.typeOf, this.hasTypes, this.derivation, this.examples});

  static List<Word> fromJsonList(List list) {
    return list.map((item) => Word.fromJson(item)).toList();
  }

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      definition: json['definition'],
      partOfSpeech: json['partOfSpeech'],
      synonyms: json['synonyms'],
      typeOf: json['typeOf'],
      hasTypes: json['hasTypes'],
      derivation: json['derivation'],
      examples: json['examples'],
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [];
}
