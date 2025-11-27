import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; 
import 'package:path_provider/path_provider.dart'; 
import 'dart:io'; 
import 'package:store_data_ridho/model/pizza.dart'; 
import 'package:flutter_secure_storage/flutter_secure_storage.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Ridho',
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

  final pwdController = TextEditingController(); 
  String myPass = ''; 

  final storage = const FlutterSecureStorage(); 
  final myKey = 'myPass'; 

  @override
  void initState() {
    super.initState();
    _loadAllData();
  }
  
  Future<void> _loadAllData() async {
    readJsonFile().then((value) {
      setState(() { myPizzas = value; });
    });

    await readAndWritePreference(); 

    await getPaths(); 

    myFile = File('$documentsPath/praktikum6.txt'); 
    await writeFile(); 
  }

  Future<void> writeToSecureStorage() async {
    await storage.write(key: myKey, value: pwdController.text);
    pwdController.clear();
    setState(() {
      myPass = 'Value saved securely!';
    });
  }

  Future<void> readFromSecureStorage() async {
    String? secret = await storage.read(key: myKey);
    
    setState(() {
      myPass = secret ?? 'No value found';
    });
  }


  Future<List<Pizza>> readJsonFile() async {
      String myString = await DefaultAssetBundle.of(context).loadString('assets/pizzalist.json');
      List pizzaMapList = jsonDecode(myString);
      List<Pizza> tempPizzas = [];
      for (var pizza in pizzaMapList) {
          Pizza myPizza = Pizza.fromJson(pizza); 
          tempPizzas.add(myPizza);
      }
      pizzaString = jsonEncode(tempPizzas.map((pizza) => pizza.toJson()).toList());
      return tempPizzas;
  }

  Future<void> readAndWritePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance(); 
    appCounter = prefs.getInt('appCounter') ?? 0; 
    appCounter++; 
    await prefs.setInt('appCounter', appCounter); 
    setState(() { appCounter = appCounter; }); 
  }

  Future<void> deletePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); 
    setState(() { appCounter = 0; }); 
  }

  Future<void> getPaths() async {
    final docDir = await getApplicationDocumentsDirectory(); 
    final tempDir = await getTemporaryDirectory(); 
    setState(() {
      documentsPath = docDir.path; 
      tempPath = tempDir.path; 
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ridho')),
      
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Path Provider', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 10),
            TextField( 
              controller: pwdController,
              decoration: const InputDecoration(
                labelText: 'Enter sensitive data',
                border: OutlineInputBorder(),
              ),
            ),
            
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: const Text('Save Value'),
                  onPressed: writeToSecureStorage, 
                ),
                ElevatedButton(
                  child: const Text('Read Value'), 
                  onPressed: readFromSecureStorage,
                ),
              ],
            ),
            
            const SizedBox(height: 10),
            Text('Saved Data: $myPass', style: const TextStyle(fontWeight: FontWeight.bold)), 
            
            const Divider(height: 30),

            const Text('File System', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text('Doc path: $documentsPath'), 
            Text('Temp path: $tempPath'), 
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: readFile, 
              child: const Text('Read File'), 
            ),
            Text('File Content: $fileText'), 
            
            const Divider(height: 30),

            const Text('JSON', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text('You have opened the app $appCounter times.'), 
            ElevatedButton(
              onPressed: deletePreference,
              child: const Text('Reset counter'), 
            ),
            
            const SizedBox(height: 20),
            ...myPizzas.map((pizza) => ListTile(
              title: Text(pizza.pizzaName),
              subtitle: Text(pizza.description),
              trailing: Text('€${pizza.price.toString()}'),
            )).toList(),
          ],
        ),
      ),
    );
  }
}