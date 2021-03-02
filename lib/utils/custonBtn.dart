 import 'package:flutter/material.dart';

 class CustomButton extends StatelessWidget {
   final String btnText;
   final Function onBtnPressed;
   CustomButton({this.btnText,this.onBtnPressed});
   @override
   Widget build(BuildContext context) {
   return MaterialButton(
   child: Padding(
   padding: const EdgeInsets.all(18.0),
   child: Row(
   mainAxisAlignment: MainAxisAlignment.center,
   children: [
   Text(
   btnText,
   style: Theme.of(context).textTheme.bodyText1,

   ),
   ],
   ),
   ),

   onPressed: (){},
   color: Theme.of(context).primaryColor,

   );
   }
   }
