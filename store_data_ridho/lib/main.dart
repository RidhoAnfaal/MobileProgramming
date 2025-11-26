import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:store_data_ridho/model/pizza.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON DEMO Ridho',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Pizza> myPizzas = []; 

  @override
  void initState() {
    super.initState();
    readJsonFile().then((value) {
      setState(() {
        myPizzas = value;
      });
    });
  }

  String convertToJSON(List<Pizza> pizzas) {
    return jsonEncode(pizzas.map((pizza) => pizza.toJson()).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JSON Ridho')),
      body: myPizzas.isEmpty
          ? const Center(child: CircularProgressIndicator()) 
          : ListView.builder(
              itemCount: myPizzas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(myPizzas[index].pizzaName),
                  subtitle: Text(myPizzas[index].description),
                  trailing: Text('€${myPizzas[index].price.toString()}'), 
                );
              },
            ),
    );
  }

  Future<List<Pizza>> readJsonFile() async {
    String myString = 
        await DefaultAssetBundle.of(context).loadString('assets/pizzalist.json');
    List pizzaMapList = jsonDecode(myString);
    List<Pizza> tempPizzas = [];
    
    for (var pizza in pizzaMapList) {
      Pizza myPizza = Pizza.fromJson(pizza);
      tempPizzas.add(myPizza);
    }

    String json = convertToJSON(tempPizzas);
    print('JSON Result (Serialization):');
    print(json);
    
    return tempPizzas; 
  }
}