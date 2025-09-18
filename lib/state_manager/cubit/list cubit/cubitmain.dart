import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'addpage.dart';
import 'list_state.dart';
import 'listcubit.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ListCubit())],
      child: Cubitmain()));
}

class Cubitmain extends StatelessWidget {
  const Cubitmain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CubitHome(),
    );
  }
}

class CubitHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cubit with Map"),
      ),
      body: BlocBuilder<ListCubit, ListState>(builder: (context, state) {
        var dataFromCubit = state.mData;
        if (state.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.isError) {
          return Center(
              child: Text(
            state.errorMsg,
            style: TextStyle(color: Colors.red),
          ));
        }
        return state.mData.isNotEmpty
            ? ListView.builder(
                itemCount: dataFromCubit.length,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CubitAdd(
                            isUpdate: true,
                            mindex: index,
                            mtitle: dataFromCubit[index]["title"].toString(),
                            mdescription:
                                dataFromCubit[index]["description"].toString());
                      }));
                    },
                    title: Text(dataFromCubit[index]["title"].toString()),
                    subtitle:
                        Text(dataFromCubit[index]["description"].toString()),
                    trailing: IconButton(
                        onPressed: () {
                          BlocProvider.of<ListCubit>(context).deleteNote(index);
                        },
                        icon: Icon(Icons.delete)),
                  );
                })
            : Center(
                child: Text("No Data Found"),
              );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (ctx) {
            return CubitAdd();
          }));
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
