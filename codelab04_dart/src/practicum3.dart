void main(List<String> args) {
  var gifts = {
  // Key:    Value
  'first': 'partridge',
  'second': 'turtledoves',
  'fifth': 1
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 2,
  };

  print(gifts);
  print(nobleGases);

  var mhs1 = Map<String, String>();
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  var mhs2 = Map<int, String>();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';

  gifts['name'] = 'Ridho Anfaal';
  gifts['NIM'] = '2341720222';

  mhs1['name'] = 'Ridho Anfaal';
  mhs1['NIM'] = '2341720222';

  mhs2[1] = 'Ridho Anfaal';
  mhs2[2] = '2341720222';

  print("Gifts: $gifts");
  print("Noble Gases: $nobleGases");
  print("Mhs1: $mhs1");
  print("Mhs2: $mhs2");
}