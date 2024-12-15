import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mis_lab2/models/joke_type_model.dart';
import 'package:mis_lab2/widgets/jokeType//joke_type_grid.dart';
import 'package:mis_lab2/services/api_service.dart';
import 'package:mis_lab2/screens/random_joke.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<JokeType> jokeTypes = [];

  @override
  void initState() {
    super.initState();
    getJokeTypeFromAPI();
  }

  void getJokeTypeFromAPI() async {
    ApiService.getJokeTypes().then((response) {
      var data = List.from(json.decode(response.body));
      setState(() {
        jokeTypes = data.map<JokeType>((element) {

          return JokeType(type: element);
        }).toList();
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFB85042),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu, color: Colors.white, size: 24)),
        title: const Text("Jokes App", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const RandomJokeScreen()));}, icon: const Icon(Icons.lightbulb_outline, color: Colors.white, size: 24))],
      ),
      body: JokeTypeGrid(jokeTypes: jokeTypes),
      backgroundColor: Color(0xFFA7BEAE),
    );
  }
}