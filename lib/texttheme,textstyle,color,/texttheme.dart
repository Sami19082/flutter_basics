import 'package:classico/texttheme,textstyle,color,/provider_dark_light.dart';
import 'package:classico/texttheme,textstyle,color,/secondpage.dart';
import 'package:classico/texttheme,textstyle,color,/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: Texttheme(),
  ));
}

class Texttheme extends StatelessWidget {
  const Texttheme({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = context.watch<ThemeProvider>().themeValue;
    return MaterialApp(
      title: "Text Theme",
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // textTheme: TextTheme(
        //   displayLarge: TextStyle(
        //     fontSize: 72.0,
        //     fontWeight: FontWeight.bold,
        //   ),
        //   titleLarge: TextStyle(
        //     fontSize: 36.0,
        //     fontStyle: FontStyle.italic,
        //     color: Colors.teal[700],
        //   ),
        //   displayMedium: TextStyle(
        //     fontSize: 25.0,
        //     fontStyle: FontStyle.italic,
        //     color: Colors.teal[700],
        //   ),
        //   bodyMedium: TextStyle(
        //     fontSize: 14.0,
        //     fontStyle: FontStyle.italic,
        //     color: Colors.teal[700],
        //   )
        // )
      ),
      home: TextThemeHome(),
    );
  }
}

class TextThemeHome extends StatelessWidget {
  bool? isDark;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Text Theme"),
          centerTitle: true,
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // Text("Hello World", style: Theme.of(context).textTheme.displayLarge,),
          // Text("Hello World", style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),),
          // Text("Hello World", style: Theme.of(context).textTheme.displayMedium,),
          // Text("Hello World", style: Theme.of(context).textTheme.bodyMedium,),
          // Text("Hello World", style: Theme.of(context).textTheme.bodySmall,),
          Text("Hello World",
              style: mTextStyle43(
                  color: isDark == true ? Colors.yellow : Colors.green)),
          Text("Hello World", style: italicTextStyle33()),
          Text("Hello World",
              style: italicTextStyle53(
                  fontWeight: FontWeight.bold, color: Colors.red)),
          Text("Hello World", style: italicTextStyle14()),
          // Switch(
          //     value: context.watch<ThemeProvider>().themeValue,
          //     onChanged: (value) {
          //       // context.read<ThemeProvider>().themeValue =
          //       //     !context.read<ThemeProvider>().themeValue;
          //       Provider.of<ThemeProvider>(context, listen: false).themeValue =
          //           value;
          //     })
        ])),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => SecondPage()));
          },
          child: Icon(Icons.settings),
        ));
  }
}
