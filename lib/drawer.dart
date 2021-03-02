
//import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_social/Affiliate.dart';
import 'package:flutter_social/home.dart';
import 'package:flutter_social/profile.dart';
import 'package:flutter_social/views/login.dart';
import 'package:flutter_social/widgets/helpAndS.dart';
import 'package:flutter_social/widgets/termAndCondition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_social/main_screen.dart';

import 'Category.dart';
import 'data.dart';
import 'fAndQ.dart';
import 'loginSec.dart';
import 'mainPageEarneasy.dart';

class AppDrawer extends StatefulWidget {
  static Random random = Random();
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

String x_id;
class _AppDrawerState extends State<AppDrawer> {

  @override
  void initState() {
   // TODO: implement initState
    super.initState();
    getPref();
  }

  getPref() async {
   SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
     int status = preferences.getInt("status");
      x_id = preferences.getString("id");
    });
  }



  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("YES"),
      onPressed: () {
        signOut();
      },
    );

    Widget Cancel = FlatButton(
      child: Text("NO"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Logout"),
      content: Text("Are you sure you want to Logout?"),
      actions: [okButton, Cancel],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
//    AuthBlock auth = Provider.of<AuthBlock>(context);
    return
Container(
        padding: EdgeInsets.only(top: 35.0,bottom: 10.0),
       child:
       Column(

            children: <Widget>[

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

 Text(
    "profile",
    style: TextStyle(
    color: Colors.teal, fontSize: 30.0, fontWeight: FontWeight.bold,
    ),
    ),

              Divider(height: 10.0,color: Colors.white,thickness: 6.0,),


    Expanded(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.home, color: Theme.of(context).accentColor),
                title: Text('Dashboard'),
                onTap: () {
                  Navigator.pop(context);

                 // Navigator.pushNamed(context, '/Products');

                       Navigator.push(context, new MaterialPageRoute(
                           builder: (context) =>  MainScreen(),
                       ));
                },
              ),
              Divider(height: 10.0,color: Colors.white,thickness: 6.0,),

              //Divider(height: 10.0,color: Colors.white,thickness: 6.0,),
              ListTile(
                leading:
                    Icon(Icons.category, color: Theme.of(context).accentColor),
                title: Text('Categories'),
                onTap: () {
                 if (x_id == null || x_id.isEmpty) {
                   Navigator.of(context).push(MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                      return new      Categories();   // homeE();
                  }));
                  } else if(x_id.isNotEmpty){
                    Navigator.of(context).push(MaterialPageRoute<Null>(
                       builder: (BuildContext context) {
                     return new Categories();
                   }));
                 }
                },
              ),
              Divider(height: 10.0,color: Colors.white,thickness: 6.0,),
              ListTile(
                leading: Icon(Icons.store_rounded,
                    color: Theme.of(context).accentColor),
                title: Text('Stores'),
             onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                      MaterialPageRoute<Null>(builder: (BuildContext context) {
                   return new Affiliate() ;
                 }));
                },
              ),
              Divider(height: 10.0,color: Colors.white,thickness: 6.0,),
              ListTile(
                leading: Icon(Icons.account_circle,
                    color: Theme.of(context).accentColor),
                title: Text('Profile'),
                onTap: () {
                 if (x_id == null || x_id.isEmpty) {
                   Navigator.of(context).push(MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                      return new  log();              //LoginPage();
                   }));
                  } else if(x_id.isNotEmpty){
                    Navigator.of(context).push(MaterialPageRoute<Null>(
                        builder: (BuildContext context) {
                     return new Profile();
                    }));
                  }
                },
              ),
              Divider(height: 10.0,color: Colors.white,thickness: 6.0,),

              ListTile(
                leading:
                    Icon(Icons.ac_unit, color: Theme.of(context).accentColor),
                title: Text('FAQ'),
                onTap: () {
                  Navigator.pop(context);
                 Navigator.of(context).push(
                     MaterialPageRoute<Null>(builder: (BuildContext context) {
                   return new fAndQE();
                 }));
                },
              ),
              Divider(height: 10.0,color: Colors.white,thickness: 6.0,),
              ListTile(
                leading:
                    Icon(Icons.title, color: Theme.of(context).accentColor),
                title: Text('Terms & Conditions'),
                onTap: () {
                 Navigator.pop(context);
                  Navigator.of(context).push(
                     MaterialPageRoute<Null>(builder: (BuildContext context) {
                   return new term();
                 }));
                },
              ),
              Divider(height: 10.0,color: Colors.white,thickness: 6.0,),
              ListTile(
                leading:
                    Icon(Icons.contacts, color: Theme.of(context).accentColor),
                title: Text('Contact Us'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                      MaterialPageRoute<Null>(builder: (BuildContext context) {
                    return new Help();
                  }));
                },
              ),
             // Divider(height: 10.0,color: Colors.white,thickness: 6.0,),














              Divider(height: 10.0,color: Colors.white,thickness: 6.0,),
              ListTile(
                leading: Icon(Icons.exit_to_app,
                    color: Theme.of(context).accentColor),
                title: Text('Logout'),
                onTap: () async {
//                  if (x_id == null || x_id.isEmpty) {
//                    Navigator.of(context).push(MaterialPageRoute<Null>(
//                        builder: (BuildContext context) {
//                      return new AppSignIn();
//                    }));
//                  } else if(x_id.isNotEmpty){
//                    showAlertDialog(context);
//                  }
                },
              )
            ],
          ),
        ),
],
      ),
);




  }

 signOut() async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
   setState(() {
     preferences.setString("value", null);
     preferences.setString("name", null);
     preferences.setString("email", null);
      preferences.setString("id", null);
     preferences.setInt("status", null);

      preferences.commit();
     Navigator.of(context).pushReplacement(
         MaterialPageRoute<Null>(builder: (BuildContext context) {
       return new  log();      //LoginPage();                     //AppSignIn();
     }));
    });
  }
}
