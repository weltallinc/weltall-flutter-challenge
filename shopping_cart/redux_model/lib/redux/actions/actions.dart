import 'package:redux_model/redux/models/models.dart';

class AddItemAction {
  final Product product;

  AddItemAction(this.product);
}

class DeleteItemAction {
  final CartItem product;

  DeleteItemAction(this.product);
}

