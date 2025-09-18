

import 'package:flutter/material.dart';

void main(){
  runApp(wallpaper());
}

class wallpaper extends StatelessWidget {
  const wallpaper({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: wallhome(),);
  }
}

class wallhome extends StatelessWidget {
  const wallhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wallpapers"),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.yellow,
          ),
          /// always divide 4 part for position of the widget ///
          Positioned(
            top: 50,
            left: 50,
            child: Center(
              child: Container(
                width: 200,
                height: 200,
                color: Colors.greenAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

