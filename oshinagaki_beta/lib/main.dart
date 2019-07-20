import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './bloc/page_controller_bloc.dart';
import './screens/account_screen.dart';
import './screens/home_screen.dart';
import './screens/search_screen.dart';

void main() => runApp(OshinagakiApp());

class OshinagakiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<PageControllerBloc>(
      builder: (_) => PageControllerBloc(),
        dispose: (_, bloc) => bloc.dispose(),
        child: MaterialApp(
          title: "Oshinagaki App",
          home: MainController(),
        )
    );
  }
}

class MainController extends StatelessWidget {
  final List<Widget> _pages = [
    HomeScreen(),
    SearchScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<PageControllerBloc>(context);
    return StreamBuilder(
        stream: bloc.currentTabIndex,
        initialData: 0,
        builder: (context, _index) {
          return Scaffold(
              appBar: AppBar(
                title: Text("Oshinagaki App"),
              ),
              body: _pages[_index.data],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: _index.data,
                items: [
                  BottomNavigationBarItem(
                    title: Text("home"),
                    icon: Icon(Icons.home),
                  ),
                  BottomNavigationBarItem(
                    title: Text("search"),
                    icon: Icon(Icons.search),
                  ),
                  BottomNavigationBarItem(
                      title: Text("account"),
                      icon: Icon(Icons.account_circle)
                  ),
                ],
                onTap: (index) => bloc.changeCurrentIndex(index),//bloc.selectTabIndex,
              ),
            );
        }
        );
  }
}
