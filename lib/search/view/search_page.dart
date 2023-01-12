import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_that_mean/home/cubit/search_cubit.dart';
import 'package:whats_that_mean/home/home.dart';
import 'package:whats_that_mean/search/cubit/search_cubit.dart';
import 'package:whats_that_mean/search/search.dart';

class SearchPage extends StatelessWidget {

  final int index;
  const SearchPage({this.index = 0, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider (
        create: (_) => SearchCubit(),
        child: const SearchView()
    );
  }
}