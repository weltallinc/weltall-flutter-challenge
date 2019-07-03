import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_pattern/models/models.dart';

class ProductListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<ProductList>.value(
        value: ProductList(),
        child: Consumer<ProductList>(builder: (context, value, _) {
          final productList = value.productList;
          return GridView.count(
              padding: EdgeInsets.all(4.0),
              crossAxisCount: 2,
              children: List.generate(productList.length, (index) {
                final product = productList[index];
                return ProductItemCardWidget(product: product);
              }));
        }));
  }
}

class ProductItemCardWidget extends StatelessWidget {
  final Product product;

  ProductItemCardWidget({@required this.product});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartItems>(
        builder: (context, cart, _) => Card(
                child: new Stack(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      color: Colors.grey,
                      height: 150,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(product.name + "(最大: " + product.maxQuantity.toString() + "個)"),
                          Text(product.price.toString() + " yen"),
                        ]),
                  ],
                ),
                Positioned(
                    right: 0.0,
                    top: 130.0,
                    child: RawMaterialButton(
                      onPressed: () => cart.addCartItem(product),
                      shape: CircleBorder(),
                      elevation: 2.0,
                      fillColor: Colors.yellow,
                      child: Icon(
                        Icons.shopping_cart,
                        size: 20,
                      ),
                    ))
              ],
            )));
  }
}
