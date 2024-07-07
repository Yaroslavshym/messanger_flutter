import 'dart:convert';
import 'dart:core';

import 'package:hive/hive.dart';

class MyHive {
  Future<dynamic> getData(String key) async {
    var box = await Hive.openBox('myBox');
    dynamic data = await box.get(key);
    if (data.runtimeType == String) {
      try {
        data = jsonDecode(data);
      } catch (e) {}
    }
    await box.close();
    return data;
  }

  void addData(String key, dynamic value) async {
    if (!([int, String, Map, List, double, bool].contains(value.runtimeType))) {
      value = value.toString();
    }
    var box = await Hive.openBox('myBox');
    await box.put(key, value);
    await box.close();
  }
}