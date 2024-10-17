class DateTimeConversion {
  String dateTimeToString(DateTime date) {
    return date.toIso8601String();
  }

  DateTime stringToDateTime(String stringDate) {
    var ans = DateTime.parse(stringDate);
    return ans;
  }
}
