import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_model/redux/models/models.dart';
import 'package:redux_model/redux/reducers/reducers.dart';
import 'package:redux_model/screens/cartlist_page.dart';
import 'package:redux_model/screens/main_page.dart';

void main(){
  final store = Store<AppState>(
    appReducers,
    initialState: AppState.init()
  );
  runApp(ShoppingCartApp(store));
}

class ShoppingCartApp extends StatelessWidget {
  final Store<AppState> store;

  ShoppingCartApp(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
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