import 'package:classico/backends/offline_data_manage/database/user_onboarding/loginpage.dart';
import 'package:flutter/material.dart';

import 'map location/maps.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GoogleMaps(),
    );
  }
}
