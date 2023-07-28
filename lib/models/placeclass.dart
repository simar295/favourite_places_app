import 'package:uuid/uuid.dart';
import 'dart:io';

const uuid = Uuid();

class placeclass {
  placeclass({required this.title, required this.image}) : id = uuid.v4();

  final String id;
  final String title;
  final File image;
}