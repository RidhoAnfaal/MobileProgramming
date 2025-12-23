import 'package:flutter/material.dart';

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

  // Step 5: Defined as an async generator using async*
  Stream<Color> getColors() async* {
    // Step 6: Using yield* to delegate to a periodic stream
    yield* Stream.periodic(
      const Duration(seconds: 1), (int t) {
        int index = t % colors.length;
        return colors[index];
      },
    );
  }
}