import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:oshinagaki_beta/bloc/search_bloc.dart';

class SearchTextField extends StatelessWidget {
  final List<String> _hintText = [
    "enter oshinagaki name",
    "enter event name",
    "enter user ID or username",
  ];

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<SearchBloc>(context);
    return StreamBuilder(
      stream: bloc.tabIndex,
      initialData: bloc.tabIndex.value,
      builder: (context, index) {
        final hintText = _hintText[index.data];
        return TextField(
          decoration: InputDecoration(
            hintText: hintText,
          ),
          onSubmitted: bloc.onSubmitText,
        );
      }
    );
  }
}