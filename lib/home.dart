
 // earn easy social

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social/drawer.dart';
import 'package:flutter_social/upload_page.dart';
import 'package:flutter_social/drawer.dart';
import 'PostItem.dart';
import 'data.dart';
import 'package:http/http.dart' as http;

import 'notifications.dart';

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response =
  await client.post('https://earnezy.in/android_shop/getWebPosts.php');

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePhotos, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Photo> parsePhotos(String responseBody) {
  final parsed1 = jsonDecode(responseBody);
  final parsed=parsed1.cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

class Photo {
  final String type;
  final String name;
  final String id;
  final String profile_pic;
  final String title;
  final String filepath;

  Photo({this.type ,this.name, this.id, this.title, this.profile_pic, this.filepath});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      name: json['name'] as String,
      id: json['id'] as String,
      title: json['comments'] as String,
      profile_pic: json['profile_pic'] as String,
      filepath: json['filepath'] as String,
    );
  }
}


class Home extends StatefulWidget {
  @override
  HOMEX createState() => HOMEX();
}

class HOMEX extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: AppDrawer(),
      ),
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? _HomeState(photos: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class _HomeState extends StatelessWidget {

  final List<Photo> photos;

  _HomeState({Key key, this.photos}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: Drawer(
        child: AppDrawer(),
      ),
      backgroundColor: Colors.white10,

      appBar: AppBar(
        title: Text("Earnezy Social",style: TextStyle(
            color: Theme.of(context).accentColor,
            )),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Theme.of(context).accentColor),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.cloud_upload,
            ),
            onPressed: () {
                                Navigator.of(context)
                      .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
                    return new Uploader();
                  }));
            },
          ),
        ],
      ),
      body:
      ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 4),
        itemCount: photos.length,
        itemBuilder: (BuildContext context, int index) {
          Map post = posts[index];
          return
            PostItem(
            img: "https://earnezy.in/android_shop/"+photos[index].filepath,
            name:photos[index].name,
            dp: "https://earnezy.in/android_shop/"+photos[index].profile_pic,
            time: "10 min",
          );
        },
      ),
    );
  }
}
