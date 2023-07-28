import 'package:riverpod/riverpod.dart';
import 'package:favourite_places_app/models/placeclass.dart';
import 'dart:io';
class userplacesnotifier extends StateNotifier<List<placeclass>> {
  userplacesnotifier() : super(const []);

  void addplace(String title,File image ) {
    final newplace = placeclass(title: title,image: image);
    state = [newplace, ...state];
  }
}

final userplacesprovider =
    StateNotifierProvider<userplacesnotifier, List<placeclass>>(
  (ref) => userplacesnotifier(),
);
