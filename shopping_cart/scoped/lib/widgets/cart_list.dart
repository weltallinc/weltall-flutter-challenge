import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scoped/models/product_model.dart';

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductsModel>(
      builder: (context, child, model) => ListView.builder(
        itemCount: model.cartList.length,
        itemBuilder: (context, index) =>
            Dismissible(
                key: Key(model.cartList[index].id),
                onDismissed: (direction)  {
                  model.deleteCartProduct(model.cartList[index]);
                },
                child: CartItem(model.cartList[index])
            ),
      ),
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