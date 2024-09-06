import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/Pages/home_page.dart';

void main() async{
   await Hive.initFlutter();

  var box = await Hive.openBox('my box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
    Widget build(BuildContext context) {
    return  MaterialApp(
debugShowCheckedModeBanner:false,
      home:const HomePage(),
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.white70)),
    );
    }
  }