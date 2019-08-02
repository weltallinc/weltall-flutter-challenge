import 'package:flutter/material.dart';
import 'package:ios_list_view/ios_list_view.dart';
import 'models/menu_state.dart';

void main() {
  runApp(
      MaterialApp(
          home: IosListViewExample()
      )
  );
}


class IosListViewExample extends StatelessWidget {
  IosListViewController controller;
  final menus = menus_;

  void _onIosListViewControllerCreated(IosListViewController _controller) {
    controller = _controller;
  }

  @override
  Widget build(BuildContext context) {
    final menuId = menus.map((menu) => menu.menuId).toList();
    final menuName = menus.map((menu) => menu.menuName).toList();
    final menuImageUrl = menus.map((menu) => menu.menuImageUrl).toList();

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
              menuId: menuId,
              menuName: menuName,
              menuImageUrl: menuImageUrl,
            ),
          ),
        ],
      ),
    );
  }
}

final List<MenuState> menus_ = [
  MenuState("1", "rice", "https://mi-journey.jp/foodie/wp-content/uploads/2017/03/1703_61_warabi_1.jpg"),
  MenuState("2", "ice", "https://mi-journey.jp/foodie/wp-content/uploads/2017/03/1703_61_warabi_1.jpg"),
  MenuState("3", "coffee", "https://mi-journey.jp/foodie/wp-content/uploads/2017/03/1703_61_warabi_1.jpg"),
  MenuState("4", "mochi", "https://mi-journey.jp/foodie/wp-content/uploads/2017/03/1703_61_warabi_1.jpg"),
  MenuState("5", "orange", "https://mi-journey.jp/foodie/wp-content/uploads/2017/03/1703_61_warabi_1.jpg"),
  MenuState("6", "milk", "https://mi-journey.jp/foodie/wp-content/uploads/2017/03/1703_61_warabi_1.jpg"),
];