void main(List<String> args) {
  // var list1 = <int?>[1, 2, 3];
  // var list2 = [0, ...list1];
  // print(list1);
  // print(list2);
  // print(list2.length);

  // list1 = [1, 2, null];
  // print(list1);
  // var list3 = [0, ...list1];
  // print(list3.length);

  // var listNim = ['2341720222'];
  // var list4 = ['NIM: ', ...listNim, 'Name: ', "Ridho Anfa'al"];
  // print(listNim);
  // print(list4);
  // print(list4.length);

  // bool promoActive = true;
  // var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  // print(nav);

  // var login = 'Admin';
  // var nav2 = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];
  // print(nav2);

  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');
  print(listOfStrings);
}
