import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whats_that_mean/home/cubit/search_cubit.dart';
import 'package:whats_that_mean/home/home.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  final FocusNode _searchFieldFocusNode = FocusNode();
  final TextEditingController _searchEditingController = TextEditingController();

  @override
  void initState() {
    _searchFieldFocusNode.addListener(() {
      if(_searchFieldFocusNode.hasFocus) {
        context.read<SearchCubit>().enable();
      } else {
        context.read<SearchCubit>().disable();
      }

    });
    super.initState();
  }

  bool? get keyboardOpen {
    return MediaQuery.of(context).viewInsets.bottom != 0;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, bool>(
        builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
                width: state ? 0 : 40,
                duration: const Duration(milliseconds: 400),
              child: SvgPicture.asset('assets/WhatThatMeans.svg')
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal:  state ? 0 : 4,),
                child: TextFormField(
                  controller: _searchEditingController,
                  decoration: InputDecoration(
                    fillColor: Theme.of(context).colorScheme.onPrimary,
                    filled: true,
                    hintText: 'Search...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4)
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12)
                  ),
                  focusNode: _searchFieldFocusNode,
                  onChanged: (text){

                  },
                  onFieldSubmitted: (text){
                    context.read<HomeNavigationCubit>().navigateToSearch();

                  },
                ),
              ),
            ),
            AnimatedContainer(
              width: state ? 0 : 50,
                duration: const Duration(milliseconds: 400),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.menu),
                )),
          ],
        );
      }
    );
  }
}
