import 'package:flutter/foundation.dart';

class ProductsModel {
  List<Product> productList = product_list;
  List<CartItem> cartList = [];

  void addCartProduct(Product product) {
    print(cartList);
    int idx = find(product);
    if(idx != -1) cartList[idx].count++;
    else cartList.add(CartItem(product, 1));
    print(cartList);
  }

  void deleteCartProduct(CartItem product) {
    print(cartList);
    cartList = cartList.where((_product) => _product.product.id != product.product.id).toList();
    print(cartList);
  }

  int find(Product product) {
    for(int idx = 0; idx < cartList.length; idx++) {
      if(product == cartList[idx].product) {
        return idx;
      }
    }
    return -1;
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