
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_that_mean/home/cubit/search_result_cubit.dart';
import 'package:whats_that_mean/search/cubit/search_cubit.dart';
import 'package:whats_that_mean/search/widgets/word_tile.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return BlocBuilder<SearchResultCubit, String>(
              builder: (context, search) {
                if(search != ""){
                  context.read<SearchCubit>().fetchWord(search);
                }
              return Visibility(
                  visible: state.searchField != null || state.searchField == "",
                  replacement: beginSearch(),
                  child: Visibility(
                    visible: state.fullWord != null,
                      replacement: wordNotFound(state.searchField),
                      child: WordTile(fullWord: state.fullWord)));
            }
          );
        }
    );
  }
  Widget beginSearch(){
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
                  Icon(Icons.search, size: 58, color: Theme.of(context).canvasColor,),
                  Text("Begin Searching", style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.white),),
                  Text("Use the search bar to start your search", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.white),)
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }


  Widget wordNotFound(String? word){
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
                  Icon(Icons.search_off, size: 58, color: Theme.of(context).canvasColor,),
                  Text("Uh Oh", style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.white),),
                  Text("Nothing could be found for $word", style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.white),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
