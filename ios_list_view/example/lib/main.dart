import 'package:flutter/material.dart';
import 'package:ios_list_view/ios_list_view.dart';

void main() => runApp(MaterialApp(home: IosListViewExample()));

class IosListViewExample extends StatelessWidget {
  IosListViewController controller;

  void _onIosListViewControllerCreated(IosListViewController _controller) {
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
              onIosListViewWidgetCreated: _onIosListViewControllerCreated,
              menuId: ["1", "2", "3", "4"],
              menuName: ["neko", "inu", "saru", "kizi"],
              menuImageUrl: ["https://mi-journey.jp/foodie/wp-content/uploads/2017/03/1703_61_warabi_1.jpg", "https://mi-journey.jp/foodie/wp-content/uploads/2017/03/1703_61_warabi_1.jpg", "https://mi-journey.jp/foodie/wp-content/uploads/2017/03/1703_61_warabi_1.jpg", "https://mi-journey.jp/foodie/wp-content/uploads/2017/03/1703_61_warabi_1.jpg"],
            ),
          ),
        ],
      ),
    );
  }
}
