import 'package:flutter/material.dart';
import 'package:horloge_mobile/middleware/preferences_service.dart';
import 'package:horloge_mobile/screens/accueil_screen.dart';
import 'package:horloge_mobile/screens/param.dart';
import 'package:horloge_mobile/screens/timeszones_screen.dart';
import 'package:horloge_mobile/widgets/nav_bottom_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferencesService = PreferencesService();
  final preferences = await preferencesService.loadPreferences();

  runApp(MyApp(
    is24HourFormat: preferences['is24HourFormat']!,
    isDarkMode: preferences['isDarkMode']!,
  ));
}

class MyApp extends StatefulWidget {
  final bool is24HourFormat;
  final bool isDarkMode;

  MyApp({required this.is24HourFormat, required this.isDarkMode});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  late bool _isDarkMode;
  late bool _is24HourFormat;

  final PreferencesService _preferencesService = PreferencesService();

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.isDarkMode;
    _is24HourFormat = widget.is24HourFormat;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _updatePreferences() async {
    await _preferencesService.savePreferences(
      is24HourFormat: _is24HourFormat,
      isDarkMode: _isDarkMode,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            HomeScreen(is24HourFormat: _is24HourFormat),
            TimezonesScreen(),
            SettingsScreen(
              isDarkMode: _isDarkMode,
              is24HourFormat: _is24HourFormat,
              onDarkModeChanged: (value) {
                setState(() {
                  _isDarkMode = value;
                });
                _updatePreferences();
              },
              on24HourFormatChanged: (value) {
                setState(() {
                  _is24HourFormat = value;
                });
                _updatePreferences();
              },
            ),
          ],
        ),
        bottomNavigationBar: BottomNavBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
