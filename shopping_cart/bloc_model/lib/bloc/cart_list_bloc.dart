import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc_model/models/models.dart';

class AddCartItem {
  CartItem item;

  AddCartItem(this.item);
}

class DeleteCartItem {
  CartItem item;

  DeleteCartItem(this.item);
}

class CartListBloc {
  List<CartItem> _cartItems = [];
  List<Product> _productList = product_list;

  final _items =
      BehaviorSubject<List<CartItem>>.seeded(const []);

  final _product =
      BehaviorSubject<List<Product>>.seeded(product_list);

  final _addCartProductController =
      PublishSubject<AddCartItem>();

  final _deleteCartProductController =
      PublishSubject<DeleteCartItem>();


  CartListBloc() {
    _addCartProductController.stream.listen(addCartProduct);
    _deleteCartProductController.stream.listen(deleteCartProduct);
  }

  void addCartProduct(product) {
    int idx = find(product);
    if (idx != -1)
      _cartItems[idx].count++;
    else
      _cartItems.add(CartItem(product, 1));
    _items.add(_cartItems);
  }

  void deleteCartProduct(product) {
    _cartItems = _cartItems
        .where((_product) => _product.product.id != product.product.id)
        .toList();
    _items.add(_cartItems);
  }

  int find(Product product) {
    for (int idx = 0; idx < _cartItems.length; idx++) {
      if (product == _cartItems[idx].product) {
        return idx;
      }
    }
    return -1;
  }

  Sink<AddCartItem> get addCartItem => _addCartProductController.sink;
  Sink<DeleteCartItem> get deleteCartItem => _deleteCartProductController.sink;
  ValueObservable<List<CartItem>> get cartItems => _items.stream;
  ValueObservable<List<Product>> get productList => _product.stream;

}

class CartListProvider extends InheritedWidget {
  final CartListBloc bloc;

  CartListProvider({
    Key key,
    @required Widget child,
    @required this.bloc,
  }) : super(key: key, child: child);

  static CartListBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CartListProvider)
                     as CartListProvider).bloc;
  }

  @override
  bool updateShouldNotify(CartListProvider oldWidget) =>
      bloc != oldWidget.bloc;
}

final List<Product> product_list = [
  Product(id: "1", name: "apple", price: 100),
  Product(id: "2", name: "banana", price: 200),
  Product(id: "3", name: "lemon", price: 300),
  Product(id: "4", name: "solt", price: 65),
  Product(id: "5", name: "gam", price: 10),
  Product(id: "6", name: "nuts", price: 500),
  Product(id: "7", name: "tubugumi", price: 100),
  Product(id: "8", name: "oroC", price: 130),
  Product(id: "9", name: "imokenpi", price: 100),
  Product(id: "10", name: "chocolate", price: 200),
];
