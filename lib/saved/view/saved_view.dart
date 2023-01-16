
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
         return Visibility(
           visible: state.size != 0,
           replacement: wordNotFound(),
           child: Column(
             children: savedWords(state) ?? []
           ),
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

  Widget wordNotFound(){
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(32)
            ),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.book, size: 58, color: Theme.of(context).canvasColor,),
                  Text("No Words Saved", style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.white),),
                  Text("Start searching for words to add them to your list", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.white),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


}
