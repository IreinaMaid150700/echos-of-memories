import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../storage/app_database.dart';

@module
abstract class StorageModule {
  // 1. SharedPreferences (async init)
  @preResolve
  @lazySingleton
  Future<SharedPreferences> get sharedPreferences => SharedPreferences.getInstance();

  // 2. FlutterSecureStorage
  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage(
        // ignore: deprecated_member_use
        aOptions: AndroidOptions(encryptedSharedPreferences: true),
        iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
      );

  // 3. Drift AppDatabase
  // Database quản lý connection state riêng nên có thể Inject đồng thời như Singleton
  @lazySingleton
  AppDatabase get appDatabase => AppDatabase();
}
