import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:bloc_model/models/models.dart';
import 'package:bloc_model/bloc/cart_list_bloc.dart';

typedef OnItemDelete = Function(Product item);

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = CartListProvider.of(context);

    return StreamBuilder<List<CartItem>>(
      stream: bloc.cartItems,
      initialData: bloc.cartItems.value,
      builder: (context, cartItems) => ListView.separated(
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemCount: cartItems.data.length,
          itemBuilder: (context, index) {
            final cartItem = cartItems.data[index];
            return (Dismissible(
                key: Key(cartItem.product.id),
                onDismissed: (direction) {
                  bloc.deleteCartProduct(cartItem);
                },
                child: Row(children: <Widget>[
                  Expanded(
                      child: ListTile(
                        title: Text(cartItem.product.name),
                        subtitle: Text("count: " + cartItem.count.toString()),
                      )
                  ),
                  Expanded(
                    child: Text(
                        (cartItem.product.price * cartItem.count).toString() +
                            " yen"),
                  )
                ]
                )
            ));
          }
          ),

    );
  }
}
