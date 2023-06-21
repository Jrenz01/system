import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:system/home.dart';
import 'package:system/score_provider.dart'; // Import the ScoreProvider class

void main() {
  runApp(
    ChangeNotifierProvider<ScoreProvider>(
      create: (_) => ScoreProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
