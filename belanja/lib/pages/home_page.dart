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
      // Langkah 6: Membuat ListView.builder
      body: Container(
        margin: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return Card(
              margin: const EdgeInsets.only(top: 8),
              child: InkWell( // Pindahkan InkWell ke sini, langsung membungkus Card content
                onTap: () {
                  // Aksi saat item diklik: Navigasi dan kirim data!
                  Navigator.pushNamed(
                    context,
                    '/item',
                    arguments: item, // Mengirim objek Item
                  );
                },
                child: Container(
                  // Tambahkan padding di sini agar area klik nyaman
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      // Item Name (Expanded agar mengambil sisa ruang kiri)
                      Expanded(
                        child: Text(
                          item.name,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      // Item Price (Expanded agar sejajar rapi di kanan)
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
