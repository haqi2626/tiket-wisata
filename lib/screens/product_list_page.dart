import 'package:flutter/material.dart';
import 'package:tiket_wisata/screens/order_detail_page.dart';
import 'package:tiket_wisata/models/product.dart'; // Import model Product

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Wisata")),
      body: ListView.builder(
        itemCount: dummyProducts.length,
        itemBuilder: (context, index) {
          final product = dummyProducts[index];

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Image.network(product.imageUrl, width: 50, height: 50),
              title: Text(product.name),
              subtitle: Text("Rp ${product.price}"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigasi ke halaman Order Detail
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderDetailPage(
                      orderData: {
                        'id': product.id.toString(),
                        'destination': product.name,
                        'date': '2025-03-10', // Contoh tanggal keberangkatan
                        'price': 'Rp ${product.price}',
                        'imageUrl': product.imageUrl,
                      },
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
