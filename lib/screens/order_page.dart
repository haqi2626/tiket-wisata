import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import library intl
import 'package:tiket_wisata/models/product.dart'; // Import model product
import 'package:tiket_wisata/screens/order_detail_page.dart'; // Import halaman Order Detail Page

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Gunakan NumberFormat untuk format harga Indonesia (IDR)
    final currencyFormatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);

    return Scaffold(
      appBar: AppBar(title: const Text("Order Page")),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: dummyProducts.length,
        itemBuilder: (context, index) {
          final product = dummyProducts[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(product.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
              ),
              title: Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(
                currencyFormatter.format(product.price), // Format harga jadi lebih rapi
                style: const TextStyle(color: Colors.green),
              ),
              onTap: () {
                // Navigasi ke halaman detail pesanan saat item diklik
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderDetailPage(
                      orderData: {
                        'id': product.id.toString(),
                        'destination': product.name,
                        'date': '2025-03-10', // Contoh tanggal
                        'price': currencyFormatter.format(product.price),
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
