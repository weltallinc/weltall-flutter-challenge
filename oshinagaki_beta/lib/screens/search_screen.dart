import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:oshinagaki_beta/bloc/search_bloc.dart';
import 'package:oshinagaki_beta/widgets/search_text_field.dart';
import 'package:oshinagaki_beta/widgets/search_tabbar.dart';
import 'package:oshinagaki_beta/widgets/search_result.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<SearchBloc>(
      builder: (_) => SearchBloc(),
      dispose: (_, bloc) => bloc.dispose(),
      child: Container(
        child: Column(
          children: <Widget>[
            SearchTextField(),
            SearchTabBar(),
            Expanded(child: SearchResult()),
          ],
        ),
      ),
    );
  }
}

