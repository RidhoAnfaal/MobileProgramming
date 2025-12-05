import 'package:flutter/material.dart';
import 'package:store_data_ridho/model/pizza.dart';
import 'httphelper.dart';

class PizzaDetailScreen extends StatefulWidget {
  final Pizza pizza;
  final bool isNew;

  const PizzaDetailScreen({super.key, required this.pizza, required this.isNew});

  @override
  State<PizzaDetailScreen> createState() => _PizzaDetailScreenState();
}

class _PizzaDetailScreenState extends State<PizzaDetailScreen> {
  final TextEditingController txtId = TextEditingController();
  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtPrice = TextEditingController();
  final TextEditingController txtImageUrl = TextEditingController();
  String operationResult = '';

  @override
  void initState() {
    if (!widget.isNew) {
      txtId.text = widget.pizza.id.toString();
      txtName.text = widget.pizza.pizzaName;
      txtDescription.text = widget.pizza.description;
      txtPrice.text = widget.pizza.price.toString();
      txtImageUrl.text = widget.pizza.imageUrl;
    }
    super.initState();
  }

  Future<String> savePizza() async {
    HttpHelper helper = HttpHelper();
    final int? id = int.tryParse(txtId.text);
    final double? price = double.tryParse(txtPrice.text);

    if (id == null || price == null) {
      return 'ID and Price must be numbers';
    }

    Pizza pizza = Pizza(
      id: id,
      pizzaName: txtName.text,
      description: txtDescription.text,
      price: price,
      imageUrl: txtImageUrl.text,
    );

    if (widget.isNew) {
      return await helper.postPizza(pizza);
    } else {
      return await helper.putPizza(pizza);
    }
  }

  void executeSave() async {
    String result = await savePizza();
    setState(() {
      operationResult = result;
    });
  }

  Future executePutOnly() async {
    HttpHelper helper = HttpHelper();

    final int? id = int.tryParse(txtId.text);
    final double? price = double.tryParse(txtPrice.text);

    Pizza pizza = Pizza(
      id: id ?? 0,
      pizzaName: txtName.text,
      description: txtDescription.text,
      price: price ?? 0,
      imageUrl: txtImageUrl.text,
    );

    final result = await helper.putPizza(pizza);

    setState(() {
      operationResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pizza Detail')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(operationResult, style: TextStyle(backgroundColor: Colors.green[200], color: Colors.black)),
              const SizedBox(height: 24),
              TextField(controller: txtId, decoration: const InputDecoration(hintText: 'Insert ID (Number)'), keyboardType: TextInputType.number),
              const SizedBox(height: 24),
              TextField(controller: txtName, decoration: const InputDecoration(hintText: 'Insert Pizza Name')),
              const SizedBox(height: 24),
              TextField(controller: txtDescription, decoration: const InputDecoration(hintText: 'Insert Description')),
              const SizedBox(height: 24),
              TextField(controller: txtPrice, decoration: const InputDecoration(hintText: 'Insert Price (Number)'), keyboardType: TextInputType.number),
              const SizedBox(height: 24),
              TextField(controller: txtImageUrl, decoration: const InputDecoration(hintText: 'Insert Image Url')),
              const SizedBox(height: 48),

              ElevatedButton(
                onPressed: executeSave,
                child: Text(widget.isNew ? 'Send Post' : 'Send Put'),
              ),

              if (!widget.isNew)
                ElevatedButton(
                  onPressed: executeSave,
                  child: const Text('Send Put'),
                ),

              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: executePutOnly,
                child: const Text('PUT'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
