import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scoped/models/product_model.dart';

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductsModel>(
      builder: (context, child, model) => ListView.separated(
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemCount: model.cartList.length,
          itemBuilder: (context, index) {
            final cartItem = model.cartList[index];
            return (
                Dismissible(
                  key: Key(cartItem.product.id),
                  onDismissed: (direction) {
                    model.deleteCartProduct(cartItem);
                    },
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: ListTile(
                            title: Text(cartItem.product.name),
                            subtitle: Text("count: " + cartItem.count.toString()),
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

class CartItem extends StatelessWidget {
  final Product product;

  CartItem(@required this.product);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
    );
  }
}
