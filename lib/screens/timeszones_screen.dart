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
    final String response =
        await rootBundle.loadString('assets/timezones.json');
    final data = await json.decode(response);
    setState(() {
      _timeZones = (data['time_zones'] as List)
          .map((json) => TimeZone.fromJson(json))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _timeZones.length,
      itemBuilder: (context, index) {
        final timeZone = _timeZones[index];
        return ListTile(
          title: Text('${timeZone.mainCity} (${timeZone.code})'),
          subtitle: Text('Offset: ${timeZone.offset}'),
          onTap: () {
            final DateTime now =
                DateTime.now().toUtc().add(_parseOffset(timeZone.offset));
            final String formattedDateTime = DateFormat('HH:mm:ss').format(now);
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
    );
  }

  Duration _parseOffset(String offset) {
    final parts = offset.split(':');
    final hours = int.parse(parts[0].substring(3));
    final minutes = int.parse(parts[1]);
    return Duration(hours: hours, minutes: minutes);
  }
}
