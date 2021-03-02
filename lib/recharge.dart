
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social/drawer.dart';

class recharge extends StatefulWidget {
  @override
  _rechargeState createState() => _rechargeState();
}

class _rechargeState extends State<recharge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        drawer: Drawer(
        child: AppDrawer(),
    ),
    backgroundColor: Colors.white10,

    appBar: AppBar(
    title: Text("Earnezy Mobile Recharge",style: TextStyle(
    color: Theme.of(context).accentColor,
    )),
    centerTitle: true,
    backgroundColor: Colors.white,
    iconTheme: new IconThemeData(color: Theme.of(context).accentColor),
    ),
       body: Container(
         child: Column(
           children: <  Widget> [

           Padding
             (padding: EdgeInsets.only(top: 30.0,bottom: 40.0),
             child: TextField(
               keyboardType: TextInputType.number,
               decoration: InputDecoration(
                labelText: "mobile Number",
                // hintText: "1234...",

               ),
             ),
           ),

             TextField(
               keyboardType: TextInputType.number,
               decoration: InputDecoration(
                 labelText: "AMOUNT",
                 // hintText: "1234...",

               ),
             )



           ],
         ),
       ),

    );
  }
}