import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_pattern/models/models.dart';
import 'package:provider_pattern/screens/cartlist_page.dart';
import 'package:provider_pattern/screens/main_page.dart';


void main() {
  runApp(ShoppingCartApp());
}

class ShoppingCartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartItems>.value(
      value: CartItems(),
      child: MaterialApp(
        title: "shopping cart application by ScopedModel",
        theme: ThemeData(primarySwatch: Colors.yellow),
        routes: <String, WidgetBuilder> {
          '/cartlist': (BuildContext context) => new CartListPage(),
        },
        home: MainPage(),
      ),
    );
  }
}