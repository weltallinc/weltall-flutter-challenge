import 'package:flutter/material.dart';
import 'package:bloc_model/bloc/cart_list_bloc.dart';
import 'package:bloc_model/screens/main_page.dart';
import 'package:bloc_model/screens/cartlist_page.dart';

void main(){
  runApp(
    CartListProvider(
      bloc: CartListBloc(),
      child: ShoppingCartApp(),
    )
  );
}

class ShoppingCartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "shopping cart application by ScopedModel",
        theme: ThemeData(primarySwatch: Colors.yellow),
        routes: <String, WidgetBuilder>{
          '/cartlist': (BuildContext context) => new CartListPage(),
        },
        home: MainPage(),
      );
  }
}