import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:oshinagaki_beta/bloc/search_bloc.dart';

class SearchTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<SearchBloc>(context);
    return StreamBuilder(
      stream: bloc.searchText,
      builder: (context, _) => TextField(
        decoration: InputDecoration(
          hintText: 'Enter a search term',
        ),
        onChanged: bloc.onChangeText,
      ),
    );
  }
}