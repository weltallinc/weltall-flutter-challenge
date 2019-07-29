import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:oshinagaki_beta/models/menu_state.dart';
import 'package:oshinagaki_beta/bloc/page_controller_bloc.dart';
import 'package:oshinagaki_beta/bloc/home_view_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pageBloc = Provider.of<PageControllerBloc>(context);
    return Provider<HomeViewBloc>(
        builder: (_) => HomeViewBloc(),
        dispose: (_, bloc) => bloc.dispose(),
        child: StreamBuilder(
            stream: pageBloc.accountState,
            builder: (context, _accountState) {
              final account = _accountState.data;
              return Container(
                child: ListView(
                  children: <Widget>[
                    Center(child: Text(
                      "Ranking",
                      style: TextStyle(fontSize: 30),
                    ),),
                    RankingListView(),
                    Center(child: Text(
                      "your recommendation",
                      style: TextStyle(fontSize: 30),
                    ),),
                    RecommendationListView(),
                    Center(child: Text(
                      "premium",
                      style: TextStyle(fontSize: 30),
                    ),),
                    PremiumListView(),
                  ],
                ),
              );
            }));
  }
}


class RankingListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeViewBloc bloc = Provider.of<HomeViewBloc>(context);
    bloc.fetchRanking();
    return StreamBuilder(
        stream: bloc.ranking,
        initialData: bloc.ranking.value,
        builder: (context, snapshot) {
          final menus = snapshot.data;
          print(menus);
          return Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: menus.map<Widget>((menu) => rankingCard(menu)).toList(),
            ),
          );
        },
      );
  }

  Widget rankingCard(MenuState menu) {
    return Container(
      width: 170,
      child: Card(
        child: Column(
          children: <Widget>[
            Text(menu.itemName),
            Image.network(menu.imageUrl),
          ],
        ),
      ),
    );
  }
}

class RecommendationListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PageControllerBloc pageBloc = Provider.of<PageControllerBloc>(context);
    final HomeViewBloc homeBloc = Provider.of<HomeViewBloc>(context);

    if(!pageBloc.isLogin()) {
      return pleaseLoginWidget();
    }

    final account = pageBloc.accountState.value;
    homeBloc.fetchRecommendation(account);
    return StreamBuilder(
      stream: homeBloc.recommendation,
      initialData: homeBloc.recommendation.value,
      builder: (context, snapshot) {
        final menus = snapshot.data;
        print(menus);
        return Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 200.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: menus.map<Widget>((menu) => recommendationCard(menu)).toList(),
          ),
        );
      },
    );
  }

  Widget recommendationCard(MenuState menu) {
    return Container(
      width: 170,
      child: Card(
        child: Column(
          children: <Widget>[
            Text(menu.itemName),
            Image.network(menu.imageUrl),
          ],
        ),
      ),
    );
  }

  Widget pleaseLoginWidget() {
    return Container(
      height: 200,
      width: 300,
      child: Card(
        child: Center(
          child: Text(
            "please Login !! ",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}


class PremiumListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PageControllerBloc pageBloc = Provider.of<PageControllerBloc>(context);
    final HomeViewBloc homeBloc = Provider.of<HomeViewBloc>(context);
    final account = pageBloc.accountState.value;

    if(!pageBloc.isLogin())
      return pleaseLoginWidget();
    else if(!account.isPremium)
      return pleasePremiumMember();

    homeBloc.fetchRecommendation(account);
    return StreamBuilder(
      stream: homeBloc.recommendation,
      initialData: homeBloc.recommendation.value,
      builder: (context, snapshot) {
        final menus = snapshot.data;
        print(menus);
        return Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 200.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: menus.map<Widget>((menu) => rankingCard(menu)).toList(),
          ),
        );
      },
    );
  }

  Widget rankingCard(MenuState menu) {
    return Container(
      width: 170,
      child: Card(
        child: Column(
          children: <Widget>[
            Text(menu.itemName),
            Image.network(menu.imageUrl),
          ],
        ),
      ),
    );
  }

  Widget pleaseLoginWidget() {
    return Container(
      height: 200,
      width: 300,
      child: Card(
        child: Center(
          child: Text(
            "please Login !! ",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }

  Widget pleasePremiumMember() {
    return Container(
      height: 200,
      width: 300,
      child: Card(
        child: Center(
          child: Text(
            "please become a premium member !! ",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
