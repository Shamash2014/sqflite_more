import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite_ffi_test/sqflite_ffi.dart';

void main() {
  // Set sqflite ffi support in test
  TestWidgetsFlutterBinding.ensureInitialized();
  sqfliteFfiInit();

  var databaseFactory = databaseFactoryFfi;
  test('simple sqflite example', () async {
    var db = await databaseFactory.openDatabase(inMemoryDatabasePath);
    expect(await db.getVersion(), 0);
    await db.close();

    db = await databaseFactory.openDatabase(inMemoryDatabasePath,
        options: OpenDatabaseOptions(version: 1));
    expect(await db.getVersion(), 1);
    await db.close();

    db = await databaseFactory.openDatabase('simple_version_1.db',
        options: OpenDatabaseOptions(version: 1));
    expect(await db.getVersion(), 1);
    await db.close();
  });
}
