import 'package:flutter_bloc/flutter_bloc.dart';

class SearchExpandCubit extends Cubit<bool> {
  SearchExpandCubit() : super(false);

  void enable() => emit(true);
  void disable() => emit(false);
}