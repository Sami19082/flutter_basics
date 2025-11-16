import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  String videoUrl =
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4";
  late VideoPlayerController _controller;
  Future<void>? initialized;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
    initialized = _controller.initialize();
    _controller.setLooping(true);
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Video Player'),
        ),
        body: FutureBuilder(
            future: initialized,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                return AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: Stack(
                      children: [
                        VideoPlayer(_controller),
                        Center(
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (_controller.value.isPlaying) {
                                    _controller.pause();
                                  } else {
                                    _controller.play();
                                  }
                                });
                              },
                              icon: Icon(
                                  _controller.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  color: _controller.value.isPlaying
                                      ? Colors.transparent
                                      : Colors.black)),
                        ),
                        Positioned(
                          bottom: -20,
                          left: 0,
                          right: 0,
                          child: Slider(
                              inactiveColor: Colors.black,
                              activeColor: Colors.white,
                              value: _controller.value.position.inSeconds
                                  .toDouble(),
                              min: 0,
                              max: _controller.value.duration.inSeconds
                                  .toDouble(),
                              onChanged: (seekTo) {
                                setState(() {
                                  _controller.seekTo(
                                      Duration(seconds: seekTo.toInt()));
                                });
                              }),
                        ),
                        Positioned(
                            bottom: 0,
                            left: 100,
                            right: 0,
                            child: Row(
                              children: [
                                Text(
                                  getDuration(),
                                  style: TextStyle(color: Colors.white),),
                              ],
                            ))
                      ],
                    ));
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return Container();
            }));
  }

  String getDuration() {
    var min = _controller.value.position.inMinutes;
    var sec = _controller.value.position.inSeconds;
    return "$min:$sec";
  }
}
