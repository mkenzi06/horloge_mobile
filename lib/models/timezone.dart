class TimeZone {
  final String offset;
  final String mainCity;
  final String code;

  TimeZone({required this.offset, required this.mainCity, required this.code});

  factory TimeZone.fromJson(Map<String, dynamic> json) {
    return TimeZone(
      offset: json['offset'],
      mainCity: json['main_city'],
      code: json['code'],
    );
  }
}
