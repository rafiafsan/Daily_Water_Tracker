import 'package:flutter/material.dart';
import 'package:water_tracker/water_tracker_appfile.dart';

class myApp extends StatelessWidget {
  const myApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.green,
          centerTitle: true,
        ),scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme:ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurpleAccent,
            foregroundColor: Colors.white,
          )
        )

      ),
      title: "First App",
      home: watertracker() ,
    );
  }
}