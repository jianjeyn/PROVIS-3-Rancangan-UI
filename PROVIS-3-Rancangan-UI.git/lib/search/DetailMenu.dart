import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe App',
      theme: ThemeData(
        primaryColor: const Color(0xFF2A9D8F),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2A9D8F),
          primary: const Color(0xFF2A9D8F),
        ),
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const DetailMenuPage(),
    );
  }
}

class DetailMenuPage extends StatelessWidget {
  const DetailMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header bar
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.teal),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const Spacer(),
                        const Text(
                          'Still Life Potato Egg',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.favorite_border, color: Colors.teal),
                        const SizedBox(width: 16),
                        const Icon(Icons.notifications_none, color: Colors.teal),
                      ],
                    ),
                  ),


                 // Image with overlaid title and icons
                  Center(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1565299507177-b0ac66763828',
                            width: 300,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: 300,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                            child: Row(
                              children: const [
                                Expanded(
                                  child: Text(
                                    "Still Life Potato Egg",
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Icon(Icons.star, color: Colors.white, size: 16),
                                SizedBox(width: 4),
                                Text("3.9", style: TextStyle(color: Colors.white)),
                                SizedBox(width: 8),
                                Icon(Icons.comment, color: Colors.white, size: 16),
                                SizedBox(width: 4),
                                Text("2.273", style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Tambahkan jarak antar elemen
                  const SizedBox(height: 16),

                  // Author Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage('https://images.unsplash.com/photo-1513104890138-7c749659a591'),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('@josh-ryan', style: TextStyle(fontWeight: FontWeight.w500)),
                            Text('Josh Ryan - Chef', style: TextStyle(fontSize: 12)),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.teal[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text('Following', style: TextStyle(color: Colors.teal)),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.more_vert, color: Colors.teal),
                      ],
                    ),
                  ),


                  const Divider(indent: 16, endIndent: 16),

                  // Detail Section with time on the right
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Text(
                          "Details",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.teal),
                        ),
                        Spacer(),
                        Icon(Icons.schedule, size: 16, color: Colors.teal),
                        SizedBox(width: 4),
                        Text("45 min", style: TextStyle(color: Colors.teal)),
                      ],
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      "Hidangan bergizi yang dibuat dengan menggabungkan telur dengan bayam, bawang bombay, dan bawang putih yang ditumis, dibumbui dengan rempah-rempah dan bumbu, lalu dipanggang hingga berwarna keemasan dan menggembung, menyajikan pilihan makan yang memuaskan dan serbaguna untuk sarapan, brunch, atau makan malam.",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),


                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "Ingredients",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.teal),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("• 6 large eggs"),
                        Text("• 1/4 cup chopped onion"),
                        Text("• 1 tablespoon olive oil"),
                        Text("• Salt and pepper to taste"),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Custom Bottom Navigation
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 240,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(Icons.home_outlined, color: Colors.white),
                      const Icon(Icons.chat_bubble_outline, color: Colors.white),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.white, width: 2),
                          ),
                        ),
                        child: const Icon(Icons.search, color: Colors.white),
                      ),
                      const Icon(Icons.person_outline, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}