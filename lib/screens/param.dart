import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final bool isDarkMode;
  final bool is24HourFormat;
  final ValueChanged<bool> onDarkModeChanged;
  final ValueChanged<bool> on24HourFormatChanged;

  SettingsScreen({
    required this.isDarkMode,
    required this.is24HourFormat,
    required this.onDarkModeChanged,
    required this.on24HourFormatChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paramètres'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              title: Text('Mode sombre'),
              value: isDarkMode,
              onChanged: onDarkModeChanged,
            ),
            SwitchListTile(
              title: Text('Format 24 heures'),
              value: is24HourFormat,
              onChanged: on24HourFormatChanged,
            ),
          ],
        ),
      ),
    );
  }
}
