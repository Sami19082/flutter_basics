import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class Riveanimation extends StatefulWidget {
  const Riveanimation({super.key});

  @override
  State<Riveanimation> createState() => _RiveanimationState();
}

class _RiveanimationState extends State<Riveanimation> {
  StateMachineController? _controller;
  Artboard? _riveArtboard;
  SMIInput<bool>? isLooping;

  @override
  void initState() {
    super.initState();
    rootBundle.load("assets/rive&lottie/fire.riv").then((data) async {
      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;
      _controller = StateMachineController.fromArtboard(artboard, "State Machine 1");
      if (_controller != null) {
        artboard.addController(_controller!);
        setState(() {
          _riveArtboard = artboard;
          isLooping = _controller?.findInput("Is Looping");
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rive Animation"),
        centerTitle: true,
      ),
      body: _riveArtboard!=null ? Center(
        child: Rive(artboard: _riveArtboard!),
      ) : CircularProgressIndicator(),
      );
  }
}
