import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/list cubit/list_state.dart';
import 'list_bloc.dart';
import 'list_event.dart';

void main() {
  runApp(ListMain());
}

class ListMain extends StatelessWidget {
  const ListMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ListBloc(),
        child: ListPage(),
      ),
    );
  }
}

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Page"),
        centerTitle: true,
      ),
      body: BlocBuilder<ListBloc, ListState>(builder: (ctx, state) {
        List<Map<String, dynamic>> mapData = state.mData;
        return ListView.builder(
            itemCount: mapData.length,
            itemBuilder: (ctx, index) {
              return ListTile(
                onTap: () {
                  context.read<ListBloc>().add(EditMap(index: index, newMap: {
                        "title": "Edited Title",
                        "description": "Edited Description"
                      }));
                },
                title: Text(mapData[index]["title"]),
                subtitle: Text(mapData[index]["description"]),
                trailing: IconButton(
                    onPressed: () {
                      context.read<ListBloc>().add(DeleteMap(index: index));
                    },
                    icon: Icon(Icons.delete)),
              );
            });
      }),
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.read<ListBloc>().add(AddMapEvent(
            newMap: {"title": "New Title", "description": "New Description"}));
      }),
    );
  }
}
