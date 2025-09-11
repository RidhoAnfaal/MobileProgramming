void main() {
  // for (var i = 20; i >= 1; i--) {
  //   print('My name is Ridho $i');
  // }

  // Null safety
  String? nama; // can be null
  // print(nama); // if we run this it doesn't error, the output is null
  print(nama ?? "Ridho");

  // Late variable
  late String name;
  // print(name); // error because we haven't assigned a value yet
  name = "Anfaal"; // must assign before using
  print(name);
}
