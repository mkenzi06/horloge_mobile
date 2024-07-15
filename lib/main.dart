import 'package:flutter/material.dart';
import 'package:horloge_mobile/screens/accueil_screen.dart';
import 'package:horloge_mobile/screens/param.dart';
import 'package:horloge_mobile/screens/timeszones_screen.dart';
import 'package:horloge_mobile/widgets/nav_bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  bool _isDarkMode = false;
  bool _is24HourFormat = true;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
              },
              on24HourFormatChanged: (value) {
                setState(() {
                  _is24HourFormat = value;
                });
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
