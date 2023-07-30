import 'package:riverpod/riverpod.dart';
import 'package:favourite_places_app/models/placeclass.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

class userplacesnotifier extends StateNotifier<List<placeclass>> {
  userplacesnotifier() : super(const []);

  Future<Database> getdatabase() async {
    final dbpath = await sql.getDatabasesPath();
    final db = await sql.openDatabase(path.join(dbpath, "places.db"),
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE user_places(id TEXT PRIMARY KEY,title TEXT  , image TEXT, lat  REAL, lng REAL , address TEXT)");
    }, version: 1);
    return db;
  }

  Future<void> loadplaces() async {
    final db = await getdatabase();
    final data = await db.query(
      'user_places',
    );
    final places = data
        .map(
          (row) => placeclass(
            id: row["id"] as String,
            title: row["title"] as String,
            image: File(row["image"] as String),
          ),
        )
        .toList();
    state = places;
  }

  void addplace(String title, File image) async {
    final appdir = await syspath.getApplicationDocumentsDirectory();
    final filename = path.basename(image.path);
    final copyimage = await image.copy('${appdir.path}/$filename');

    final newplace = placeclass(title: title, image: copyimage);
    state = [newplace, ...state];

/////////////////////////////////////////////////////////////
    final db = await getdatabase();
    db.insert('user_places', {
      'id': newplace.id,
      'title': newplace.title,
      'image': newplace.image.path,
      /*  'lat':newplace.location */
    });
  }
}

final userplacesprovider =
    StateNotifierProvider<userplacesnotifier, List<placeclass>>(
  (ref) => userplacesnotifier(),
);
