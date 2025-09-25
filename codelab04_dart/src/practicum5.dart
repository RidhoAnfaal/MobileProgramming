void main(List<String> args) {
  var record = ('first', a: 2, b: true, 'last');
  print(record);

  var number = (1, 2);
  print('Before swap: $number');

  var swapped = tukar(number);
  print('After swap: $swapped');

  // Record type annotation in a variable declaration:
  (String, int) mahasiswa = ("Ridho Anfa'al", 2341720222);
  print(mahasiswa);

  var mahasiswa2 = ("Ridho Anfa'al / 2341720222", a: 2, b: true, 'last');

  print(mahasiswa2.$1); // Prints 'first'
  print(mahasiswa2.a); // Prints 2
  print(mahasiswa2.b); // Prints true
  print(mahasiswa2.$2); // Prints 'last'
}

(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}