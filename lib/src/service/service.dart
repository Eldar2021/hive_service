// ignore_for_file: public_member_api_docs

import 'package:hive/hive.dart';
import 'package:hive_service/src/exception/exception.dart';


class HiveService<T> {
  const HiveService(this.box);

  final Box<T> box;

  Future<void> save({required String key, required T value}) async {
    try {
      await box.put(key, value);
      await box.close();
    } catch (e) {
      throw CacheException('hive service save error $e');
    }
  }

  T? read({required String key}) {
    try {
      return box.get(key);
    } catch (e) {
      throw CacheException('hive service read error $e');
    }
  }

  Future<void> clear() async {
    try {
      await box.clear();
      await box.close();
    } catch (e) {
      throw CacheException('hive service clear error $e');
    }
  }
}
