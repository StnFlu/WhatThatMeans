
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_that_mean/home/cubit/search_result_cubit.dart';
import 'package:whats_that_mean/saved/cubit/saved_cubit.dart';
import 'package:whats_that_mean/search/cubit/search_cubit.dart';
import 'package:whats_that_mean/search/widgets/word_tile.dart';

class SavedView extends StatefulWidget {
  const SavedView({Key? key}) : super(key: key);

  @override
  State<SavedView> createState() => _SavedViewState();
}

class _SavedViewState extends State<SavedView> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<SavedWordCubit, SavedWordState>(
        builder: (context, state) {
         return Column(
           children: savedWords(state) ?? []
         ); Text((state.fullWords ?? []).length.toString()) ;
        }
    );
  }

  List<Widget>? savedWords(SavedWordState state) {
    if (state.fullWords == null) {
      return null;
    }
    return state.fullWords!.map((e) => WordTile(fullWord: e)).toList();
  }

}
