import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'dart:async';
import 'main.dart';
import 'dart:io';

class Uploader extends StatefulWidget {

  _Uploader createState() => _Uploader();
}

class _Uploader extends State<Uploader> {
  File file;
  //Strings required to save address

  Map<String, double> currentLocation = Map();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  bool uploading = false;


  //method to get Location and save into variables


  Widget build(BuildContext context) {
    return file == null
        ? IconButton(
            icon: Icon(Icons.file_upload),
            onPressed: () => {_selectImage(context)})
        : Scaffold(
            resizeToAvoidBottomPadding: false,
            appBar: AppBar(
              backgroundColor: Colors.white70,
              leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: clearImage),
              title: const Text(
                'Post to',
                style: const TextStyle(color: Colors.black),
              ),
              actions: <Widget>[
                FlatButton(
                    onPressed:() {},
                    child: Text(
                      "Post",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ))
              ],
            ),
            body: ListView(
              children: <Widget>[
              //  PostForm(
               //   imageFile: file,
                 // descriptionController: descriptionController,
                 // locationController: locationController,
                 // loading: uploading,
               // ),
                Divider(), //scroll view where we will show
              ],
            ));
  }


  _selectImage(BuildContext parentContext) async {
    return showDialog<Null>(
      context: parentContext,
      barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Create a Post'),
          children: <Widget>[
            SimpleDialogOption(
                child: const Text('Take a photo'),
                onPressed: () async {
                  Navigator.pop(context);
                  File imageFile =
                      await ImagePicker.pickImage(source: ImageSource.camera, maxWidth: 1920, maxHeight: 1200, imageQuality: 80);
                  setState(() {
                    file = imageFile;
                  });
                }),
            SimpleDialogOption(
                child: const Text('Choose from Gallery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  File imageFile =
                      await ImagePicker.pickImage(source: ImageSource.gallery, maxWidth: 1920, maxHeight: 1200, imageQuality: 80);
                  setState(() {
                    file = imageFile;
                  });
                }),
            SimpleDialogOption(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  void clearImage() {
    setState(() {
      file = null;
    });
  }

  //void postImage() {
 //  setState(() {
   //  uploading = true;
   //});
  //// uploadImage(file).then((String data) {      postToFireStore(
          //mediaUrl: data,
         // description: descriptionController.text,
        // location: locationController.text);    }).then((_) {
      //setState(() {
     //  file = null;
       // uploading = false;
     // });
   // });
 //}
}

/* class PostForm extends StatelessWidget {
  final imageFile;
  final TextEditingController descriptionController;
  final TextEditingController locationController;
  final bool loading;
  PostForm(
      {this.imageFile,
      this.descriptionController,
      this.loading,
      this.locationController});

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        loading
            ? LinearProgressIndicator()
            : Padding(padding: EdgeInsets.only(top: 0.0)),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage("currentUserModel.photoUrl"),
            ),
            Container(
              width: 250.0,
              child: TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                    hintText: "Write a caption...", border: InputBorder.none),
              ),
            ),
            //Container(
              //height: 45.0,
             // width: 45.0,
           //   child: AspectRatio(
            //    aspectRatio: 487 / 451,
            //    child: Container(
           //       decoration: BoxDecoration(
              //        image: DecorationImage(
            //        fit: BoxFit.fill,
            //        alignment: FractionalOffset.topCenter,
            //        image: FileImage(imageFile),
          //        )),
          //      ),
          //    ),
        //    ),
      //    ],
        //),
      //  ListTile(
      //    leading: Icon(Icons.pin_drop),
       //   title: Container(
     //       width: 250.0,
    //        child: TextField(
    //          controller: locationController,
   //           decoration: InputDecoration(
   //               hintText: "Where was this photo taken?",
            //      border: InputBorder.none),
          //  ),
       //   ),
      //  )
     // ],
   // );
 // }
  //}



//Future<String> uploadImage(var imageFile) async {
  //var uuid = Uuid().v1();
  //StorageReference ref = FirebaseStorage.instance.ref().child("post_$uuid.jpg");
   // StorageUploadTask uploadTask = ref.putFile(imageFile);

  //String downloadUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
  //return downloadUrl;
//}
/
//void postToFireStore(
   // {String mediaUrl, String location, String description}) async {
 //var reference = Firestore.instance.collection('insta_posts');

  //reference.add({
   // "username": currentUserModel.username,
   //"location": location,
    //"likes": {},
  //  "mediaUrl": mediaUrl,
//    "description": description,
//    "ownerId": googleSignIn.currentUser.id,
//    "timestamp": DateTime.now(),
//  }).then((DocumentReference doc) {
//    String docId = doc.documentID;
//    reference.document(docId).updateData({"postId": docId});
//  });
//}
*/