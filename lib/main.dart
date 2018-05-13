import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_shoppingcart/model/cart_item.dart';
import 'package:flutter_shoppingcart/redux/reducers.dart';
import 'package:flutter_shoppingcart/shooping_cart.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';

void main() {
  final store = new DevToolsStore<List<CartItem>>(cartItemsReducer,
      initialState: new List());

  runApp(new ShoppingApp(store));
}

class ShoppingApp extends StatelessWidget {
  final DevToolsStore<List<CartItem>> store;

  ShoppingApp(this.store);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: store,
      child: new MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: new ThemeData.dark(),
        home: new ShoppingCart(store: store),
      ),
    );
  }
}
