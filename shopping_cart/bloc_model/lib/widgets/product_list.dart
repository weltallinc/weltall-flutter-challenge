import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:bloc_model/bloc/cart_list_bloc.dart';
import 'package:bloc_model/bloc/product_list_bloc.dart';
import 'package:bloc_model/models/models.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productBloc = ProductListProvider.of(context);
    final cartBloc = CartListProvider.of(context);

    return StreamBuilder<List<Product>>(
      stream: productBloc.productList,
      initialData: productBloc.productList.value,
      builder: (context, productList) => GridView.count(
        padding: EdgeInsets.all(4.0),
        crossAxisCount: 2,
        children: List.generate(productList.data.length, (index) {
          final product = productList.data[index];
          return ProductItemCard(
            product: product,
            addCartProduct: cartBloc.addCartProduct,
          );
        }),
      )
    );
  }
}

class ProductItemCard extends StatelessWidget {
  final Product product;
  final Function(Product) addCartProduct;


  ProductItemCard({
    @required this.product,
    @required this.addCartProduct
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
                      onPressed: () => addCartProduct(product),
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
    );
  }
}
