import 'package:flutter/material.dart';
import 'package:provider_pattern/widgets/cart_list.dart';
import 'package:provider_pattern/widgets/bottom_bar.dart';

class CartListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Pattern"),
      ),
      body: CartListWidget(),
      bottomNavigationBar: BottomBarWidget(),
    );
  }
}