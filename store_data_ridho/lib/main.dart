import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart'; 
import 'dart:io'; 
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
  int appCounter = 0; 
  String pizzaString = ''; 
  String documentsPath = ''; 
  String tempPath = ''; 

  late File myFile; 
  String fileText = ''; 

  @override
  void initState() {
    super.initState();
    
    _loadAllData();
  }

  Future<void> _loadAllData() async {
    readJsonFile().then((value) {
      setState(() {
        myPizzas = value;
      });
    });

    await readAndWritePreference(); 
    
    await getPaths(); 

    myFile = File('$documentsPath/praktikum6.txt'); 
    await writeFile(); 
  }

  Future<bool> writeFile() async {
    String content = "Ridho Anfa'al-2341720222";
    try {
      await myFile.writeAsString(content); 
      return true;
    } catch (e) {
      print('Error writing file: $e');
      return false;
    }
  }

  Future<void> readFile() async {
    try {
      String fileContent = await myFile.readAsString(); 
      setState(() {
        fileText = fileContent; 
      });
    } catch (e) {
      setState(() {
        fileText = 'Error reading file: $e';
      });
    }
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
    
    pizzaString = convertToJSON(tempPizzas);
    return tempPizzas; 
  }

  String convertToJSON(List<Pizza> pizzas) {
    return jsonEncode(pizzas.map((pizza) => pizza.toJson()).toList()); 
  }

  Future<void> readAndWritePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    appCounter = prefs.getInt('appCounter') ?? 0;
    appCounter++; 
    await prefs.setInt('appCounter', appCounter); 

    setState(() {
      appCounter = appCounter;
    });
  }

  Future<void> deletePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); 
    setState(() {
      appCounter = 0; 
    });
  }

  Future<void> getPaths() async {
    final docDir = await getApplicationDocumentsDirectory(); 
    final tempDir = await getTemporaryDirectory(); 
    
    setState(() {
      documentsPath = docDir.path; 
      tempPath = tempDir.path; 
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Path & File Access Ridho')),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('File System Paths:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Doc path: $documentsPath'), 
                  Text('Temp path: $tempPath'), 
                ],
              ),
            ),
            
            ElevatedButton(
              onPressed: readFile, 
              child: const Text('Read File'), 
            ),
            Text(fileText), 

            Text('You have opened the app $appCounter times.'), 

            myPizzas.isEmpty
                ? const CircularProgressIndicator()
                : Expanded(
                    child: ListView.builder(
                      itemCount: myPizzas.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(myPizzas[index].pizzaName),
                          subtitle: Text(myPizzas[index].description),
                          trailing: Text('€${myPizzas[index].price.toString()}'),
                        );
                      },
                    ),
                  ),

            ElevatedButton(
              onPressed: deletePreference,
              child: const Text('Reset counter'),
            ),
          ],
        ),
      ),
    );
  }
}