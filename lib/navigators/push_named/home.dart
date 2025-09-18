import 'package:flutter/material.dart';

class routehome extends StatelessWidget {
  const routehome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Center(
        child: Text("HomePage"),
      ),
    );
  }
}
