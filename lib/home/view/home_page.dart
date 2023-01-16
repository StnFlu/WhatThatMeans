import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_that_mean/home/home.dart';
import 'package:whats_that_mean/saved/cubit/saved_cubit.dart';

class HomePage extends StatelessWidget {

  final int index;
  const HomePage({this.index = 0, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider (
        providers: [
          BlocProvider<HomeNavigationCubit>(
            create: (_) => HomeNavigationCubit(index),
          ),
          BlocProvider<SearchExpandCubit>(
            create: (_) => SearchExpandCubit(),
          ),
          BlocProvider<SearchResultCubit>(
            create: (_) => SearchResultCubit(),
          ),
          BlocProvider<SavedWordCubit>(
            create: (_) => SavedWordCubit(),
          ),
        ],
        child: const HomeView()
    );
  }
}