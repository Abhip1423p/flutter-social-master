import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social/Affiliate.dart';
import 'package:flutter_social/home.dart';

class MyDrawer extends StatelessWidget {

  static Random random = Random();
  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(

        children: [
          Container(
            padding: EdgeInsets.only(top: 25.0,bottom: 10.0),
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                colors: [Colors.orangeAccent,Colors.orangeAccent],
                begin: const FractionalOffset(0.0, 0.0),
                end: const  FractionalOffset(1.1, 0.0),
                stops: [0.0,1.0],
                tileMode: TileMode.clamp,
              ),
            ),
            child: Column(
              children: [
                Material(
                  borderRadius: BorderRadius.all(Radius.circular(80.0)),
                  elevation: 8.0,
                  child: Container(
                    height: 160.0,
                    width: 160.0,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/cm${random.nextInt(10)}.jpeg")
                      ),
                    ),
                  ),

                SizedBox(
                  height: 10.0,
                ),


                Text(
                 "PROFILE Name ",
                  style: TextStyle(
                    color: Colors.teal, fontSize: 30.0, fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),  // THIS WILL OUR DRAWER HEADER
          // now add our button which we need in our drawe for that we we take sized box
          SizedBox(height: 12.0,),
          Container(
            padding: EdgeInsets.only(top: 1.0),
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                colors: [Colors.orangeAccent,Colors.orange],
                begin: const FractionalOffset(0.0, 0.0),
                end: const  FractionalOffset(1.1, 0.0),
                stops: [0.0,1.0],
                tileMode: TileMode.clamp,
              ),
            ),
            child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.home,color: Colors.white,),
                    title: Text("Home",style: TextStyle(
                        color: Colors.white
                    ),
                    ),
                    onTap: (){
                      Route route = MaterialPageRoute(builder: (c) => Home());
                      Navigator.pushReplacement(context, route);
                    },
                  ),
                  // a divider horizontal line
                  Divider(height: 5.0,color: Colors.white,thickness: 5.0,),
                  // by the here i have completed for home .
                  // for new option
                  ListTile(
                    leading: Icon(Icons.reorder,color: Colors.white,),
                    title: Text("My Oders",style: TextStyle(
                        color: Colors.white
                    ),
                    ),
                    onTap: (){
                      Route route = MaterialPageRoute(builder: (c) => Affiliate());
                      Navigator.pushReplacement(context, route);
                    },
                  ),
                  // a divider horizontal line
                  Divider(height: 10.0,color: Colors.white,thickness: 6.0,),



                  ListTile(
                    leading: Icon(Icons.shopping_bag,color: Colors.white,),
                    title: Text("My Cart",style: TextStyle(
                        color: Colors.white
                    ),
                    ),
                    onTap: (){
                      Route route = MaterialPageRoute(builder: (c) => Home());
                      Navigator.pushReplacement(context, route);
                    },
                  ),
                  // a divider horizontal line
                  Divider(height: 10.0,color: Colors.white,thickness: 6.0,),








                  ListTile(
                    leading: Icon(Icons.search,color: Colors.white,),
                    title: Text(" Search",style: TextStyle(
                        color: Colors.white
                    ),
                    ),
                    onTap: (){
                      Route route = MaterialPageRoute(builder: (c) => Home());
                      Navigator.pushReplacement(context, route);
                    },
                  ),
                  // a divider horizontal line
                  Divider(height: 10.0,color: Colors.white,thickness: 6.0,),


                  // FOR LOG OUT
                  ListTile(
                    leading: Icon(Icons.exit_to_app,color: Colors.white,),
                    title: Text(" Logout ",style: TextStyle(
                        color: Colors.white
                    ),
                    ),
                  //  onTap: (){
                    //  EcommerceApp.auth.signOut().then((c){
                     //   Route route = MaterialPageRoute(builder: (c) => Home());
                      //  Navigator.pushReplacement(context, route);




                     // } );

                   // },
                  ),
                  // a divider horizontal line
                  Divider(height: 10.0,color: Colors.white10,thickness: 6.0,),



                ]
            ),

          )

        ],

      ),
    );
  }
}
