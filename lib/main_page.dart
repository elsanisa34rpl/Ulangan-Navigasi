
import 'package:flutter/material.dart';
import 'user_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 1;

  final List<String> judul = [
    'Tech Express - Store',
    'Tech Express - Katalog',
    'Tech Express - User',
    'Tech Express - Profile',
  ];

  // Data gadget
  final List<Map<String, dynamic>> gadgets = [
    {
      'nama': 'Samsung Galaxy A55',
      'harga': 5000000,
      'icon': Icons.phone_android,
    },
    {
      'nama': 'iPhone 13',
      'harga': 7500000,
      'icon': Icons.phone_iphone,
    },
    {
      'nama': 'Xiaomi Redmi Note 13',
      'harga': 2800000,
      'icon': Icons.smartphone,
    },
    {
      'nama': 'iPad Air',
      'harga': 8500000,
      'icon': Icons.tablet_mac,
    },
    {
      'nama': 'ASUS VivoBook',
      'harga': 9000000,
      'icon': Icons.laptop,
    },
    {
      'nama': 'Samsung Galaxy Watch',
      'harga': 2500000,
      'icon': Icons.watch,
    },
  ];

  String formatHarga(int harga) {
    String angka = harga.toString();
    String hasil = '';

    for (int i = 0; i < angka.length; i++) {
      hasil += angka[i];

      int sisa = angka.length - i - 1;

      if (sisa > 0 && sisa % 3 == 0) {
        hasil += '.';
      }
    }

    return 'Rp$hasil';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(judul[selectedIndex]),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: selectedIndex == 0
          ? katalog()
          : selectedIndex == 1
              ? katalog()
              : selectedIndex == 2
                  ? const UserPage()
                  : profileContent(),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Katalog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Menampilkan semua gadget
  Widget katalog() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Katalog Gadget',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        const Text('Pilih gadget yang kamu inginkan.'),
        const SizedBox(height: 15),

        // Membuat card dari data gadget
        ...gadgets.map((gadget) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/detail',
                arguments: {
                  'nama': gadget['nama'],
                  'harga': gadget['harga'],
                },
              );
            },
            child: Card(
              elevation: 3,
              margin: const EdgeInsets.only(bottom: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        gadget['icon'],
                        size: 45,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(width: 15),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            gadget['nama'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            formatHarga(gadget['harga']),
                            style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Lihat detail →',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  // Halaman profile dan logout
  Widget profileContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 50,
            child: Icon(Icons.person, size: 60),
          ),
          const SizedBox(height: 15),
          const Text(
            'Elsa Ghina',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text('Kode Member: TE001'),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/',
                (route) => false,
              );
            },
            icon: const Icon(Icons.logout),
            label: const Text('Keluar / Logout'),
          ),
        ],
      ),
    );
  }
}
