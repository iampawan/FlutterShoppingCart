import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_shoppingcart/model/cart_item.dart';
import 'package:flutter_shoppingcart/redux/action.dart';

class AddItemDialog extends StatefulWidget {
  @override
  AddItemDialogState createState() {
    return new AddItemDialogState();
  }
}

class AddItemDialogState extends State<AddItemDialog> {
  String itemName;

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<List<CartItem>, OnItemAddedCallback>(
      converter: (store) => (itemName) => store
          .dispatch(AddItemAction(CartItem(name: itemName, checked: false))),
      builder: (context, callback) => new AlertDialog(
            title: Text('Add Item'),
            contentPadding: const EdgeInsets.all(16.0),
            content: new Row(
              children: <Widget>[
                new Expanded(
                    child: new TextField(
                  autofocus: true,
                  decoration: new InputDecoration(
                      labelText: "Item Name", hintText: "Eg. Apple"),
                  onChanged: (text) {
                    setState(() {
                      itemName = text;
                    });
                  },
                ))
              ],
            ),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: new Text("Cancel")),
              new FlatButton(
                  onPressed: () {
                    callback(itemName);
                    Navigator.pop(context);
                  },
                  child: new Text("Add"))
            ],
          ),
    );
  }
}

typedef OnItemAddedCallback = Function(String itemName);
