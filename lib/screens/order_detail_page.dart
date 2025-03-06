import 'package:flutter/material.dart';

class OrderDetailPage extends StatelessWidget {
  final Map<String, dynamic> orderData; // Data yang diterima dari halaman sebelumnya

  const OrderDetailPage({super.key, required this.orderData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Order Detail")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Order ID: ${orderData['id']}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text("Destination: ${orderData['destination']}"),
            Text("Date: ${orderData['date']}"),
            Text("Price: ${orderData['price']}"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showPaymentDialog(context), // Tombol untuk membuka metode pembayaran
              child: const Text("Pay Now"),
            ),
          ],
        ),
      ),
    );
  }

  void _showPaymentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Select Payment Method"),
        actions: [
          TextButton(
            onPressed: () => _showQrisDialog(context),
            child: const Text("QRIS"),
          ),
          TextButton(
            onPressed: () => _showCashDialog(context),
            child: const Text("Cash"),
          ),
        ],
      ),
    );
  }

  void _showQrisDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("QRIS Payment"),
        content: const Text("Scan the QR code to complete the payment."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  void _showCashDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Cash Payment"),
        content: const Text("Please pay at the counter."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }
}
