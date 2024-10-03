import 'package:boilerplate/core/data/local/encryption/xxtea.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast_web/sembast_web.dart';

class SembastClient {
  SembastClient(this._database);
  final Database _database;

  Database get database => _database;

  static Future<SembastClient> provideDatabase({
    required String databaseName,
    required String databasePath,
    String encryptionKey = '',
  }) async {
    // Path with the form: /platform-specific-directory/demo.db
    final String dbPath = join(databasePath, databaseName);

    // Check to see if encryption is set, then provide codec
    // else init normal db with path
    // Database database;
    final Database database;
    if (encryptionKey.isNotEmpty) {
      SembastCodec codec = getXXTeaCodec(password: encryptionKey);

      // Initialize the encryption codec with a user password
      if (kIsWeb) {
        DatabaseFactory factory = databaseFactoryWeb;
        database = await factory.openDatabase(databaseName, codec: codec);
      } else {
        database = await databaseFactoryIo.openDatabase(dbPath, codec: codec);
      }
    } else {
      if (kIsWeb) {
        DatabaseFactory factory = databaseFactoryWeb;
        database = await factory.openDatabase(databaseName);
      } else {
        database = await databaseFactoryIo.openDatabase(dbPath);
      }
    }

    // Return database instance
    return SembastClient(database);
  }
}
