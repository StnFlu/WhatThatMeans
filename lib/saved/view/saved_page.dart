import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_that_mean/home/cubit/search_cubit.dart';
import 'package:whats_that_mean/home/home.dart';
import 'package:whats_that_mean/saved/cubit/saved_cubit.dart';
import 'package:whats_that_mean/saved/view/saved_view.dart';
import 'package:whats_that_mean/search/cubit/search_cubit.dart';

class SavedPage extends StatelessWidget {

  const SavedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SavedView();
  }
}