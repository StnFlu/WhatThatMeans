import 'dart:convert';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:whats_that_mean/app/models/full_word.dart';

import 'package:equatable/equatable.dart';

part 'saved_state.dart';

class SavedWordCubit extends Cubit<SavedWordState> with HydratedMixin {
  SavedWordCubit() : super(const SavedWordState());

  void saveWord(FullWord? word) async {
    if(word == null) return;
    List<FullWord> words = state.fullWords ?? [];
    if((state.fullWords ?? []).contains(word)) return;
    words.insert(0, word);
    emit(state.copyWith(
      fullWord: words,
      sizeNum: words.length
    ));
  }

  void removeWord(FullWord? word) async {
    List<FullWord> words = state.fullWords ?? [];
    words.remove(word!);
    emit(state.copyWith(
        fullWord: words,
        sizeNum: words.length
    ));
  }

  @override
  SavedWordState fromJson(Map<String, dynamic> json) {
      List<FullWord> listOfWords = FullWord.fromJsonList(jsonDecode(json['saved_word']));
      return SavedWordState(fullWords: listOfWords, size: listOfWords.length);
  }



  @override
  Map<String, dynamic> toJson(SavedWordState state) => state.toJson();

}