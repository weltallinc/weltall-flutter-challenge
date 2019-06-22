import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_model/redux/models/models.dart';
import 'package:redux_model/redux/actions/actions.dart';

typedef OnItemDelete = Function(Product item);

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, model) => ListView.separated(
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemCount: model.cartItems.length,
          itemBuilder: (context, index) {
            final cartItem = model.cartItems[index];
            return (Dismissible(
                key: Key(cartItem.product.id),
                onDismissed: (direction) {
                  model.onRemove(cartItem);
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

class _ViewModel {
  final List<CartItem> cartItems;
  final Function(CartItem) onRemove;

  _ViewModel({@required this.cartItems, @required this.onRemove});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        cartItems: store.state.cartItems,
        onRemove: (item) {
          store.dispatch(DeleteItemAction(item));
        });
  }
}
