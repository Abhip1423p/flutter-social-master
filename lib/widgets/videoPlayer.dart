import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'dart:async';


class videos extends StatefulWidget {
  @override
  _videosState createState() => _videosState();
}

class _videosState extends State<videos> {
  VideoPlayerController _controller;
  Future <void> _initlizeVideoPlayerFuture;

  @override
  void initState() {


    _controller = VideoPlayerController.network("our url of video");
    // TODO: implement initState


    _initlizeVideoPlayerFuture = _controller.initialize();
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initlizeVideoPlayerFuture,
        builder: (context, snapshot){
          if(snapshot.connectionState==ConnectionState.done){

            return AspectRatio(aspectRatio: _controller.value.aspectRatio ,
            child: VideoPlayer(_controller)

            );
          }
          else
            {
              return Center(child: CircularProgressIndicator());
            }
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            if(_controller.value.isPlaying){
              _controller.pause();

            }
            else
              {
                _controller.play();
              }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),

    );
  }
}
