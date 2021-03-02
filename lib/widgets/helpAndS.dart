

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text(
          " Help & Support ",style: TextStyle(
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
      body:

    Container(
    child: Column(

    children:[



        Image.asset('assets/images/get_support.jpg'),
          SizedBox(
            height: 30,
            width: 10
          ),
        //Divider(height: 20.0,color: Colors.white,thickness: 10.0,),

           Text( "Earnezy Support",
             style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold),

           ),
SizedBox(
  height: 20,
  width: 10
),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text("We are here to help you,in case of any issue kindlly contact with us.",style: TextStyle(
fontSize: 20
            ),),
          ),

          SizedBox(
              height: 10,
              width: 10
          ),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Email",style: TextStyle(
              fontSize: 20,fontWeight: FontWeight.bold
            ),),
          ),
      SizedBox(
        height: 5,
        width: 5,
      ),
          
      Text("help.earnezy@gmail.com",style: TextStyle(
        fontSize: 20
      ),
      ),
      SizedBox(
        height: 5,
        width: 5,
      ),

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Whatsapp",style: TextStyle(
            fontSize: 20,fontWeight: FontWeight.bold
        ),),
      ),
      Text("8527481827",style: TextStyle(
          fontSize: 20
      ),
      ),


        ],
      ),



    ),

    );

   // );
  }



}
