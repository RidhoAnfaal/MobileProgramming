const keyId = 'id';
const keyName = 'pizzaName';
const keyDescription = 'description';
const keyPrice = 'price';
const keyImage = 'imageUrl';

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
    final idValue = json[keyId];
    int id = int.tryParse(idValue?.toString() ?? '') ?? 0; 

    String pizzaName = (json[keyName] != null) 
        ? json[keyName].toString() 
        : 'No name'; 

    String description = json[keyDescription]?.toString() ?? '';

    String imageUrl = json[keyImage]?.toString() ?? '';

    final priceValue = json[keyPrice];
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
      keyId: id,
      keyName: pizzaName,
      keyDescription: description,
      keyPrice: price,
      keyImage: imageUrl,
    };
  }
}