class Pizza {
  final int id;
  final String pizzaName;
  final String description;
  final double price;
  final String imageUrl;

  Pizza({
    required this.id,
    required this.pizzaName,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  factory Pizza.fromJson(Map<String, dynamic> json) {
    final idValue = json['id'];
    int id = int.tryParse(idValue?.toString() ?? '') ?? 0; 

    String pizzaName = (json['pizzaName'] != null) 
        ? json['pizzaName'].toString() 
        : 'No name'; 

    String description = json['description']?.toString() ?? '';
    String imageUrl = json['imageUrl']?.toString() ?? '';

    final priceValue = json['price'];
    double price = double.tryParse(priceValue?.toString() ?? '') ?? 0.0;
    
    return Pizza(
      id: id,
      pizzaName: pizzaName,
      description: description,
      price: price,
      imageUrl: imageUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pizzaName': pizzaName,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    };
  }
}