import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
          if(index == 0) return menuList(bloc);
          else if(index == 1) return eventList(bloc);
          else if(index == 2) return userList(bloc);
        }
    );
  }

  Widget menuList(SearchBloc bloc) {
    return StreamBuilder(
      stream: bloc.menuResult,
      initialData: bloc.menuResult.value,
      builder: (context, snapshot) {
        final menuList = snapshot.data;
        if(menuList.length == 0) return Text("");
        return ListView.builder(
          itemCount: menuList.length,
          itemBuilder: (context, index) {
            // print("index length: " + index.toString());
            final MenuState menu = menuList[index];
            return Card(
              child: Text(menu.itemName),
            );
          },
        );
      }
    );
  }

  Widget eventList(SearchBloc bloc) {
    print(bloc.eventResult.value);
    return StreamBuilder(
        stream: bloc.eventResult,
        initialData: bloc.eventResult.value,
        builder: (context, snapshot) {
          final eventList = bloc.eventResult.value;
          print(eventList);
          if(eventList.length == 0) return Text("");
          // print("event list: " + eventList.length.toString());
          return ListView.builder(
            itemCount: eventList.length,
            itemBuilder: (context, index) {
              // print("index length: " + index.toString());
              // print(eventList[index]);
              final event = eventList[index];
              // print(event);
              return Card(
                child: Text(event.eventName),
              );
            },
          );
        }
    );
  }

  Widget userList(SearchBloc bloc) {
    return StreamBuilder(
        stream: bloc.userResult,
        initialData: bloc.userResult.value,
        builder: (context, snapshot) {
          final userList = snapshot.data;
          if(userList.length == 0) return Text("");
          return ListView.builder(
            itemCount: userList.length,
            itemBuilder: (context, index) {
              print("index length: " + index.toString());
              print(userList[index]);
              final user = userList[index];
              return Card(
                child: Text(user.userName),
              );
            },
          );
        }
    );
  }
}