
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_social/utils/colors.dart';
import 'package:flutter_social/utils/custonBtn.dart';
import 'package:flutter_social/widgets/api.dart';
import 'package:line_icons/line_icons.dart';

import '_routing/routes.dart';

  class log extends StatefulWidget {
    @override
    _logState createState() => _logState();
  }

  class _logState extends State<log> {
    final _formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    String message =' ';
    @override
    void dispose(){
      emailController.dispose();
passwordController.dispose() ;
super.dispose();

    }


    @override
    Widget build(BuildContext context) {

      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: primaryColor),
      );

   return Scaffold(
     body:


    Column(
    children :[
  Expanded(
       child: ListView(
        children: [
          Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Form(
              key: _formKey,
              child: Column(
               children: [
                 TextFormField(
                   decoration: InputDecoration(
                     labelText: " Email",
                     labelStyle: TextStyle(fontSize: 20)
                   ),
                   controller: emailController,
                   validator: (value){
                     if(value.isEmpty){
                       return "email coannot empty " ;

                     }
                     return null;
                   },
                 ),
 SizedBox(
  height: 10.0,
),
                 TextFormField(
                   obscureText: true,
                   decoration: InputDecoration(
                       labelText: " Password",
                       labelStyle: TextStyle(fontSize: 20)
                   ),
                   controller: passwordController,
                   validator: (value){
                     if(value.isEmpty){
                       return "pass coannot empty " ;

                     }
                     return null;
                   },
                 ),
                 SizedBox(
                   height: 10.0,
                 ),
// new user

     Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Text("new user ?"),
         FlatButton(
           child: Text(
             "singup",
             style: TextStyle(fontSize: 18,color:Theme.of(context).primaryColor ),
           ),
           onPressed: (){},

         ),
       ],
     ),
CustomButton(onBtnPressed: () async {
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
      if (rsp['status'] == 1) {
        message = 's';
      }
    }

    else {
      setState(() {
        message = 'login failed';
      });
    }
  }


},


    btnText: 'Login'),
               ],
                )
              ),
            ),

        ],
       ),
     ),
        ],
   ),

   );
    }
  }



