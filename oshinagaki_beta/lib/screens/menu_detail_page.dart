import 'package:flutter/material.dart';
import 'package:oshinagaki_beta/models/menu_state.dart';

class MenuDetailsPage extends StatelessWidget {
  final MenuState menu;

  MenuDetailsPage(this.menu);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menu.menuName),
      ),
      body: Center(
          child: Column(
            children: <Widget>[
              Text("Event name: " + menu.menuName),
              Text("Event place: " + menu.userName),
              Image.network(menu.imageUrl),
            ],
          )
      ),
    );
  }
}
