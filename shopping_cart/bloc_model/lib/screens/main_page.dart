import 'package:flutter/material.dart';
import 'package:bloc_model/widgets/product_list.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Scoped Model"),
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    size: 30,
                  ),
                  onPressed: () => Navigator.of(context).pushNamed("/cartlist")),
            ]
        ),
        body: ProductList()
    );
  }
}