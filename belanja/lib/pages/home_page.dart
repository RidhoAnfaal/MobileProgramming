import 'package:flutter/material.dart';
// Ganti 'models/item.dart' menjadi '../models/item.dart'
// asumsi Item berada di lib/models/item.dart
import '../models/item.dart';

class HomePage extends StatelessWidget {
  // Sekarang constructor HomePage bisa const
  const HomePage({super.key});

  // Langkah 5: Definisikan data awal (Mock Data)
  final List<Item> items = const [
    // Panggil constructor Item dengan const
    const Item(name: 'Sugar', price: 5000), 
    const Item(name: 'Salt', price: 2000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return Card(
              margin: const EdgeInsets.only(top: 8),
              child: InkWell( 
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/item',
                    arguments: item, // Mengirim objek Item
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.name,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          item.price.toString(),
                          textAlign: TextAlign.end,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}