import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:intl/intl.dart';

class OrderDetailPage extends StatelessWidget {
  final Map<String, dynamic> orderData;

  const OrderDetailPage({super.key, required this.orderData});

  String formatCurrency(int amount) {
    final format = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return format.format(amount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Order Detail")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order ID: ${orderData['id'] ?? 'N/A'}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text("Destination: ${orderData['destination'] ?? 'Unknown'}"),
            Text("Date: ${orderData['date'] ?? 'Unknown'}"),
            Text("Price: ${formatCurrency(orderData['price'] ?? 0)}"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showPaymentDialog(context),
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
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text("QRIS"),
              onTap: () {
                Navigator.pop(context);
                _showQrisDialog(context);
              },
            ),
            ListTile(
              title: const Text("Cash"),
              onTap: () {
                Navigator.pop(context);
                _showCashDialog(context);
              },
            ),
            ListTile(
              title: const Text("Transfer"),
              onTap: () {
                Navigator.pop(context);
                _showTransferDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

void _showQrisDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("QRIS Payment"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Scan the QR code to complete the payment."),
          const SizedBox(height: 16),
          Image.asset(
            'assets/logo/qrcode.jpg', // Path gambar QR Code Anda
            width: 200,
            height: 200,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            _showSuccessDialog(context, "QRIS Payment Success!");
          },
          child: const Text("Complete"),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
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
            onPressed: () {
              Navigator.pop(context);
              _showSuccessDialog(context, "Cash Payment Success!");
            },
            child: const Text("Done"),
          ),
        ],
      ),
    );
  }

  void _showTransferDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Transfer Payment"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text("Transfer to Bank ABC: 1234567890"),
            SizedBox(height: 10),
            Text("After transfer, please confirm with the admin."),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _showSuccessDialog(context, "Transfer Payment Success!");
            },
            child: const Text("Done"),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Payment Success"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
