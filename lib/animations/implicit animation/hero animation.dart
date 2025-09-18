import 'package:flutter/material.dart';

class HeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Hero Animation'),
        ),
        body: Center(
          child: GridView.builder(
              itemCount: Colors.primaries.length,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 4 / 4,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImagePage(
                          tag: "$index",
                        ),
                      ),
                    );
                  },
                  child: Hero(
                    tag: "$index",
                    child: Container(
                      color:Colors.primaries[int.parse("$index")],
                    ),
                  ),
                );
              }),
        ));
  }
}

class ImagePage extends StatelessWidget {
  String tag;

  ImagePage({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Hero(
            tag: tag,
            child: Container(
              color:Colors.primaries[int.parse(tag)],
            )),
      ),
    );
  }
}
