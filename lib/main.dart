import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://i.pinimg.com/474x/0d/4f/0a/0d4f0aac21e900a8f562c78d3c4f0144.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: GestureDetector(
          onTapDown: (_) {
            setState(
              () => (isPressed = true),
            );
          },
          onTapUp: (_) {
            setState(
              () => (isPressed = false),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: AnimatedContainer(
                duration: const Duration(microseconds: 200),
                height: 150,
                width: 250,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 25,
                      spreadRadius: -5,
                    ),
                  ],
                  color: Colors.white.withOpacity(isPressed ? 0.4 : 0.3),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white60, Colors.white10],
                  ),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(width: 2, color: Colors.white30),
                ),
                child: const Center(
                  child: Text(
                    'Tidy Life',
                    style: TextStyle(
                        fontSize: 35,
                        fontStyle: FontStyle.normal,
                        color: Colors.white54),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
