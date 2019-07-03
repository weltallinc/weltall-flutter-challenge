import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_pattern/models/models.dart';

class BottomBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartItems>(
        builder: (context, cart, _) => Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Expanded(
                  child: ListTile(
                    title: Text("Total:"),
                    subtitle: Text("\$" + cart.cartItems
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
