import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        title: Text("Shop By Category", style: TextStyle(
          color: Theme
              .of(context)
              .accentColor,
        )),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Theme
            .of(context)
            .accentColor),
      ),

      body: ListView(
          children: <Widget>[
            ListTile(
              //leading: Icon(Icons.f),
              title: Text('Fashion'),
            ),
            Divider(height: 10.0,color: Colors.white,thickness: 6.0,),
            ListTile(
             // leading: Icon(Icons.photo_album),
              title: Text('Electronic'),
            ),
            Divider(height: 10.0,color: Colors.white,thickness: 6.0,),
            ListTile(
              //leading: Icon(Icons.phone),
              title: Text('Grocery'),
             // onTap: ,
            ),
            ListTile(
              //leading: Icon(Icons.phone),
              title: Text('Education'),
            ),
            Divider(height: 10.0,color: Colors.white,thickness: 6.0,),
            ListTile(
              //leading: Icon(Icons.phone),
              title: Text("Website,Domain,Hosting"),
            ),
            Divider(height: 10.0,color: Colors.white,thickness: 6.0,),
            ListTile(
              //leading: Icon(Icons.phone),
              title: Text("Loan"),
            ),
          ]
      ),
    );
  }
}