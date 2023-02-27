import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tofed/models/tode_models.dart';

class AddTodoview extends StatefulWidget {
  const AddTodoview({Key? key}) : super(key: key);

  @override
  State<AddTodoview> createState() => _AddTodoviewState();
}

class _AddTodoviewState extends State<AddTodoview> {
  final forKey = GlobalKey<FormState>();
  bool isCompleted = false;
  final title = TextEditingController();
  final decription = TextEditingController();
  final auther = TextEditingController();

  Future<void> addTode() async {
    final db = FirebaseFirestore.instance;
    final tode = Todo(
        title: title.text,
        decription: decription.text,
        isCompleted: isCompleted,
        author: auther.text);
    await db.collection('todes').add(tode.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AddTodoview')),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
            key: forKey,
            child: ListView(
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  controller: title,
                  decoration: const InputDecoration(
                      hintText: 'Title', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: decription,
                  maxLines: 7,
                  decoration: InputDecoration(
                      hintText: 'Decription', border: OutlineInputBorder()),
                ),
                SizedBox(height: 50),
                CheckboxListTile(
                    title: Text('Belgile'),
                    value: isCompleted,
                    onChanged: (v) {
                      setState(() {
                        isCompleted = v ?? false;
                      });
                    }),
                SizedBox(height: 20),
                TextFormField(
                  controller: auther,
                  decoration: InputDecoration(
                    hintText: 'Auther',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Title toltor';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 50),
                ElevatedButton.icon(
                    onPressed: () async {
                      if (forKey.currentState!.validate()) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                title: Text('kutyyy'),
                                content: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(40.0),
                                  child: CupertinoActivityIndicator(
                                    radius: 30,
                                  ),
                                )),
                              );
                            });
                        await addTode();
                        Navigator.popUntil(context, (route) => route.isFirst);
                      }
                    },
                    icon: Icon(Icons.publish),
                    label: Text('Add todo'))
              ],
            )),
      ),
    );
  }
}
