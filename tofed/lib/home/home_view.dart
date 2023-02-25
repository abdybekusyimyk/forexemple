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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Text'),
      ),
      body: StreamBuilder(
        stream: readTodos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot.hasData) {
            final List<Todo> todos = snapshot.data!.docs
                .map((e) => Todo.fromJson(e.data() as Map<String, dynamic>))
                .toList();
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (BuildContext context, int intex) {
                final todo = todos[intex];
                return Card(
                  child: ListTile(
                    title: Text(todo.title),
                    // trailing: Checkbox(
                    //   value: todo.isCompleted,
                    //   onChanged: (v) {},
                    // ),
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
            return Center(
              child: Text('Some Error'),
            );
          }
        },
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       const Text(
      //         'You have pushed the button this many times:',
      //       ),
      //       Text(
      //         'o',
      //         style: Theme.of(context).textTheme.headlineMedium,
      //       ),
      //     ],
      //   ),
      // ),
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
