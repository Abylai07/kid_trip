import 'dart:developer';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/end_points.dart';
import 'data/network_call.dart';

final sl = GetIt.instance;

void init() async {
  _commonModule();
  _apiServiceModule();
  _dataSourceModule();
  _repositoryModule();
}

/// для общих зависимостей
void _commonModule() {}

void _apiServiceModule() async {
  sl.registerLazySingleton(() => NetworkCall());
  sl.registerLazySingleton(() => AppData());
}

/// для локального хранения данных
void _dataSourceModule() async {}

/// для репозиторий
void _repositoryModule() {
  // sl.registerFactory(() => HomeRepository());
}

class SharedPrefsService {
  static late SharedPreferences _preferences;

  static SharedPrefsService init(SharedPreferences prefs) {
    _preferences = prefs;
    return SharedPrefsService();
  }

  dynamic getFromDisk(String key) {
    var value = _preferences.get(key);
    log('(TRACE) LocalStorageService:_getFromDisk. key: $key value: $value');
    return value;
  }

  dynamic getListFromDisk(String key) {
    var value = _preferences.getStringList(key);
    log('(TRACE) LocalStorageService:_getFromDisk. key: $key value: $value');
    return value;
  }

  void removeDataByKey(String key) {
    log('(TRACE) LocalStorageService:_removed. key: $key');
    _preferences.remove(key);
  }

  void saveToDisk<T>(String key, T content) {
    log(
      '(TRACE) LocalStorageService:_saveStringToDisk. key: $key value: $content',
    );
    if (content is String) {
      _preferences.setString(key, content);
    }
    if (content is bool) {
      _preferences.setBool(key, content);
    }
    if (content is int) {
      _preferences.setInt(key, content);
    }
    if (content is double) {
      _preferences.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences.setStringList(key, content);
    }
  }
}
