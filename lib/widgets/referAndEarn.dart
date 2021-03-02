import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social/utils/custonBtn.dart';

class refer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          Image.asset('assets/images/refeer.png',
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
          // MediaQuery.of(context).size.height/2,
          //child:

          Center(


            child:
            Align(
              alignment: Alignment.topRight,
              child:
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
                child: FlatButton(
                  color: Colors.orange,
                  splashColor: Colors.black12,
                  onPressed: (){
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                    child: Text(
                        "Refer Now",
                    ),
                  ),

                ),
              ),

            ),
          )

        ],
      ),


    );
  }
}
