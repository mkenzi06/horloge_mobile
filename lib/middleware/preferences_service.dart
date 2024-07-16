import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  Future<void> savePreferences(
      {required bool is24HourFormat, required bool isDarkMode}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('is24HourFormat', is24HourFormat);
    prefs.setBool('isDarkMode', isDarkMode);
  }

  Future<Map<String, bool>> loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final is24HourFormat = prefs.getBool('is24HourFormat') ?? true;
    final isDarkMode = prefs.getBool('isDarkMode') ?? false;

    return {
      'is24HourFormat': is24HourFormat,
      'isDarkMode': isDarkMode,
    };
  }
}
