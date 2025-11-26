class Pizza {
  late final int id;
  late final String pizzaName;
  late final String description;
  late final double price;
  late final String imageUrl;

  Pizza.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pizzaName = json['pizzaName'];
    description = json['description'];
    price = json['price'];
    imageUrl = json['imageUrl'];
  }
}
