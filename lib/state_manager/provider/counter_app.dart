import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_provider.dart';
import 'next_page.dart';

void main() {
  /// put here the provider
  runApp(ChangeNotifierProvider(
      create: (context) => CounterProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CounterApp());
  }
}

class CounterApp extends StatelessWidget {
  TextEditingController textController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Counter App"),
          centerTitle: true,
        ),
        body: Consumer<CounterProvider>(builder: (ctx, provider, child) {
          return ListView.builder(

              /// when used consumer use provider not context.watch
              itemCount: provider.mData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(provider.mData[index]["title"].toString()),
                  subtitle:
                      Text(provider.mData[index]["description"].toString()),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            provider.editTodo(index, {
                              "title": textController.text.toString(),
                              "description": descController.text.toString()
                            });
                          },
                          icon: Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            provider.mData.removeAt(index);
                          },
                          icon: Icon(Icons.delete))
                    ]
                  ),
                );
              });
        }),

        // body: Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Text("You Have Pushed the button this many times"),
        //       Consumer<CounterProvider>(builder: (ctx, provider, child) {
        //         return Text("${provider.countValue}");
        //         /// in this method whole widget will not rebuild only this widget will be rebuild for better optimisations// Consumer builder is building only //
        //         // return Text(
        //         //     "${Provider.of<CounterProvider>(context).getCountValue()}");
        //       })
        //       // Text("${context.watch<CounterProvider>().getCountValue()}"),
        //       // Text("${Provider.of<CounterProvider>(context).getCountValue()}")
        //     ],
        //   ),
        // ),

        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                return NextPage();
              }));
            },
            child: Icon(Icons.navigate_before)));
  }
}
