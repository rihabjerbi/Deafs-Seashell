// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:deafsseashell/learn_DATA.dart';

class Letters extends StatelessWidget{


  var lett=LETTERS_DATA;

  int _i=0;

  

  

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 20, top: 30, right: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      Image.asset("Images/learn/Frame3.png"),
                      Text(
            
                             "Letters",
                            style: TextStyle(fontSize: 24,fontFamily: 'Nunito Sans'),
                            
                        ),
                      Image.asset("Images/learn/Frame4.png"),
                    ],
            
            
            
                  ),
                  Container(
                    width: 239,
                    height: 231,
                    margin: EdgeInsets.all(50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xFFA1887F)),
                      image: DecorationImage(
                        image: AssetImage(LETTERS_DATA[_i].img) )
                    ),
                  ),
            
                  VideoPlayerScreen(),
                   const SizedBox(height: 30),
                    TextButton(
                         style: TextButton.styleFrom(
                         textStyle: const TextStyle(fontSize: 20),
                           ),
                         onPressed: (){
                           // ignore: unused_element
                           setState(){
                             _i+=1;
                           }
                           print(_i);
                         },
                         child: const Text('Next'),
          ),
            
               
                  
            
                ],
              ),
            ),
          )),
      ),
    );
  }

 
}


class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.asset(
      "Videos/Letters/A.mp4",
    );

    _initializeVideoPlayerFuture = _controller.initialize();

    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Complete the code in the next step.
    return Stack(children: [
          FutureBuilder(
  future: _initializeVideoPlayerFuture,
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {
      // If the VideoPlayerController has finished initialization, use
      // the data it provides to limit the aspect ratio of the video.
      return AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        // Use the VideoPlayer widget to display the video.
        child: VideoPlayer(_controller),
      );
    } else {
      // If the VideoPlayerController is still initializing, show a
      // loading spinner.
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  },
),

        Center(
          child: FloatingActionButton(
  onPressed: () {
    // Wrap the play or pause in a call to `setState`. This ensures the
    // correct icon is shown.
    setState(() {
      // If the video is playing, pause it.
      if (_controller.value.isPlaying) {
          _controller.pause();
      } else {
          // If the video is paused, play it.
          _controller.play();
      }
    });
  },
  // Display the correct icon depending on the state of the player.
  child: Icon(
    _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
  ),
),
        )
   
    ],);
  }
}