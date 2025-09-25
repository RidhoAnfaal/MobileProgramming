// void main(List<String> args) {
//   greet(name: "Ridho");
//   greet(name: "Anfa'al", message: "Hello");
// }

// void greet({required String name, String message = "Hi"}) {
//   print("$message, $name!");
// }

// void greet(String name, [String? message]) {
//   print("Hello, $name! ${message ?? ''}");
// }

// void greet(String name) {
//   print("Hello, $name!");
// }

// int add(int a, int b) {
//   return a + b;
// }

// void main(List<String> args) {
//   // 1. Assign the function to a variable
//   var operation = add;
//   print(operation(2, 3));

//   // 2. Pass the function as an argument
//   void calculate(int x, int y, Function op) {
//     print(op(x, y));
//   }
//   calculate(5, 5, add);

//   // 3. Return a function from another function
//   Function getOperation() {
//     return add;
//   }
//   var myFunc = getOperation();
//   print(myFunc(10, 20));

//   // 4. Store a function in a list
//   var functions = [add];
//   print(functions[0](4, 5));
// }


// void main(List<String> args) {
//   var numbers = [1, 2, 3];

//   // an anonymous function with forEach to print each number
//   numbers.forEach((number) {
//     print(number);
//   });

//   // using an anonymous function with map to create a new list of squared numbers
//   var squaredNumbers = numbers.map((number) => number * number).toList();
//   print(squaredNumbers); 
// }


// String greeting = 'Hello'; // the outer scope

// void sayHi() {
//   String name = 'Ridho'; // 'name' is in the sayHi scope
//   print('$greeting, $name!'); // 'greeting' is accessible here due to lexical scope
//   // print(name); would cause an error because 'name' is not in this scope
// }

// void main(List<String> args) {
//   sayHi();
// }


// Function makeAdder(int addBy) {
//   // addBy is the variable that the closure will "remember"
//   return (int number) => number + addBy;
// }

// void main(List<String> args) {
//   var addTwo = makeAdder(2); // addTwo is a closure that remembers addBy = 2
//   var addFive = makeAdder(5); // addFive is a closure that remembers addBy = 5

//   print(addTwo(10)); 
//   print(addFive(10)); 
// }


(String, int) getStudent() {
  return ('Ridho Anfaal', 2341720222);
}

void main() {
  var (name, nim) = getStudent();
  print("Name: $name, NIM: $nim");
}
