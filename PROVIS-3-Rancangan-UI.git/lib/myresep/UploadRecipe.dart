import 'package:flutter/material.dart';

class RecipeViewPage extends StatelessWidget {
  const RecipeViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRecipeImage(),
            _buildUserInfo(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailsSection(),
                  const SizedBox(height: 16),
                  _buildIngredientsSection(),
                  const SizedBox(height: 16),
                  _buildExtraInfo(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Color(0xFF2A9D8F)),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: const Text(
        'Drinks',
        style: TextStyle(
          color: Color(0xFF2A9D8F),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: [
        TextButton(
          onPressed: () {
            // Navigate to edit page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EditRecipePage()),
            );
          },
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xFFAFDED9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
          ),
          child: const Text(
            'Edit',
            style: TextStyle(
              color: Color(0xFF2A9D8F),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          margin: const EdgeInsets.only(right: 16),
          child: CircleAvatar(
            backgroundColor: const Color(0xFFAFDED9),
            radius: 16,
            child: Icon(
              Icons.add,
              color: const Color(0xFF2A9D8F),
              size: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecipeImage() {
    return Stack(
      children: [
        Container(
          height: 220,
          width: double.infinity,
          child: Image.network(
            'https://images.unsplash.com/photo-1551024709-8f23befc6f87',
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Center(
            child: CircleAvatar(
              backgroundColor: const Color(0xFF2A9D8F),
              radius: 30,
              child: const Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            color: const Color(0xFF2A9D8F),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Pina Colada',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Icon(Icons.share, color: Colors.white, size: 20),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUserInfo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: const NetworkImage(
              'https://images.unsplash.com/photo-1494790108377-be9c29b29330',
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '@hafsahcoonik',
                style: TextStyle(
                  color: Color(0xFF2A9D8F),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const Text(
                'Hafsah Hamidah',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2A9D8F),
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.access_time, size: 16, color: Colors.grey),
            const SizedBox(width: 4),
            const Text(
              '30min',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          'A tropical explosion in every sip.',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildIngredientsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ingredients',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2A9D8F),
          ),
        ),
        const SizedBox(height: 12),
        _buildIngredientItem('2 cups of strong coffee brewed and cooled'),
        _buildIngredientItem('1 cup ice cubes'),
        _buildIngredientItem('1/2 cup of milk'),
        _buildIngredientItem('2 tablespoons sugar or sweetener or adjusted to taste'),
        _buildIngredientItem('Whipped cream to decorate (optional)'),
        _buildIngredientItem('Vanilla, almond or caramel syrup for flavor (optional)'),
      ],
    );
  }

  Widget _buildIngredientItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(
              color: Color(0xFF2A9D8F),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExtraInfo() {
    return Row(
      children: [
        const Text(
          '6 Easy Steps',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2A9D8F),
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFAFDED9),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Row(
            children: [
              Icon(
                Icons.visibility,
                color: Color(0xFF2A9D8F),
                size: 16,
              ),
              SizedBox(width: 4),
              Text(
                'View Steps',
                style: TextStyle(
                  color: Color(0xFF2A9D8F),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Color(0xFF2A9D8F),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(Icons.home_outlined, color: Colors.white),
          const Icon(Icons.chat_bubble_outline, color: Colors.white),
          const Icon(Icons.search, color: Colors.white),
          const Icon(Icons.person_outline, color: Colors.white),
        ],
      ),
    );
  }
}

// This is just a stub to make the code compile
class EditRecipePage extends StatelessWidget {
  const EditRecipePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}