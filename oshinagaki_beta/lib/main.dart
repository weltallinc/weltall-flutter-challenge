import 'package:flutter/material.dart';

void main() => runApp(OshinagakiApp());

class OshinagakiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Oshinagaki App",
      home: MainController(),
    );
  }
}

class MainController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Oshinagaki App"),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              title: Text("home"),
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              title: Text("search"),
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
                title: Text("account"), icon: Icon(Icons.account_circle)),
          ],
        onTap: ,
      ),
    );
  }
}
