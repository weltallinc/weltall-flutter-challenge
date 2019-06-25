import 'package:flutter/material.dart';
import 'package:bloc_model/widgets/cart_list.dart';
import 'package:bloc_model/widgets/bottom_bar.dart';

class CartListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scoped Model"),
      ),
      body: CartList(),
      bottomNavigationBar: BottomBar(),
    );
  }
}