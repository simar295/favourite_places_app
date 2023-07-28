import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class imageinput extends StatefulWidget {
  const imageinput({super.key, required this.onselectimage});

  final void Function(File image) onselectimage;

  @override
  State<imageinput> createState() => _imageinputState();
}

//////////////////////////////////////////////////////////////
class _imageinputState extends State<imageinput> {
  File? selectedimage;

  void takepicture() async {
    final imagepicker = ImagePicker();
    final pickedimage = await imagepicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (pickedimage == null) {
      return;
    }
    setState(() {
      selectedimage = File(pickedimage.path);
    });

    widget.onselectimage(selectedimage!);
  }

//////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      icon: Icon(Icons.camera),
      label: Text("take picture"),
      onPressed: takepicture,
    );

    if (selectedimage != null) {
      content = GestureDetector(
        onTap: takepicture,
        child: Image.file(
          selectedimage!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
          border: Border.all(
        width: 1,
        color: Colors.white.withOpacity(0.2),
      )),
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      child: content,
    );
  }
}
