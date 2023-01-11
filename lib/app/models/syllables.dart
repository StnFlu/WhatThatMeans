import 'package:equatable/equatable.dart';

class Syllables extends Equatable{
  final int? count;
  final List<String>? examples;

  const Syllables({this.count, this.examples});

  static List<Syllables> fromJsonList(List list) {
    return list.map((item) => Syllables.fromJson(item)).toList();
  }

  factory Syllables.fromJson(Map<String, dynamic> json) {
    return Syllables(
      count: json['count'],
      examples: json['examples'],
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [];
}
