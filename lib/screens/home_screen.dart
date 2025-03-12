import 'package:flutter/material.dart';
import 'package:tiket_wisata/screens/order_page.dart';
import 'package:tiket_wisata/screens/ticket_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gambar Latar
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'), // Gantilah dengan path gambar latar Anda
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Konten Utama
          SingleChildScrollView(
            child: Column(
              children: [
                // Banner Selamat Datang
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.lightBlueAccent, Colors.blue]),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    "Selamat Datang di Pemesanan Tiket!",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                // Item Navigasi
                GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  padding: const EdgeInsets.all(8),
                  children: [
                    NavItem(
                      title: "Orders",
                      icon: Icons.shopping_cart,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => OrderPage()));
                      },
                    ),
                    NavItem(
                      title: "Tikets",
                      icon: Icons.confirmation_number,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TicketPage()));
                      },
                    ),
                    NavItem(
                      title: "Profile",
                      icon: Icons.person,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DummyPage(title: "Halaman Profil")));
                      },
                    ),
                    // Tambahkan lebih banyak item jika diperlukan
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// NavItem sebagai widget reusable
class NavItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const NavItem({required this.title, required this.icon, required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.blueAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.white),
              const SizedBox(height: 10),
              Text(title, style: const TextStyle(color: Colors.white, fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}

// Halaman Dummy untuk menggambarkan Halaman Profil
class DummyPage extends StatelessWidget {
  final String title;
  const DummyPage({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(title)), body: Center(child: Text(title)));
  }
}