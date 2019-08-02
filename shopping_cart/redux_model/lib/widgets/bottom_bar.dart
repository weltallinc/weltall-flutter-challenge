import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_model/redux/models/models.dart';
import 'package:flutter_redux/flutter_redux.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<CartItem>>(
        converter: (store) => store.state.cartItems,
        builder: (context, cartItems) => Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Expanded(
                  child: ListTile(
                    title: Text("Total:"),
                    subtitle: Text("\$" + cartItems
                        .fold(0, (a, b) => a + b.product.price * b.count)
                        .toString()
                    ),
                  )),
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  child: Text("Buy!", style: TextStyle(color: Colors.black),),
                  color: Colors.yellow,
                ),
              )
            ],
          ),
        ));
  }
}
