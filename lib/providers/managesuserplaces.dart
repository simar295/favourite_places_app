import 'package:riverpod/riverpod.dart';
import 'package:favourite_places_app/models/placeclass.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:path/path.dart' as path;

class userplacesnotifier extends StateNotifier<List<placeclass>> {
  userplacesnotifier() : super(const []);

  void addplace(String title, File image) async {
    final appdir = await syspath.getApplicationDocumentsDirectory();
    final filename = path.basename(image.path);
    final copyimage = await image.copy('${appdir.path}/$filename');

    final newplace = placeclass(title: title, image: copyimage);
    state = [newplace, ...state];
  }
}

final userplacesprovider =
    StateNotifierProvider<userplacesnotifier, List<placeclass>>(
  (ref) => userplacesnotifier(),
);
