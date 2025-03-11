class Ticket {
  final int id;
  final String name;
  final int price;
  final String imageUrl;
  final String date;

  Ticket({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.date,
  });
}

// Dummy data tiket (berasal dari produk)
List<Ticket> dummyTickets = [
  Ticket(
    id: 1,
    name: "Tiket Pulau Komodo",
    price: 150000,
    imageUrl: "https://picsum.photos/200/300?grayscale",
    date: "2025-03-10",
  ),
  Ticket(
    id: 2,
    name: "Tiket Bromo Sunrise",
    price: 200000,
    imageUrl: "https://picsum.photos/id/237/200/300",
    date: "2025-03-12",
  ),
  Ticket(
    id: 3,
    name: "Tiket Raja Ampat",
    price: 250000,
    imageUrl: "https://picsum.photos/seed/picsum/200/300",
    date: "2025-03-15",
  ),
];
