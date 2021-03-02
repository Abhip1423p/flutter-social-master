import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social/Affiliate.dart';
import 'package:flutter_social/views/tabs/notifications.dart';
import 'package:flutter_social/widgets/task.dart';



class scroll extends StatelessWidget {
  const scroll();

  @override
  Widget build(BuildContext context) {
    Size screenSize  = MediaQuery.of(context).size;
    final double categoryHeight = MediaQuery.of(context).size.height * 0.30 - 120;

    //width: MediaQuery.of(context).size.width
    return

     // SingleChildScrollView(
      //  physics:BouncingScrollPhysics(),

       // scrollDirection: Axis.horizontal,


           // child:
          Container(


            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: FittedBox(
                fit: BoxFit.fill,
                alignment: Alignment.center,
                child: Row(
                    children: <Widget>[


// this will be for share product
                      GestureDetector(
                        onTap:() {
                          Navigator.of(context).push(MaterialPageRoute<Null>(
                              builder: (BuildContext context) {
                                return new Affiliate();
                              }));
                        },
                      child:
                      Container(

                                width: 100,
                        margin: EdgeInsets.only(right: 20),
                        height: categoryHeight,
                        decoration: BoxDecoration(color: Colors.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(20.0))),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                          Align(
                          alignment: Alignment.center,
                              child:

                              Image.asset("assets/images/share_prodcut.png"),

                          ),
                             Text("shopping",textAlign: TextAlign.center,style: TextStyle(  fontSize: 10, color: Colors.black, fontWeight: FontWeight.bold),),
                             // SizedBox.(
                             //
                             // ),

                            ],
                          ),
                        ),
                      ),

            ),

                      // for task
                      GestureDetector(
                          onTap:() {
                            Navigator.of(context).push(MaterialPageRoute<Null>(
                                builder: (BuildContext context) {
                                  return new     task();            //NotificationsPage();
                                }));
                          },
                          child:
                Container(
                        width: 100,
                        margin: EdgeInsets.only(right: 20),
                        height: categoryHeight,
                        decoration: BoxDecoration(color: Colors.white ,borderRadius: BorderRadius.all(Radius.circular(20.0))),

                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),  //12
                              child: Column(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[

                                  Align(

                                    alignment: Alignment.center,
                                    child:


                                    Image.asset("assets/images/bag.jpg"),
                                    

                                  ),
                       // Text("Complete Task", textAlign: TextAlign.center,)
                                  //SizedBox.expand(

                                 // ),

                                ],
                              ),

                            ),


                        ),

                      ),

                      ),


// for add money
          GestureDetector(
            onTap:() {
              Navigator.of(context).push(MaterialPageRoute<Null>(
                  builder: (BuildContext context) {
                    return new NotificationsPage();
                  }));
            },
            child:
            Container(
                        width: 100,
                        margin: EdgeInsets.only(right: 20),
                        height: categoryHeight,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20.0))),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.center,
                                child:
                                Image.asset("assets/images/bag.jpg"),

                              ),

                              //SizedBox.expand(

                             // ),


                            ],
                          ),
                        ),
                      ),

          ),
                  ],
                  ),
         ),
            );


  }
  }

