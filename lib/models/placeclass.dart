import 'package:uuid/uuid.dart';
import 'dart:io';

const uuid = Uuid();

class placeclass {
  placeclass({
    required this.title,
    required this.image,
    String? id,
  }) : id =  id ?? uuid.v4();
  //if id is null  then assign v4 id "??" operator use

  final String id;
  final String title;
  final File image;
}
