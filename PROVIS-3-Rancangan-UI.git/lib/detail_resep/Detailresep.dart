import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart'; // jika pakai package ikon lain

class DetailResep extends StatefulWidget {
  const DetailResep({super.key});

  @override
  State<DetailResep> createState() => _DetailResepState();
}

class _DetailResepState extends State<DetailResep> {
  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  const Icon(Icons.arrow_back, size: 24),
                  const SizedBox(width: 8),
                  const Text(
                    'Nut Brownie',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const Spacer(),
                  Icon(Icons.share),
                  const SizedBox(width: 8),
                  Icon(Icons.bookmark_border),
                ],
              ),
              const SizedBox(height: 16),

              // Gambar + Video
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1606755962773-0c3f321b31d6',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Icon(Icons.play_arrow, size: 32, color: Colors.teal),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Judul + Rating
              Row(
                children: const [
                  Text(
                    'Nut Brownie',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Icon(Icons.star, color: Colors.amber),
                  Text('4.7'),
                  SizedBox(width: 10),
                  Icon(Icons.remove_red_eye_outlined),
                  Text(' 78579'),
                ],
              ),
              const SizedBox(height: 16),

              // Profile
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage('https://i.pravatar.cc/100?img=3'),
                  ),
                  const SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('@yahyocoolguy', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Yahyo'),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.teal[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text('Following'),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.more_vert),
                ],
              ),
              const Divider(height: 32),

              // Details
              const Row(
                children: [
                  Text('Details', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(width: 10),
                  Icon(Icons.timer, size: 16),
                  Text(' 14 min'),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'Aman aja kalau kalian mau ikutin resep saya, ini enak pol loh. Kapan lagi bro bisa masakan sendiri, gas lahhh bikin guy.',
              ),
              const Divider(height: 32),

              // Ingredients
              const Text('Ingredients', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('• 1/2 cangkir (1 batang) mentega tawar\n'
                  '• 1 cangkir gula pasir\n'
                  '• 2 butir telur besar\n'
                  '• 1 sendok teh ekstrak vanila\n'
                  '• 1/3 cangkir bubuk kakao tanpa pemanis\n'
                  '• 1/2 cangkir tepung serbaguna\n'
                  '• 1/4 sendok teh garam\n'
                  '• 1/2 cangkir kacang cincang (seperti kenari atau pecan)'),
              const Divider(height: 32),

              // Steps
              const Text('5 Easy Steps', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal)),
              const SizedBox(height: 12),
              for (var i = 0; i < 5; i++)
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.teal[50],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(_steps[i]),
                ),
            ],
          ),
        ),
      ),
    );
  }

  final List<String> _steps = [
    'Lelehkan 1/2 cangkir mentega tawar dalam panci kecil di atas api kecil. Setelah meleleh, matikan api dan biarkan agak dingin.',
    'Dalam mangkuk besar, campurkan gula pasir, telur, dan ekstrak vanila. Aduk rata sampai mengental dan warnanya agak cerah.',
    'Masukkan bubuk kakao ke dalam campuran, lalu tuang mentega leleh sambil diaduk rata sampai tercampur sempurna dan warnanya gelap pekat.',
    'Tambahkan tepung serbaguna dan garam, aduk perlahan sampai tidak ada tepung yang terlihat. Terakhir, masukkan kacang cincang, aduk rata.',
    'Tuang adonan ke dalam loyang yang sudah dioles mentega. Panggang di oven suhu 175°C (350°F) selama 20–25 menit.',
  ];
}
