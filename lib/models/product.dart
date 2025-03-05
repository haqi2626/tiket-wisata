class Product {
  final int id;
  final String name;
  final int price;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}

// Dummy data untuk produk wisata
List<Product> dummyProducts = [
  Product(
      id: 1,
      name: "Tiket Pulau Komodo",
      price: 150000,
      imageUrl: "https://via.placeholder.com/150"),
  Product(
      id: 2,
      name: "Tiket Bromo Sunrise",
      price: 200000,
      imageUrl: "https://via.placeholder.com/150"),
  Product(
      id: 3,
      name: "Tiket Raja Ampat",
      price: 250000,
      imageUrl: "https://via.placeholder.com/150"),
];
