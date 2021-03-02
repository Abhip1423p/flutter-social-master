
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_social/_routing/routes.dart';
import 'package:flutter_social/main_screen.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:flutter_social/utils/custonBtn.dart';
import 'package:flutter_social/widgets/api.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../loginSec.dart';
import '../mainPageEarneasy.dart';
class LoginPage extends StatefulWidget {

  bool _isLoading = false;


  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String message ='';
bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    // Change Status Bar Color
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: primaryColor),
    );
    final pageTitle = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Log In.",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 45.0,
          ),
        ),
        Text(
          "We missed you!",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );

    final emailField = TextFormField(
      decoration: InputDecoration(
        labelText: 'Email Address',
        labelStyle: TextStyle(color: Colors.white),
        prefixIcon: Icon(
          LineIcons.envelope,
          color: Colors.white,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
    );

    final passwordField = TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(color: Colors.white),
        prefixIcon: Icon(
          LineIcons.lock,
          color: Colors.white,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      obscureText: true,
    );

    final loginForm = Padding(
      padding: EdgeInsets.only(top: 30.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[emailField, passwordField],
        ),
      ),
    );

    final TextEditingController emailController = new TextEditingController();
    final TextEditingController passwordController = new TextEditingController();

    final loginBtn = Container(
      margin: EdgeInsets.only(top: 40.0),
      height: 60.0,
      width: MediaQuery
          .of(context)
          .size
          .width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        border: Border.all(color: Colors.white),
        color: Colors.white,
      ),
      child:

      CustomButton(
          onBtnPressed: () async {
            if (_formKey.currentState.validate()) {
              var email = emailController.text;
              var password = passwordController.text;
              setState(() {
                message =
                'please wait ...';
              });
              var rsp = await loginUser(email, password);
              print(rsp);
              if (rsp.containsKey('status')) {
                setState(() {
                  message = rsp['status_text'];
                });
                if (rsp['status'] == 1) {
                  Navigator.push(context,
                      MaterialPageRoute<Null>(builder: (BuildContext context) {
                        return new homeE ();
                        //L
                      }));
                }
                else {
                  setState(() {
                    message = 'login failed';
                  }

                  );
                }
              }
            }
          },
        btnText:


                 'SIGN IN',
    //  style:  TextStyle(
      //    fontWeight: FontWeight.w800,
      //fontSize: 20.0

     // ),

    ),

    );






   // final TextEditingController emailController = new TextEditingController();
   // final TextEditingController passwordController = new TextEditingController();

    final forgotPassword = Padding(
      padding: EdgeInsets.only(top: 50.0),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, resetPasswordViewRoute),
        child: Center(
          child: Text(
            'Forgot Password?',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );

    final newUser = Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, registerViewRoute),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'New User?',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              ' Create account',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 150.0, left: 30.0, right: 30.0),
          decoration: BoxDecoration(gradient: primaryGradient),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              pageTitle,
              loginForm,
              loginBtn,
              forgotPassword,
              newUser
            ],
          ),
        ),
      ),
    );
  }

  /* void signIn(String email,String pass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map <String, String> data = {
      'email': email,
      'password': pass
    };
    var jsonResponse = null;
    var response = await http.post("https://earnezy.in/android_shop/login.php", body: data);
    if(response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if(jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => MainScreen()), (Route<dynamic> route) => false);
      }
    }
    else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
  }
*/
}
