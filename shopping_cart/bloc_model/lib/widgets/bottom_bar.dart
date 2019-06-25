import 'package:flutter/material.dart';
import 'package:bloc_model/bloc/cart_list_bloc.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = CartListProvider.of(context);

    return Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Expanded(
                  child: StreamBuilder(
                      stream: bloc.cartItems,
                      initialData: bloc.cartItems.value,
                      builder: (context, cartItems) => ListTile(
                    title: Text("Total:"),
                    subtitle: Text("\$" + cartItems.data
                        .fold(0, (a, b) => a + b.product.price * b.count)
                        .toString()
                    ),
                  ))),
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  child: Text("Buy!", style: TextStyle(color: Colors.black),),
                  color: Colors.yellow,
                ),
              )
            ],
          ),
        );
  }
}
