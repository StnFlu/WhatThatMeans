
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_that_mean/home/cubit/search_result_cubit.dart';
import 'package:whats_that_mean/search/cubit/search_cubit.dart';

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
                  print('searching');
                  context.read<SearchCubit>().fetchWord(search);
                }
                print(state);
              return Container(
                color: Colors.red,
                width: 30,
                height: 399,
                child: Text(state.fullWord?.word ?? "no word search"),
              );
            }
          );
        }
    );
  }

}
