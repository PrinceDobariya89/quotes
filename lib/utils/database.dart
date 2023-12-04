import 'package:quotes/model/quote.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> initDatabase() async {
  final String path = join(await getDatabasesPath(), 'quotes.db');
  String sql =
      "CREATE TABLE quotes(id INTEGER PRIMARY KEY,quote TEXT,author TEXT,category TEXT)";
  return openDatabase(path,
      onCreate: (db, version) => db.execute(sql), version: 1);
}

Future<void> insertQuotes(List<Quote> quotes) async {
  final Database db = await initDatabase();
  quotes.forEach((element) async {
    await db.insert('quotes',element.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
  });
}

Future<Future<List<Map<String, Object?>>>> fetchData()async{
  final Database db = await initDatabase();
  var show = await db.query('quotes');
  print("------");
  print(show.toString());
  print("------");
  return db.query('quotes');
}