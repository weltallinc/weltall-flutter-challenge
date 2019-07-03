import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:provider_pattern/models/models.dart';

class CartListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartItems>(
      builder: (context, cart, _) => ListView.separated(
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemCount: cart.cartItems.length,
          itemBuilder: (context, index) {
            final cartItem = cart.cartItems[index];
            return (
                Dismissible(
                    key: Key(cartItem.product.id),
                    onDismissed: (direction) => cart.deleteCartItem(cartItem),
                    child: Row(
                        children: <Widget>[
                          Expanded(
                              child: ListTile(
                                title: Text(cartItem.product.name),
                                subtitle: Text(
                                    "count: " + cartItem.count.toString()
                                ),
                              )
                          ),
                          Expanded(
                            child: Text((cartItem.product.price * cartItem.count).toString() + " yen"),
                          )
                        ]
                    )
                )
            );
          }),
    );
  }
}
