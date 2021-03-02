

// this is for
import 'dart:async';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social/views/home.dart';
import 'package:http/http.dart' as http;

import 'drawer.dart';


Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response =
  await client.post('https://earnezy.in/android_shop/getStores.php?cat=2');

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
  final String name;
  final String id;
  final String profile_pic;
  final String title;
  final String filepath;

  Photo({this.name, this.id, this.title, this.profile_pic, this.filepath});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      name: json['pr_title'] as String,
      id: json['p_id'] as String,
      title: json['pr_link'] as String,
      profile_pic: json['upto'] as String,
      filepath: json['pr_logo'] as String,
    );
  }
}

class Affiliate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Productx();
  }
}

class Productx extends State<Affiliate> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
        child: AppDrawer(),
    ),
    backgroundColor: Colors.white10,

    appBar: AppBar(
    title: Text("Affiliate",style: TextStyle(
    color: Theme.of(context).accentColor,
    )),
    centerTitle: true,
    backgroundColor: Colors.white,
    iconTheme: new IconThemeData(color: Theme.of(context).accentColor),
    ),
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? PhotosList(photos: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  final List<Photo> photos;

  PhotosList({Key key, this.photos}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: GridView.count(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: 16/9,
        children: photos.map((e){
          return Wrap(
              children: <Widget>[Container(
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                     .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
               //   return new ProductDetailsScreen(photos[index].id);
                 }));
                },

                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.center,
                  children: <Widget>[

                Padding(
                padding: const EdgeInsets.fromLTRB(25,25,25,25),
                      child: CachedNetworkImage(
                        alignment: Alignment.center,
                        imageUrl: e.filepath,
                        placeholder: (context, url) => Center(
                            child:
                            CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                        new Icon(Icons.error),
                      ),
                ),
                  ],
                ),
              ),
            ),
          ),],);
        }).toList(),
      ),
    );

  }
}
