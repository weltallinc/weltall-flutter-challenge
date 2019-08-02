import 'package:redux/redux.dart';
import 'package:redux_model/redux/models/models.dart';
import 'package:redux_model/redux/actions/actions.dart';

AppState appReducers(AppState state, action) {
  return AppState(
    productList: state.productList,
    cartItems: cartItemReducers(state.cartItems, action),
  );
}

final cartItemReducers = combineReducers<List<CartItem>>([
  TypedReducer<List<CartItem>, AddItemAction>(addCartItem),
  TypedReducer<List<CartItem>, DeleteItemAction>(deleteCartItem),
]);

List<CartItem> addCartItem(List<CartItem> itemList, AddItemAction action) {
  final product = action.product;
  int idx = find(itemList, product);
  if(idx != -1) {
    itemList[idx].count++;
    return List.from(itemList);
  } else {
    return List.from(itemList)..add(CartItem(product, 1));
  }
}

List<CartItem> deleteCartItem(List<CartItem> itemList, DeleteItemAction action) {
  final deleteItemID = action.product.product.id;
  return itemList
               .where((_product) => _product.product.id != deleteItemID)
               .toList();
}

int find(List<CartItem> cartItems, Product product) {
  for(int idx = 0; idx < cartItems.length; idx++) {
    if(product == cartItems[idx].product) {
      return idx;
    }
  }
  return -1;
}