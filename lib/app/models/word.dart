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
    print(json);

    return Word(
      definition: json['definition'],
      partOfSpeech: json['partOfSpeech'],
      synonyms: json.containsKey('synonyms') ? (json['synonyms'] as List)?.map((item) => item as String)?.toList() : null,
      typeOf: json.containsKey('typeOf') ? (json['typeOf'] as List)?.map((item) => item as String)?.toList() : null,
      hasTypes: json.containsKey('hasTypes') ? (json['hasTypes'] as List)?.map((item) => item as String)?.toList() : null,
      derivation: json.containsKey('derivation') ? (json['derivation'] as List)?.map((item) => item as String)?.toList() : null,
      examples: json.containsKey('examples') ? (json['examples'] as List)?.map((item) => item as String)?.toList() : null,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [];
}
