import 'package:flutter_bloc/flutter_bloc.dart';

class HomeNavigationCubit extends Cubit<int> {

  HomeNavigationCubit(int initialIndex) : super(initialIndex);

  void navigateTo(int index) => emit(index);
  void navigateToWordOfTheDay() => emit(0);
  void navigateToSearch() => emit(1);
  void navigateToHome() => emit(2);
  void navigateToSaved() => emit(3);
}