import 'package:flutter/material.dart';
class Imageclipper extends StatelessWidget {
  const Imageclipper({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ImageCLipper"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipPath(
              clipper: MyClipper(),
              child: Image.asset("lib/assets/wedding_drone.jpg",fit: BoxFit.cover),
            ),
          ),
        ));
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var mPath = Path();
    mPath.lineTo(size.width, 0);
    mPath.lineTo(size.width, size.height*0.8);
    mPath.cubicTo(size.width*0.75, size.height*0.5, size.width*0.25, size.height, 0, size.height*0.8);
    // mPath.moveTo(0, size.height*0.8);
    // mPath.lineTo(size.width*0.5, size.height);
    //cubic curve
    // mPath.cubicTo(size.width*0.7, size.height*0.2, size.width*0.7, size.width*0.5, size.width*0.5, size.height);
    // mPath.lineTo(size.width*0.75, size.width*0.75);
    // /// Custom Clipper ///
    // mPath.quadraticBezierTo(size.width*0.6,size.height*0.2, 0, 0);
    // mPath.quadraticBezierTo(size.width*0.25, size.height*0.7, 0, 0);
    mPath.close();
    return mPath;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

///another way also ///
// child: ClipOval(
//     child: Image.asset("lib/assets/wedding_drone.jpg",fit: BoxFit.cover)),