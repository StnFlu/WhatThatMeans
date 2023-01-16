
part of 'saved_cubit.dart';

class SavedWordState extends Equatable {

  final List<FullWord>? fullWords;
  final int? size;

  const SavedWordState( {
    this.fullWords, this.size,
  });

  SavedWordState copyWith({
    List<FullWord>? fullWord,
    int? sizeNum,
  }) => SavedWordState(
    fullWords: fullWord,
    size: sizeNum
  );

  @override
  List<Object?> get props => [size];

  factory SavedWordState.fromJson(Map<String, dynamic> json) {

    return SavedWordState(
      fullWords: json.containsKey('saved_word') ? FullWord.fromJsonList(json['saved_word']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "saved_word": jsonEncode(fullWords)
    };
  }
}