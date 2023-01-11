
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../navigation/home_navigation_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {

  late PageController _pageController;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeNavigationCubit, int>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home Page'),
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
                _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
                },
            ),
          );
        }
    );
  }

}
