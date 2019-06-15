import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scoped/models/product_model.dart';
import 'package:scoped/screens/cartlist_page.dart';
import 'package:scoped/screens/main_page.dart';

void main(){
  runApp(ShoppingCartApp());
}

class ShoppingCartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<ProductsModel>(
      model: ProductsModel(),
      child: MaterialApp(
        title: "shopping cart application by ScopedModel",
        theme: ThemeData(primarySwatch: Colors.yellow),
        routes: <String, WidgetBuilder>{
          '/cartlist': (BuildContext context) => new CartListPage(),
        },
        home: MainPage(),
      ),
    );
  }
}