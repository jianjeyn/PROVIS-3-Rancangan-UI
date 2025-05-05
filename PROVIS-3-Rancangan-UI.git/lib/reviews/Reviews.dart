import 'package:flutter/material.dart';
import '../profile/Profile.dart';
import '../search/Search.dart';
import '../profile/Following.dart';
import '../profile/Followers.dart';
import '../Main.dart';
import '../search/DetailMenu.dart';
import '../community/Community.dart';
import 'AddReviews.dart';

class Reviews extends StatelessWidget {
  const Reviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF008080),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const ReviewsPage(),
    );
  }
}

class ReviewsPage extends StatefulWidget {
  const ReviewsPage({super.key});

  @override
  _ReviewsPageState createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  int _selectedIndex = 1; // Set the default selected index to 1 (bubble chat icon)

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const Community()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const RecipePage()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const ProfileRecipePage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Using Stack for the bottom navigation
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Handle back button press
                        },
                        child: const Icon(Icons.arrow_back, color: Color(0xFF008080)),
                      ),
                      const Expanded(
                        child: Center(
                          child: Text(
                            'Reviews',
                            style: TextStyle(
                              color: Color(0xFF008080),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 24), // Balance the header
                    ],
                  ),
                ),

                // Main content
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(0),
                    children: [
                      // Food item card
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFF008080),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Food image
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-1.2.1&auto=format&fit=crop&w=100&h=100&q=80',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 12),

                              // Food details
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Chicken Burger',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),

                                    // Rating stars
                                    Row(
                                      children: [
                                        for (int i = 0; i < 4; i++)
                                          const Icon(Icons.star, color: Colors.white, size: 16),
                                        const Icon(Icons.star_half, color: Colors.white, size: 16),
                                        const SizedBox(width: 4),
                                        const Text(
                                          '(456 Reviews)',
                                          style: TextStyle(color: Colors.white, fontSize: 12),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),

                                    // Chef info
                                    Row(
                                      children: [
                                        const CircleAvatar(
                                          radius: 12,
                                          backgroundImage: NetworkImage(
                                            'https://images.unsplash.com/photo-1566492031773-4f4e44671857?ixlib=rb-1.2.1&auto=format&fit=crop&w=30&h=30&q=80',
                                          ),
                                        ),
                                        const SizedBox(width: 6),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              '@Andrew-Mar',
                                              style: TextStyle(color: Colors.white, fontSize: 12),
                                            ),
                                            Text(
                                              'Andrew Martinez-Chef',
                                              style: TextStyle(color: Colors.white, fontSize: 10),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),

                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => const ReviewForm()),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          foregroundColor: const Color(0xFF008080),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                          minimumSize: Size.zero,
                                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                        ),
                                        child: const Text('Add Review', style: TextStyle(fontSize: 12)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Comments section
                      const Padding(
                        padding: EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
                        child: Text(
                          'Comments',
                          style: TextStyle(
                            color: Color(0xFF008080),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      // Comment 1
                      _buildCommentItem(
                        username: '@nnael_exp',
                        timeAgo: '(15 Mins Ago)',
                        avatarUrl: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&auto=format&fit=crop&w=50&h=50&q=80',
                        rating: 4,
                      ),

                      // Comment 2
                      _buildCommentItem(
                        username: '@yahyocoolquy',
                        timeAgo: '(40 Mins Ago)',
                        avatarUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-1.2.1&auto=format&fit=crop&w=50&h=50&q=80',
                        rating: 3,
                      ),

                      // Comment 3
                      _buildCommentItem(
                        username: '@alllavegan',
                        timeAgo: '(1 Hr Ago)',
                        avatarUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&auto=format&fit=crop&w=50&h=50&q=80',
                        rating: 5,
                      ),

                      // Add some bottom padding for scrolling
                      const SizedBox(height: 100),
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
                  children: List.generate(4, (index) {
                    final icons = [
                      Icons.home_outlined,
                      Icons.chat_bubble_outline,
                      Icons.search,
                      Icons.person_outline,
                    ];

                    final isSelected = _selectedIndex == index;

                    return GestureDetector(
                      onTap: () => _onNavItemTapped(index),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration:
                            isSelected &&
                                    index ==
                                        1 // Ensure only bubble chat is underlined
                                ? const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                )
                                : null,
                        child: Icon(icons[index], color: Colors.white),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentItem({
    required String username,
    required String timeAgo,
    required String avatarUrl,
    required int rating,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User avatar
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(avatarUrl),
              ),
              const SizedBox(width: 12),

              // Comment content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Username and time
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          username,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          timeAgo,
                          style: const TextStyle(
                            color: Colors.teal,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // Comment text
                    const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent fringilla eleifend purus vel dignissim. Praesent urna ante, iaculis et lobortis eu.',
                      style: TextStyle(fontSize: 12),
                    ),
                    const SizedBox(height: 8),

                    // Rating stars
                    Row(
                      children: [
                        for (int i = 0; i < rating; i++)
                          const Icon(Icons.star, color: Colors.teal, size: 16),
                        for (int i = 0; i < (5 - rating); i++)
                          const Icon(Icons.star_border, color: Colors.teal, size: 16),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Divider
        const Divider(height: 1),
      ],
    );
  }
}
