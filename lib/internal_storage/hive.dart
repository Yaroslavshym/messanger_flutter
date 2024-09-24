import 'dart:core';

// TODO: Move to data file
import 'package:hive/hive.dart';

class MyHive {
  Future<dynamic> getData(String key) async {
    var box = Hive.box('myBox');
    dynamic data = await box.get(key);
    await box.close();
    return data;
  }

  void addData(String key, dynamic value) async {
    var box = await Hive.openBox('myBox');
    await box.put(key, value);
    await box.close();
  }
}
