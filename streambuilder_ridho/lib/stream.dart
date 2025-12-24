import 'dart:math';

class NumberStream {
  // Step 2 & 3: Creating an asynchronous generator stream
  Stream<int> getNumbers() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (int t) {
      Random random = Random();
      int myNum = random.nextInt(10);
      return myNum;
    });
  }
}