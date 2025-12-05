// lib/pizza_detail.dart
import 'package:flutter/material.dart';
import 'package:store_data_ridho/model/pizza.dart'; 
import 'httphelper.dart';

class PizzaDetailScreen extends StatefulWidget {
  const PizzaDetailScreen({super.key});

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
  void dispose() {
    txtId.dispose();
    txtName.dispose();
    txtDescription.dispose();
    txtPrice.dispose();
    txtImageUrl.dispose();
    super.dispose();
  }

  Future<void> postPizza() async {
    HttpHelper helper = HttpHelper();
    
    final int? id = int.tryParse(txtId.text);
    final double? price = double.tryParse(txtPrice.text);
    
    if (id == null || price == null) {
      setState(() {
        operationResult = 'Error: ID and Price must be valid numbers.';
      });
      return;
    }
    
    Pizza pizza = Pizza(
      id: id, 
      pizzaName: txtName.text,
      description: txtDescription.text,
      price: price, 
      imageUrl: txtImageUrl.text,
    );

    String result = await helper.postPizza(pizza);
    
    setState(() {
      operationResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pizza Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                operationResult,
                style: TextStyle(
                    backgroundColor: Colors.green[200],
                    color: Colors.black),
              ),
              const SizedBox(height: 24),
              
              TextField(
                controller: txtId,
                decoration: const InputDecoration(hintText: 'Insert ID (Number)'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 24),
              
              TextField(
                controller: txtName,
                decoration: const InputDecoration(hintText: 'Insert Pizza Name'),
              ),
              const SizedBox(height: 24),
              
              TextField(
                controller: txtDescription,
                decoration: const InputDecoration(hintText: 'Insert Description'),
              ),
              const SizedBox(height: 24),
              
              TextField(
                controller: txtPrice,
                decoration: const InputDecoration(hintText: 'Insert Price (Number)'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 24),
              
              TextField(
                controller: txtImageUrl,
                decoration: const InputDecoration(hintText: 'Insert Image Url'),
              ),
              const SizedBox(height: 48),
              
              ElevatedButton(
                child: const Text('Send Post'),
                onPressed: postPizza,
              )
            ],
          ),
        ),
      ),
    );
  }
}