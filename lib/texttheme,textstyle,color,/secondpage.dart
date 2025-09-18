import 'package:classico/texttheme,textstyle,color,/provider_dark_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
        centerTitle: true,
      ),
      body: Center(
        child:Switch(
            value: context.watch<ThemeProvider>().themeValue,
            onChanged: (value) {
              // context.read<ThemeProvider>().themeValue =
              //     !context.read<ThemeProvider>().themeValue;
              Provider.of<ThemeProvider>(context, listen: false).themeValue =
                  value;
            })
      )
    );
  }
}
