import 'package:flutter/material.dart';
import 'package:ios_list_view/ios_list_view.dart';

void main() => runApp(MaterialApp(home: ActivityIndicatorExample()));

class ActivityIndicatorExample extends StatelessWidget {
  IosListViewController controller;

  void _onActivityIndicatorControllerCreated(IosListViewController _controller) {
    controller = _controller;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('UIKItView Test')),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          SizedBox(
            width: 400,
            height: 800,
            child: IosListView(
              hexColor: "FF0000",
              onIosListViewWidgetCreated: _onActivityIndicatorControllerCreated,
              menuId: ["1", "2", "3", "4"],
              menuName: ["neko", "inu", "saru", "kizi"],
              menuImageUrl: ["aaa", "aaa", "aaa", "aaa"],
            ),
          ),
        ],
      ),
    );
  }
}
