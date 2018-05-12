import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_shoppingcart/model/cart_item.dart';
import 'package:flutter_shoppingcart/redux/action.dart';

class ShoppingItem extends StatefulWidget {
  final CartItem item;

  const ShoppingItem({Key key, this.item}) : super(key: key);

  @override
  ShoppingItemState createState() {
    return new ShoppingItemState();
  }
}

class ShoppingItemState extends State<ShoppingItem> {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<List<CartItem>, OnItemDeleted>(
      converter: (store) => (itemName) {
            store.dispatch(DeleteItemAction(widget.item));
          },
      builder: (context, callback) => new Dismissible(
            onDismissed: (_) {
              setState(() {
                callback(widget.item.name);
              });
            },
            child: new StoreConnector<List<CartItem>, OnToggleStateAction>(
              converter: (store) =>
                  (item) => store.dispatch(ToggleStateItemAction(item)),
              builder: (context, callback) => new ListTile(
                    title: new Text(widget.item.name),
                    leading: new Checkbox(
                        value: widget.item.checked,
                        onChanged: (newValue) {
                          setState(() {
                            callback(CartItem(
                                name: widget.item.name, checked: newValue));
                          });
                        }),
                  ),
            ),
            key: new Key(widget.item.name),
          ),
    );
  }
}

typedef OnToggleStateAction = Function(CartItem item);
typedef OnItemDeleted = Function(String itemName);
