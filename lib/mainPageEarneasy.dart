


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:flutter_social/views/tabs/notifications.dart';
import 'package:flutter_social/widgets/a.dart';
import 'package:flutter_social/widgets/deals.dart';
import 'package:flutter_social/widgets/game.dart';
import 'package:flutter_social/widgets/referAndEarn.dart';
import 'package:flutter_social/widgets/wallet.dart';

import 'Affiliate.dart';
import 'D.dart';
import 'categoriesScroller.dart';
import 'drawer.dart';
import 'main.dart';


class homeE extends StatefulWidget {
  @override
  _homeEState createState() => _homeEState();
}

class _homeEState extends State<homeE> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Drawer(
        child: AppDrawer(),
    ),
    appBar: AppBar(
    title: Text("Earnezy",style: TextStyle(
    color: Theme.of(context).accentColor,
    )),
    centerTitle: true,
    backgroundColor: Colors.white,
    iconTheme: new IconThemeData(color: Theme.of(context).accentColor),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.notifications, color: Colors.orange),

    onPressed: () {

    Navigator.of(context).push(MaterialPageRoute<Null>(
    builder: (BuildContext context) {
    return new NotificationsPage();
    }));
    }
    ),

      ],
    ),

body:


SingleChildScrollView(
        physics:BouncingScrollPhysics(),

    scrollDirection: Axis.vertical,
    child:

Column(

  children: [
    Container(
      child: Column(
        children: [
          Image.asset('assets/images/amazon.jpg'),
        ],
      ),
    ),
SizedBox(
  height: 5,
  width: 5,

),
    Container(
      height: 160,
        width: 370,
        decoration: new BoxDecoration(
            color: Colors.white
        ),
        child: scroll(),
    ),



    SizedBox(
      height: 5,
      width: 5,

    ),
    Container(
      height: 160,
      width: 370,
      decoration: new BoxDecoration(
          color: Colors.white
      ),
      child: wallet(),
    ),


    SizedBox(
      height: 5,
      width: 5,

    ),
    Container(
      height: 160,
      width: 370,
      decoration: new BoxDecoration(
          color: Colors.white
      ),
      child: deals (),
    ),



    Container(
      height: 260,
      width: 370,
      decoration: new BoxDecoration(
          color: Colors.white
      ),
      child: gameE (),
    ),

    SizedBox(
      height: 5,
      width: 5,

    ),
    Container(
      height: 260,
      width: 370,
      decoration: new BoxDecoration(
          color: Colors.white
      ),
      child: refer(),
    ),








  ]

    ),

    ),
    );
  }


}
