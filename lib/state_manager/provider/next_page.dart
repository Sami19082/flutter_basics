import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_provider.dart';

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    TextEditingController descController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title:  Text("Next Page For Provider"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: TextField(
              controller: textController,

            ),
          ),
          Expanded(
            child: TextField(
              controller: descController,
            ),
          ),
          // FloatingActionButton(
          //   onPressed: () {
          //     // Provider.of<CounterProvider>(context,listen: false).incrementCounter();
          //     //alternative method
          //     context.read<CounterProvider>().countValue = int.parse(textController.text);
          //     ///to get value from user / controller
          //     // context.read<CounterProvider>().decrementCounter();
          //   },
          //   child: Icon(Icons.add),
          // ),
          // FloatingActionButton(
          //   onPressed: () {
          //     // Provider.of<CounterProvider>(context,listen: false).incrementCounter();
          //     //alternative method
          //     // context.read<CounterProvider>().decrementCounter();
          //     context.read<CounterProvider>().countValue = int.parse(textController.text);
          //   },
          //   child: Icon(Icons.minimize),
          // ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        if( textController.text.isNotEmpty && descController.text.isNotEmpty){
          context.read<CounterProvider>().addTodo({
            "title": textController.text.toString(),
            "description": descController.text.toString()
          });
        }
      },child: Icon(Icons.add),),
    );
  }
}
