import 'package:flutter/material.dart';
import 'stream.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
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
  // Step 5: Declare the stream variable
  late Stream<int> numberStream;

  // Step 6: Initialize the stream
  @override
  void initState() {
    super.initState();
    numberStream = NumberStream().getNumbers();
  }

  // Step 7: Build the UI using StreamBuilder
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream - Ridho'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: numberStream,
          initialData: 0,
          builder: (context, snapshot) {
            // Check for errors in the stream
            if (snapshot.hasError) {
              return const Text('Error!');
            }
            
            // Check the connection state and handle data
            if (snapshot.hasData) {
              return Text(
                snapshot.data.toString(),
                style: const TextStyle(fontSize: 96),
              );
            } else {
              // Shown if there is no data and no error
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}