import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scoped/models/product_model.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductsModel>(
        builder: (context, child, model) => GridView.count(
          padding: EdgeInsets.all(4.0),
          crossAxisCount: 2,
          children: List.generate(model.productList.length, (index) {
            final product = model.productList[index];
            return (ProductItemCard(product: product));
          }),
        )
    );
  }
}

class ProductItemCard extends StatelessWidget {
  final Product product;

  ProductItemCard({@required this.product});

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductsModel>(
        builder: (context, child, model) => Card(
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
                          Text(product.name),
                          Text(product.price.toString() + " yen"),
                        ]),
                  ],
                ),
                Positioned(
                    right: 0.0,
                    top: 130.0,
                    child: RawMaterialButton(
                      onPressed: () => model.addCartItem(product),
                      shape: CircleBorder(),
                      elevation: 2.0,
                      fillColor: Colors.yellow,
                      child: Icon(
                        Icons.shopping_cart,
                        size: 20,
                      ),
                    )
                )
              ],
            )
        )
    );
  }
}