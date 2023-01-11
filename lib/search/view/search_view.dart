
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:whats_that_mean/home/widgets/search_bar.dart';

import '../../home/navigation/home_navigation_cubit.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> with TickerProviderStateMixin {

  PageController? _pageController;
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeNavigationCubit, int>(
        builder: (context, state) {
          if (state != _pageController?.page && _pageController != null) {
            _pageController?.animateToPage(state, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
          }
          return KeyboardDismisser(
            child: Scaffold(
              appBar: AppBar(

                title: SearchBar(),
                titleSpacing: 4,


              ),
              body: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController = PageController(initialPage: state),
                children: [
                  Text('test1'),
                  Text('test2'),
                  Text('test3'),
                  Text('test4'),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                    backgroundColor: Colors.brown,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_month),
                    label: 'WOTD',
                    backgroundColor: Colors.brown,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: 'Search',
                    backgroundColor: Colors.brown,

                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.bookmarks_rounded),
                    label: 'Saved',
                    backgroundColor: Colors.brown,

                  ),
                ],
                currentIndex: state,
                selectedItemColor: Colors.amber[800],
                showUnselectedLabels: true,
                onTap: (index) {
                  context.read<HomeNavigationCubit>().navigateTo(index);
                  _pageController?.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                  },
              ),
            ),
          );
        }
    );
  }

}