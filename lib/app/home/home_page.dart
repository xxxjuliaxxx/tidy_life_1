import 'dart:ui';
import 'package:tidy_life_1/app/login/login_page.dart';
import 'package:flutter/material.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isPressed = true;

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
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const SecondPage(title: ''),
              ),
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
                  color: Colors.white.withOpacity(isPressed ? 0.5 : 0.3),
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