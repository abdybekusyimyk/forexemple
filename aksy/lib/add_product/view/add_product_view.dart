// import 'package:flutter/cupertino.dart';
// import 'dart:ffi';

// import 'dart:html';

import 'dart:io';

import 'package:aksy/add_product/services/date_time_services.dart';
import 'package:aksy/add_product/services/images_picker_services.dart';
import 'package:aksy/components/custom_text_fuild.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddProductView extends StatelessWidget {
  AddProductView({Key? key}) : super(key: key);

  final title = TextEditingController();
  final description = TextEditingController();
  final datetime = TextEditingController();
  final phonenumber = TextEditingController();
  final username = TextEditingController();
  final address = TextEditingController();
  final price = TextEditingController();
  List<XFile> images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddProductView'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
        children: [
          CustomTextField(controller: title, hintText: 'Title'),
          const SizedBox(height: 12),
          CustomTextField(
              maxLines: 5, controller: description, hintText: 'Description'),
          const SizedBox(height: 12),
          ImagesContainer(
            // images: const <XFile>[],
            images: images,
            // onPicked: (images) {},
            onPicked: (value) {
              images = value;
            },
          ),
          const SizedBox(height: 12),
          CustomTextField(
            controller: datetime,
            hintText: 'DateTime',
            focusNode: FocusNode(),
            prefixIcon: const Icon(Icons.calendar_month),
            onTap: () async {
              await DateTimeServices.showDateTimePicker(
                context,
                (value) {
                  datetime.text = DateFormat("d MMM, y").format(value);
                },
              );

              // await showCupertinoModalPopup<DateTime>(
              //   context: context,
              //   builder: (BuildContext builder) {
              //     return Container(
              //       height:
              //           MediaQuery.of(context).copyWith().size.height * 0.25,
              //       color: Colors.white,
              //       child: CupertinoDatePicker(
              //         mode: CupertinoDatePickerMode.date,
              //         maximumDate: DateTime(2024),
              //         onDateTimeChanged: (value) {
              //           // datetime.text = value.toString();
              //           datetime.text = DateFormat("d MMM, y").format(value);
              //         },
              //         initialDateTime: DateTime.now(),
              //         minimumYear: 2000,
              //         maximumYear: 2030,
              //       ),
              //     );
              //   },
              // );
            },
          ),
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

// ignore: must_be_immutable
class ImagesContainer extends StatefulWidget {
  ImagesContainer({
    super.key,
    required this.images,
    required this.onPicked,
  });

  List<XFile> images;
  final void Function(List<XFile> images) onPicked;

  @override
  State<ImagesContainer> createState() => _ImagesContainerState();
}

class _ImagesContainerState extends State<ImagesContainer> {
  final service = ImagesPickerServices();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(20),
      ),
      child: widget.images.isNotEmpty
          ? Wrap(
              children: widget.images
                  .map((e) => ImagesCart(file: File(e.path)))
                  .toList()
              // Expanded(child: Image.file(File(e.path))))
              )
          : Center(
              child: IconButton(
                icon: const Icon(Icons.camera_alt_outlined, size: 50),
                onPressed: () async {
                  final value = await service.pickImages();
                  if (value != null) {
                    widget.onPicked(value);
                    widget.images = value;
                    setState(() {});
                  }
                },
              ),
            ),
    );
  }
}

class ImagesCart extends StatelessWidget {
  const ImagesCart({
    super.key,
    required this.file,
  });

  final File file;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        child: Image.file(
          file,
          fit: BoxFit.fill,
        ));
  }
}
