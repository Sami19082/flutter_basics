import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({super.key});

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  Duration? currPosValue = Duration.zero;
  Duration? totalPosValue = Duration.zero;
  Duration? buffPosValue = Duration.zero;
  final player = AudioPlayer();
  var audioUrl =
      "https://commondatastorage.googleapis.com/codeskulptor-assets/Epoq-Lepidoptera.ogg";

  @override
  void initState() {
    super.initState();
    setMyAudio();
  }

  void setMyAudio() async {
    totalPosValue =  await player.setUrl(audioUrl);
    player.play();

    player.positionStream.listen((event) {
      setState(() {
        currPosValue = event;
      });
    });
    player.bufferedPositionStream.listen((event) {
      setState(() {
        buffPosValue = event;
      });
    });
    player.durationStream.listen((event) {
      setState(() {
        totalPosValue = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProgressBar(
              progress: currPosValue ?? Duration.zero,
              buffered: buffPosValue ?? Duration.zero,
              total: totalPosValue ?? Duration.zero,
              onSeek: (duration) {
                player.seek(duration);
                setState(() {

                });
              },
              progressBarColor: Colors.amber,
              baseBarColor: Colors.grey,
              bufferedBarColor: Colors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.skip_previous),
                IconButton(
                    onPressed: () {
                      setState(() {
                        if (player.playing) {
                          player.pause();
                        } else {
                          player.play();
                        }
                      });
                    },
                    icon: Icon(
                      player.playing ? Icons.pause : Icons.play_arrow
                    )),
                Icon(Icons.skip_next),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
