import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/timezone.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl.dart';

class TimezonesScreen extends StatefulWidget {
  @override
  _TimezonesScreenState createState() => _TimezonesScreenState();
}

class _TimezonesScreenState extends State<TimezonesScreen> {
  List<TimeZone> _timeZones = [];

  @override
  void initState() {
    super.initState();
    _loadTimeZones();
  }

  Future<void> _loadTimeZones() async {
    final String response = await rootBundle.loadString("assets/timezone.json");
    final data = json.decode(response);
    setState(() {
      _timeZones = (data['time_zone'] as List)
          .map((json) => TimeZone.fromJson(json))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fuseaux Horaires'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _timeZones.length,
              itemBuilder: (context, index) {
                final timeZone = _timeZones[index];
                return ListTile(
                  title: Text('${timeZone.mainCity} (${timeZone.code})'),
                  subtitle: Text('Offset: ${timeZone.offset}'),
                  onTap: () {
                    final DateTime now = DateTime.now()
                        .toUtc()
                        .add(_parseOffset(timeZone.offset));
                    final String formattedDateTime =
                        DateFormat('HH:mm:ss').format(now);
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('${timeZone.mainCity} (${timeZone.code})'),
                        content: Text('Current time: $formattedDateTime'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Duration _parseOffset(String offset) {
    final sign = offset.startsWith('-') ? -1 : 1;
    final parts = offset.substring(4).split(':');
    final hours = int.parse(parts[0]) * sign;
    final minutes = int.parse(parts[1]) * sign;
    return Duration(hours: hours, minutes: minutes);
  }
}
