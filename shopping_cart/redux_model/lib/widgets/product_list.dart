import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_model/redux/actions/actions.dart';
import 'package:redux_model/redux/models/models.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
        builder: (context, model) =>
            GridView.count(
              padding: EdgeInsets.all(4.0),
          crossAxisCount: 2,
          children: List.generate(model.productList.length, (index) {
            final product = model.productList[index];
            return ProductItemCard(
              product: product,
              addItemAction: model.addItemAction,
            );
          }),
        )
    );
  }
}

class ProductItemCard extends StatelessWidget {
  final Product product;
  final Function(Product) addItemAction;


  ProductItemCard({
    @required this.product,
    @required this.addItemAction
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
                      onPressed: () => addItemAction(product),
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

class _ViewModel {
  final List<Product> productList;
  final Function(Product) addItemAction;

  _ViewModel({
    @required this.productList,
    @required this.addItemAction
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        productList: store.state.productList,
        addItemAction: (item) {
          store.dispatch(AddItemAction(item));
        }
    );
  }
}