import 'package:meta/meta.dart';

@immutable
class AppState {
  final List<Product> productList;
  final List<CartItem> cartItems;

  const AppState(
      {
        this.productList = const [],
        this.cartItems = const [],
      });

  factory AppState.init() => AppState(productList: product_list);

  AppState copyWith({
    List<Product> productList,
    List<CartItem> cartItems,
  }) {
    return new AppState(
        productList: productList ?? this.productList,
        cartItems: cartItems ?? this.cartItems
    );
  }
}

class Product {
  final String id;
  final String name;
  final price;

  Product({@required this.id, @required this.name, @required this.price});

  @override
  String toString() {
    return 'Product{id: $id, name: $name, price: $price}';
  }
}

class CartItem {
  final Product product;
  int count;

  CartItem(this.product, this.count);
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