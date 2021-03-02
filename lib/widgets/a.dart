import 'package:flutter/material.dart';

class cat1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              foregroundDecoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/watch_videos.png"),
                )




              ),
            )
          ],
        ),

      ),



    );
  }
}
