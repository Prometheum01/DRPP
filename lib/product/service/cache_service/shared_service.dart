import 'package:shared_preferences/shared_preferences.dart';

class SharedManager {
  final SharedPreferences sharedPreferences;

  SharedManager({required this.sharedPreferences});

  setBoolData(String key, bool value) async {
    await sharedPreferences.setBool(key, value);
  }

  bool getBoolData(String key) {
    return sharedPreferences.getBool(key) ?? false;
  }
}
