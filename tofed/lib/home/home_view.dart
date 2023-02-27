import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tofed/home/add_view.dart';
import 'package:tofed/models/tode_models.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    // readTodos();  ////birichi
    readTodos();
  }

  // Future<void> readTodos() async {
  //   final db = FirebaseFirestore.instance;

  //   await db.collection("todes").get().then((event) {
  //     for (var doc in event.docs) {
  //       print("${doc.id} => ${doc.data()}");
  //     }
  //   });
  // }

  Stream<QuerySnapshot> readTodos() {
    final db = FirebaseFirestore.instance;
    return db.collection('todes').snapshots();
  }

/////11111111111111111111111
  // Future<void> ubdateTodo(bool isCompleted) async {
  //   final db = FirebaseFirestore.instance;
  //   await db
  //       .collection('todes')
  //       .doc('HRxPenlfJFIzfkUyRQBa')
  //       .update({'isCompleted': false});
  // }
  Future<void> ubdateTodo(Todo todo) async {
    final db = FirebaseFirestore.instance;
    await db
        .collection('todes')
        .doc(todo.id)
        .update({'isCompleted': !todo.isCompleted});
  }

  Future<void> deleteTodo(Todo todo) async {
    final db = FirebaseFirestore.instance;
    await db.collection('todes').doc(todo.id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Text'),
      ),
      body: StreamBuilder(
        stream: readTodos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot.hasData) {
            final List<Todo> todos = snapshot.data!.docs
                .map((e) =>
                    Todo.fromJson(e.data() as Map<String, dynamic>)..id = e.id)
                .toList();
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (BuildContext context, int intex) {
                final todo = todos[intex];
                return Card(
                  child: ListTile(
                    title: Text(todo.title),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          value: todo.isCompleted,
                          onChanged: (v) async {
                            await ubdateTodo(todo);
                          },
                        ),
                        IconButton(
                            onPressed: () async {
                              await deleteTodo(todo);
                            },
                            icon: const Icon(Icons.delete))
                      ],
                    ),
                    subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(todo.decription ?? ""),
                          Text(todo.author)
                        ]),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('Some Error'),
            );
          }
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddTodoview()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
