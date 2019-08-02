import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';
import 'package:bloc_model/models/models.dart';

class AddCartItem {
  CartItem item;

  AddCartItem(this.item);
}

class ProductListBloc {
  List<Product> _productList = product_list;

  final _product = BehaviorSubject<List<Product>>.seeded(product_list);

  ValueObservable<List<Product>> get productList => _product.stream;
}

class ProductListProvider extends InheritedWidget {
  final ProductListBloc bloc;

  ProductListProvider({
    Key key,
    @required Widget child,
    @required this.bloc,
  }) : super(key: key, child: child);

  static ProductListBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ProductListProvider)
    as ProductListProvider)
        .bloc;
  }

  @override
  bool updateShouldNotify(ProductListProvider oldWidget) => bloc != oldWidget.bloc;
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
