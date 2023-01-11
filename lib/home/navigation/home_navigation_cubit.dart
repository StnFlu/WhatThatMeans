import 'package:flutter_bloc/flutter_bloc.dart';

class HomeNavigationCubit extends Cubit<int> {

  HomeNavigationCubit(int initialIndex) : super(initialIndex);

  void navigateTo(int index) => emit(index);
  void navigateToHome() => emit(0);
  void navigateToWordOfTheDay() => emit(1);
  void navigateToSearch() => emit(2);
  void navigateToSaved() => emit(3);
}