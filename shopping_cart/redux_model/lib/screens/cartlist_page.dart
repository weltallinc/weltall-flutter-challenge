import 'package:flutter/material.dart';
import 'package:redux_model/widgets/cart_list.dart';
import 'package:redux_model/widgets/buttom_bar.dart';

class CartListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scoped Model"),
      ),
      body: CartList(),
      bottomNavigationBar: ButtomBar(),
    );
  }
}