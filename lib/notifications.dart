import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
       style: TextStyle(
        color: Theme.of(context).accentColor,
      )
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Theme.of(context).accentColor),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
