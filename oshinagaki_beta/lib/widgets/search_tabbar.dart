import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:oshinagaki_beta/bloc/search_bloc.dart';

class SearchTabBar extends StatefulWidget {
  @override
  SearchTabBarState createState() => SearchTabBarState();
}

class SearchTabBarState extends State<SearchTabBar>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  final List<Tab> tabs = <Tab>[
    Tab(text: "oshinagaki"),
    Tab(text: "event"),
    Tab(text: "user"),
  ];

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<SearchBloc>(context);

    return DefaultTabController(
        length: tabs.length,
        child: Container(
          color: Colors.white70,
          height: 40,
          child: TabBar(
              controller: _controller,
              indicatorColor: Colors.lime,
              unselectedLabelColor: Colors.black12,
              labelColor: Colors.blue,
              tabs: tabs,
              onTap: bloc.changeTabId,
          ),
        )
    );
  }
}