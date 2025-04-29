import 'package:flutter/material.dart';
import 'profile/Profile.dart';

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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  _buildHeader(),
                  const SizedBox(height: 20),
                  _buildCategoryButtons(),
                  const SizedBox(height: 24),
                  _buildTrendingRecipe(),
                  const SizedBox(height: 24),
                  _buildYourRecipes(),
                  const SizedBox(height: 24),
                  _buildRecentlyAdded(),
                  const SizedBox(height: 80), // Space for bottom navigation
                  // _buildBottomNavigationBar(context),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomNavigationBar(context),
      );
    }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi Hafsah!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2A9D8F),
              ),
            ),
            Text(
              'What are you cooking today',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        CircleAvatar(
          backgroundColor: Color(0xFFE0F5F2),
          radius: 20,
          child: Text(
            'H',
            style: TextStyle(
              color: Color(0xFF2A9D8F),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryButtons() {
    final categories = ['Breakfast', 'Lunch', 'Dinner', 'Vegan', 'D'];
    
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          final isSelected = category == 'Breakfast';
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: isSelected ? Color(0xFF2A9D8F) : Colors.white,
                foregroundColor: isSelected ? Colors.white : Colors.black,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: isSelected ? Colors.transparent : Colors.grey.shade300,
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              child: Text(category),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTrendingRecipe() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Trending Recipe',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1513104890138-7c749659a591',
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 16,
                      child: Icon(
                        Icons.bookmark_border,
                        size: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.access_time, size: 14),
                          SizedBox(width: 4),
                          Text('30 min', style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Salami and cheese pizza',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Pizza made with a mix of the ingredients...',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        Icon(Icons.star_half, color: Colors.amber, size: 16),
                        Spacer(),
                        Icon(Icons.favorite, color: Colors.red, size: 16),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildYourRecipes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Recipes',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildRecipeCard(
                'Chicken Burger',
                'https://images.unsplash.com/photo-1568901346375-23c9450c58cd',
                '15 min',
                4.5,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildRecipeCard(
                'Tiramisu',
                'https://images.unsplash.com/photo-1571877227200-a0d98ea607e9',
                '30 min',
                5.0,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRecipeCard(String title, String imageUrl, String time, double rating) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.network(
                  imageUrl,
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 14,
                  child: Icon(
                    Icons.bookmark_border,
                    size: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 14),
                    SizedBox(width: 2),
                    Text(
                      rating.toString(),
                      style: TextStyle(fontSize: 12),
                    ),
                    Spacer(),
                    Icon(Icons.access_time, size: 12, color: Colors.grey),
                    SizedBox(width: 2),
                    Text(
                      time,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentlyAdded() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recently Added',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1565299507177-b0ac66763828',
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: CircleAvatar(
                        backgroundColor: Color(0xFF2A9D8F),
                        radius: 14,
                        child: Icon(
                          Icons.bookmark_border,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1576506295286-5cda18df43e7',
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: CircleAvatar(
                        backgroundColor: Color(0xFF2A9D8F),
                        radius: 14,
                        child: Icon(
                          Icons.bookmark_border,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(context, Icons.home, true),
          _buildNavItem(context, Icons.chat_bubble_outline, false),
          _buildNavItem(context, Icons.search, false),
          _buildNavItem(context, Icons.person_outline, false),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, bool isSelected) {
    return GestureDetector(
      onTap: () {
        if (icon == Icons.person_outline) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilePage()),
          );
        } else {
          // Aksi lain jika diperlukan untuk ikon lainnya
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF2A9D8F) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.grey,
          size: 24,
        ),
      ),
    );
  }
}