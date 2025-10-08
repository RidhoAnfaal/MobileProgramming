class Item {
  // Pastikan field-nya dideklarasikan sebagai final
  final String name;
  final int price;

  // !!! INI BAGIAN YANG HARUS DITAMBAHKAN !!!
  // Dengan 'const' ini, Item() dapat dipanggil sebagai konstanta.
  const Item({required this.name, required this.price});
}
