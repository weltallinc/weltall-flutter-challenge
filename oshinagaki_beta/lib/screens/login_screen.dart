import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:oshinagaki_beta/bloc/page_controller_bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<PageControllerBloc>(context);
    return (
        Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WelcomeBack",
              style: TextStyle(fontSize: 30.0),
            ),
            SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 0.0),
              child: TextField(
                decoration: InputDecoration(labelText: 'Email'),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 0.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'PassWord'),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "SignIn",
                    style: TextStyle(fontSize: 30.0),
                  ),
                  FlatButton(
                    onPressed: () {bloc.login();},
                    child: new Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 40.0,
                    ),
                    shape: new CircleBorder(),
                    color: Color(0xff313131),
                    padding: EdgeInsets.all(15.0),
                  )
                ],
              ),
            )
          ]),
    ));
  }
}
