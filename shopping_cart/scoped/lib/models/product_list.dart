import 'package:scoped_model/scoped_model.dart';
import 'package:scoped/models/product_model.dart';

class ProductsModel extends Model {
  List<Product> productList = product_list;
  List<Product> cartList = [];

  void addCartProduct(Product product) {
    print(cartList);
    cartList.add(product);
    print(cartList);
    notifyListeners();
  }

  void deleteCartProduct(Product product) {
    print(cartList);
    cartList = cartList.where((_product) => _product.id != product.id).toList();
    print(cartList);
    notifyListeners();
  }
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
