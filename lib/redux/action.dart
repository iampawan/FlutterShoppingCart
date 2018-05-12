import 'package:flutter_shoppingcart/model/cart_item.dart';

class AddItemAction {
  final CartItem item;

  AddItemAction(this.item);
}

class ToggleStateItemAction {
  final CartItem item;

  ToggleStateItemAction(this.item);
}

class DeleteItemAction {
  final CartItem item;

  DeleteItemAction(this.item);
}
