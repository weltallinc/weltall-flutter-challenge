
import 'package:flutter/foundation.dart';

class CartItems {
  List<CartItem> _cartItems = [];
  final int _cartMaxQuantity = 6;

  void addCartItem(Product product) {
    int idx = find(product);
    if(idx != -1) _cartItems[idx].count++;
    else _cartItems.add(CartItem(product, 1));
  }

  void deleteCartItem(CartItem product) {
    _cartItems = _cartItems.where((_product) => _product.product.id != product.product.id).toList();
  }

  int find(Product product) {
    for(int idx = 0; idx < _cartItems.length; idx++) {
      if(product == _cartItems[idx].product) {
        return idx;
      }
    }
    return -1;
  }

  int get cartMaxQuantity => _cartMaxQuantity;

  List<CartItem> get cartItems => _cartItems;

}

class CartItem {
  final Product product;
  int count;

  CartItem(this.product, this.count);

}

class Product {
  final String id;
  final String name;
  final int price;
  final int maxQuantity;

  Product({@required this.id, @required this.name, @required this.price, @required this.maxQuantity});

  @override
  String toString() {
    return 'Product{id: $id, name: $name, price: $price}';
  }
}

class ProductList {
  final List<Product> _productList = productLList;

  List<Product> get productList => _productList; // = product_list;

}


final List<Product> productLList = [
  Product(id: "1", name: "apple", price: 100, maxQuantity: 1),
  Product(id: "2", name: "banana", price: 200, maxQuantity: 2),
  Product(id: "3", name: "lemon", price: 300, maxQuantity: 3),
  Product(id: "4", name: "solt", price: 65, maxQuantity: 4),
  Product(id: "5", name: "gam", price: 10, maxQuantity: 5),
  Product(id: "6", name: "nuts", price: 500, maxQuantity: 6),
  Product(id: "7", name: "tubugumi", price: 100, maxQuantity: 1),
  Product(id: "8", name: "oroC", price: 130, maxQuantity: 2),
  Product(id: "9", name: "imokenpi", price: 100, maxQuantity: 3),
  Product(id: "10", name: "chocolate", price: 200, maxQuantity: 4),
];