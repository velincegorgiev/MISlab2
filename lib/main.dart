import 'package:flutter/material.dart';
import 'package:mis_lab2/screens/home.dart';
import 'package:mis_lab2/screens/details.dart';
import 'package:mis_lab2/screens/random_joke.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokes App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const Home(),
        "/details": (context) => const Details(),
        "/random-joke": (context) => const RandomJokeScreen()
      },
    );
  }
}