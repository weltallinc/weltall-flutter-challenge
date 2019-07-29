import 'package:flutter/material.dart';
import 'package:oshinagaki_beta/models/user_state.dart';

class UserDetailsPage extends StatelessWidget {
  final UserState user;

  UserDetailsPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.userName),
      ),
      body: Center(
          child: Column(
            children: <Widget>[
              Text("Event name: " + user.userName),
              Text("Event place: " + user.userId),
              Image.network(user.imageUrl),
            ],
          )
      ),
    );
  }

}
