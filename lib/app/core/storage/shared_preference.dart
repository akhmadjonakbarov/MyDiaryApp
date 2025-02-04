import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static final SharedPrefsHelper _instance = SharedPrefsHelper._internal();
  SharedPreferences? _prefs;

  // Private constructor
  SharedPrefsHelper._internal();

  /// Factory constructor for returning the same instance
  factory SharedPrefsHelper() => _instance;

  /// Initialize SharedPreferences instance
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Save data methods
  Future<void> setString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  Future<void> setInt(String key, int value) async {
    await _prefs?.setInt(key, value);
  }

  Future<void> setBool(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }

  Future<void> setDouble(String key, double value) async {
    await _prefs?.setDouble(key, value);
  }

  Future<void> setStringList(String key, List<String> value) async {
    await _prefs?.setStringList(key, value);
  }

  /// Retrieve data methods
  String? getString(String key) => _prefs?.getString(key);
  int? getInt(String key) => _prefs?.getInt(key);
  bool? getBool(String key) => _prefs?.getBool(key);
  double? getDouble(String key) => _prefs?.getDouble(key);
  List<String>? getStringList(String key) => _prefs?.getStringList(key);

  /// Remove a specific key
  Future<void> remove(String key) async {
    await _prefs?.remove(key);
  }

  /// Clear all stored data
  Future<void> clear() async {
    await _prefs?.clear();
  }
}
