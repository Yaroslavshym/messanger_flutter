class DateTimeConversion {
  String dateTimeToString(DateTime date) {
    return date.toIso8601String();
  }

  DateTime stringToDateTime(String stringDate) {
    return DateTime.parse(stringDate);
  }
}
