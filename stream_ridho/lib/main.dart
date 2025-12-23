import 'package:flutter/material.dart';
import 'stream.dart'; // Step 7: Import stream.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream - Ridho', // Question 1: Identity Branding
      theme: ThemeData(
        primarySwatch: Colors.deepPurple, // Question 1: Custom Theme
      ),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  // Step 8: Add variables
  Color bgColor = Colors.blueGrey;
  late ColorStream colorStream;

  // Step 13: New implementation of changeColor using await for
  void changeColor() async {
    await for (var eventColor in colorStream.getColors()) {
      setState(() {
        bgColor = eventColor;
      });
    }
  }

  // Step 10: Initialize colorStream and call changeColor
  @override
  void initState() {
    super.initState();
    colorStream = ColorStream();
    changeColor();
  }

  // Step 11: Scaffold implementation
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream - Ridho'),
      ),
      body: Container(
        decoration: BoxDecoration(color: bgColor),
      ),
    );
  }
}