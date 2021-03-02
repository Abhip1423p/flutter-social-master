

import 'package:flutter/material.dart';

class task extends StatelessWidget {


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text("Earnezy"

      ),
      ),
body:
Column(

  children: [
    SizedBox(
      height: 10,
      width: 10
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 370,
        height: 110,

        child: Column(
children: [
  Text("Task #1"
        ,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
  SizedBox(
        height: 10,
        width: 10
  ),
  Text("Open App every day and you will get upto 5 points"),
  SizedBox(
        height: 10,
        width: 10
  ),
],
        ),

        decoration: new BoxDecoration(
            color: Colors.white
        ),
        ),
    ),




    SizedBox(
        height: 10,
        width: 10
    ),



    SizedBox(
        height: 10,
        width: 10
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 370,
        height: 110,

        child: Column(
          children: [
            Text("Task #2"
                ,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
            SizedBox(
                height: 5,
                width: 0
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("watch a video to earn 5 points.you must watch the video till the timer end"),
            ),
            SizedBox(
                height: 10,
                width: 10
            ),
          ],
        ),

        decoration: new BoxDecoration(
            color: Colors.white
        ),
      ),
    ),






















    SizedBox(
        height: 10,
        width: 10
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 370,
        height: 110,

        child: Column(
          children: [
            Text("Task #3"
                ,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
            SizedBox(
                height: 10,
                width: 10
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Go on Deals and follow steps given to earn"),
            ),
            SizedBox(
                height: 10,
                width: 10
            ),
          ],
        ),

        decoration: new BoxDecoration(
            color: Colors.white
        ),
      ),
    ),



  ],
),


    );
  }
}
