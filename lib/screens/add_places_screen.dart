import 'package:favourite_places_app/providers/managesuserplaces.dart';
import 'package:favourite_places_app/widgets/imageinput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

class addplacescreen extends ConsumerStatefulWidget {
  const addplacescreen({super.key});

  @override
  ConsumerState<addplacescreen> createState() {
    return addplacescreenstate();
  }
}

class addplacescreenstate extends ConsumerState<addplacescreen> {
  File? selectedimage;

  final titlecontroller = TextEditingController();
  @override
  void dispose() {
    titlecontroller.dispose();
    super.dispose();
  }

  void saveplace() {
    final enteredtext = titlecontroller.text;
    if (enteredtext.isEmpty || selectedimage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(milliseconds: 1000),
          content: Text(
            "Task is empty",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
      return;
    }
    ref.read(userplacesprovider.notifier).addplace(enteredtext, selectedimage!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("add new places"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(children: [
          TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(labelText: "Title"),
            controller: titlecontroller,
          ),
          SizedBox(height: 16),
          //image input
          imageinput(
            onselectimage: (image) {
              selectedimage = image;
            },
          ),
          SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: saveplace,
            icon: Icon(Icons.add),
            label: Text("add place"),
          ),
        ]),
      ),
    );
  }
}
