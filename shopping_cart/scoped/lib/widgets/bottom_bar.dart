import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scoped/models/product_model.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductsModel>(
        builder: (context, child, model) => Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Expanded(
                  child: ListTile(
                    title: Text("Total:"),
                    subtitle: Text("\$" + model.cartList
                        .fold(0, (a, b) => a + b.product.price * b.count)
                        .toString()
                    ),
                  )),
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  child: Text("Buy!", style: TextStyle(color: Colors.black),),
                  color: Colors.yellow,
                ),
              )
            ],
          ),
        ));
  }
}
