import 'package:flutter_shoppingcart/model/cart_item.dart';
import 'package:flutter_shoppingcart/redux/action.dart';

List<CartItem> cartItemsReducer(List<CartItem> items, dynamic action) {
  if (action is AddItemAction) {
    return addItem(items, action);
  } else if (action is ToggleStateItemAction) {
    return toggleState(items, action);
  } else if (action is DeleteItemAction) {
    return deleteItem(items, action);
  }
  return items;
}

List<CartItem> addItem(List<CartItem> items, AddItemAction action) {
  return new List.from(items)..add(action.item);
}

List<CartItem> deleteItem(List<CartItem> items, DeleteItemAction action) {
  return new List.from(items)..remove(action.item);
}

List<CartItem> toggleState(List<CartItem> items, ToggleStateItemAction action) {
  List<CartItem> newItems = items
      .map((item) => item.name == action.item.name ? action.item : item)
      .toList();
  return newItems;
}
