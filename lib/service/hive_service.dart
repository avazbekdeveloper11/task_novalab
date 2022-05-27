import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveService {
  static Box? factBox;
  static Future<void> initHive() async {
    Directory dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    factBox = await Hive.openBox("contracts");
    debugPrint("Opened Box");
  }

  static Future<void> putToBox(List data) async {
    factBox!.add(data);
  }
}
