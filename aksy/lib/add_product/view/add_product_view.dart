import 'package:flutter/material.dart';

class AddProductView extends StatelessWidget {
  AddProductView({Key? key}) : super(key: key);

  final title = TextEditingController();
  final description = TextEditingController();
  final datetime = TextEditingController();
  final phonenumber = TextEditingController();
  final username = TextEditingController();
  final address = TextEditingController();
  final price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AddProductView')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
        children: [
          CustomTextField(controller: title, hintText: 'Title'),
          CustomTextField(controller: description, hintText: 'Description'),
          CustomTextField(controller: datetime, hintText: 'DateTime'),
          CustomTextField(controller: phonenumber, hintText: 'Phone Number'),
          CustomTextField(controller: username, hintText: 'User Name'),
          CustomTextField(controller: address, hintText: 'Address'),
          CustomTextField(controller: price, hintText: 'Prise'),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.publish,
            ),
            label: const Text('Add to FireStore'),
          )
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, this.hintText, this.controller, this.maxLines, this.onTap});

  final String? hintText;
  final TextEditingController? controller;
  final int? maxLines;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      onTap: onTap,
      decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)))),
    );
  }
}
