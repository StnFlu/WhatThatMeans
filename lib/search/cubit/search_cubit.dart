import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:whats_that_mean/app/controllers/word_controller.dart';
import 'package:whats_that_mean/app/models/full_word.dart';

import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchState());
  final WordController wordController = WordController();

  void fetchWord(String? word) async {
    final response = await wordController.getWord(query: word );
    if (response.statusCode == 200) {
      emit(state.copyWith(
        fullWord: FullWord.fromJson(jsonDecode(response.body)),
        searchField: word
      ));
    }
  }
}