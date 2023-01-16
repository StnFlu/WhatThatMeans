import 'package:equatable/equatable.dart';

class Pronunciation extends Equatable {
  final String? all,
      verb,
      noun,
      adjective,
      determiner,
      adverb,
      pronoun,
      preposition,
      conjunction,
      interjection;

  const Pronunciation({
    this.all,
    this.verb,
    this.noun,
    this.adjective,
    this.determiner,
    this.adverb,
    this.pronoun,
    this.preposition,
    this.conjunction,
    this.interjection,
  });

  static List<Pronunciation> fromJsonList(List list) {
    return list.map((item) => Pronunciation.fromJson(item)).toList();
  }

  factory Pronunciation.fromJson(Map<String, dynamic> json) {
    return Pronunciation(
      all: json.containsKey('all') ? json['all'] : null,
      verb: json.containsKey('verb') ? json['verb'] : null,
      noun: json.containsKey('noun') ? json['noun'] : null,
      adjective: json.containsKey('adjective') ? json['adjective'] : null,
      determiner: json.containsKey('determiner') ? json['determiner'] : null,
      adverb: json.containsKey('adverb') ? json['adverb'] : null,
      pronoun: json.containsKey('pronoun') ? json['pronoun'] : null,
      preposition: json.containsKey('preposition') ? json['preposition'] : null,
      conjunction: json.containsKey('conjunction') ? json['conjunction'] : null,
      interjection: json.containsKey('interjection') ? json['interjection'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "all": all,
      "verb": verb,
      "noun" : noun,
      "adjective" : adjective,
      "determiner" : determiner,
      "adverb" : adverb,
      "pronoun" : pronoun,
      "preposition" : preposition,
      "conjunction" : conjunction,
      "interjection" : interjection
    };
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [];
}
