


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class fAndQE extends StatelessWidget {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      appBar:  AppBar(
        title: Text(
          "FAQ",style: TextStyle(
          color: Theme
              .of(context)
              .accentColor,
        ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Theme
            .of(context)
            .accentColor),
      ),
   body:ListView(
       children: <Widget>[
   ListTile(
   //leading: Icon(Icons.f),
   title: Text('What is Earnezy'),
     onTap: (){
     DropdownButton<String>(
       icon: Icon(Icons.arrow_drop_down),
       iconEnabledColor: Colors.orange,
       isExpanded: true,
       value: dropdownValue,

       onChanged: (value) {



       },

     );


     },
    ),
         Divider(height: 10.0,color: Colors.white,thickness: 6.0,),
         ListTile(
           //leading: Icon(Icons.f),
           leading: Text('Where is my link for product sharing '),
          // title: Text('hello'),
         ),
         Divider(height: 10.0,color: Colors.white,thickness: 6.0,),
         ListTile(
           //leading: Icon(Icons.f),
           title: Text('How can i earn money for Product sharing'),
         ),
         Divider(height: 10.0,color: Colors.white,thickness: 6.0,),

         ListTile(
           //leading: Icon(Icons.f),
           title: Text('Is there is any Signup Bonus'),
         ),
         Divider(height: 10.0,color: Colors.white,thickness: 6.0,),

         ListTile(
           //leading: Icon(Icons.f),
           title: Text('When my referral amount is showing pending'),
         ),
         Divider(height: 10.0,color: Colors.white,thickness: 6.0,),

         ListTile(
           //leading: Icon(Icons.f),
           title: Text('Where i can share my link'),
         ),
         Divider(height: 10.0,color: Colors.white,thickness: 6.0,),
         ListTile(
           //leading: Icon(Icons.f),
           title: Text('How much i can share my link'),
         ),
         Divider(height: 10.0,color: Colors.white,thickness: 6.0,),
         ListTile(
           //leading: Icon(Icons.f),
           title: Text('Do i need to link Bank Acoount for withdwawal?'),
         ),
         Divider(height: 10.0,color: Colors.white,thickness: 6.0,),
         ListTile(
           //leading: Icon(Icons.f),
           title: Text('When i cna make a withdrwal request'),
         ),
         Divider(height: 10.0,color: Colors.white,thickness: 6.0,),
    ListTile(
    //leading: Icon(Icons.f),
    title: Text('How long does it make to recive payment in the bank?'),
    ),

      ]
   ),
    );
  }
}
