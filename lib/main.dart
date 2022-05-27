import 'package:flutter/material.dart';
import 'package:task/core/routes/routes.dart';
import 'package:task/service/hive_service.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  await Hive.initFlutter();
  HiveService.initHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Novalab task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/home',
      onGenerateRoute: RouterGenerator.instance.generateRoute,
    );
  }
}
