import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultCubit extends Cubit<String> {
  SearchResultCubit() : super("");

  void search(String value) => emit(value);
}