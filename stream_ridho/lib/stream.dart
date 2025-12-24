import 'package:flutter/material.dart';
import 'dart:async'; // Required for StreamController

class NumberStream {
  // Controller to manage the stream of integers
  final StreamController<int> controller = StreamController<int>();

  // Input: Push a successful number into the stream
  void addNumberToSink(int newNumber) {
    controller.sink.add(newNumber);
  }

  // Input: Push an error into the stream
  void addError() {
    controller.sink.addError('error');
  }

  // Cleanup: Close the stream to prevent memory leaks
  void close() {
    controller.close();
  }
}

class ColorStream {
  final List<Color> colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.teal,
    Colors.pink,
    Colors.indigo,
    Colors.lime,
    Colors.orange,
    Colors.cyan,
  ];

  // Async generator that yields colors every second
  Stream<Color> getColors() async* {
    yield* Stream.periodic(
      const Duration(seconds: 1), 
      (int t) {
        int index = t % colors.length;
        return colors[index];
      },
    );
  }
}