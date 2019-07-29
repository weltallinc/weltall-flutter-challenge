import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:oshinagaki_beta/screens/menu_detail_page.dart';
import 'package:oshinagaki_beta/screens/event_detail_page.dart';
import 'package:oshinagaki_beta/screens/user_detail_page.dart';
import 'package:oshinagaki_beta/models/menu_state.dart';
import 'package:oshinagaki_beta/models/event_state.dart';
import 'package:oshinagaki_beta/models/user_state.dart';
import 'package:oshinagaki_beta/bloc/search_bloc.dart';

class SearchResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<SearchBloc>(context);
    return StreamBuilder(
        initialData: bloc.tabIndex.value,
        stream: bloc.tabIndex,
        builder: (context, _index) {
          final index = _index.data;
          if (index == 0)
            return menuList(bloc);
          else if (index == 1)
            return eventList(bloc);
          else if (index == 2) return userList(bloc);
        });
  }

  Widget menuList(SearchBloc bloc) {
    return StreamBuilder(
        stream: bloc.menuResult,
        initialData: bloc.menuResult.value,
        builder: (context, snapshot) {
          final menuList = snapshot.data;
          return ListView.builder(
            itemCount: menuList.length,
            itemBuilder: (context, index) {
              final MenuState menu = menuList[index];
              return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MenuDetailsPage(menu)),
                  ),
                  child: Card(
                    child: Text(menu.menuName),
                  ));
            },
          );
        });
  }

  Widget eventList(SearchBloc bloc) {
    return StreamBuilder(
        stream: bloc.eventResult,
        initialData: bloc.eventResult.value,
        builder: (context, snapshot) {
          final eventList = bloc.eventResult.value;
          return ListView.builder(
            itemCount: eventList.length,
            itemBuilder: (context, index) {
              final event = eventList[index];
              return GestureDetector(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EventDetailsPage(event)),
                      ),
                  child: Card(
                    child: Text(event.eventName),
                  ));
            },
          );
        });
  }

  Widget userList(SearchBloc bloc) {
    return StreamBuilder(
        stream: bloc.userResult,
        initialData: bloc.userResult.value,
        builder: (context, snapshot) {
          final List<UserState> userList = snapshot.data;
          return ListView.builder(
            itemCount: userList.length,
            itemBuilder: (context, index) {
              final UserState user = userList[index];
              return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserDetailsPage(user)),
                  ),
                  child: Container(
                  child: Card(
                    child: Text(user.userName),
                  )));
            },
          );
        });
  }
}