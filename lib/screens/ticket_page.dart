import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Untuk format harga
import 'package:tiket_wisata/models/ticket.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  // Format mata uang IDR
  final currencyFormatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);

  // Fungsi untuk menghapus tiket
  void _deleteTicket(int id) {
    setState(() {
      dummyTickets.removeWhere((ticket) => ticket.id == id);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Tiket berhasil dihapus')),
    );
  }

  // Dialog konfirmasi hapus
  void _showDeleteDialog(BuildContext context, int id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus Tiket'),
        content: const Text('Apakah Anda yakin ingin menghapus tiket ini?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _deleteTicket(id);
            },
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tiket Saya'),
      ),
      body: ListView.builder(
        itemCount: dummyTickets.length,
        itemBuilder: (context, index) {
          final ticket = dummyTickets[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(ticket.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(
                '${ticket.date} • ${currencyFormatter.format(ticket.price)}',
                style: const TextStyle(color: Colors.green),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => _showDeleteDialog(context, ticket.id),
              ),
            ),
          );
        },
      ),
    );
  }
}
