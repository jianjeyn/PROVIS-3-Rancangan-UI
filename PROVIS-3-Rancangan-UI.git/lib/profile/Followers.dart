import 'package:flutter/material.dart';

class FollowersPage extends StatefulWidget {
  const FollowersPage({Key? key}) : super(key: key);

  @override
  State<FollowersPage> createState() => _FollowersPageState();
}

class _FollowersPageState extends State<FollowersPage> {
  final TextEditingController _searchController = TextEditingController();
  int? _highlightedIndex;
  
  // Sample data for followers
  final List<Map<String, dynamic>> followers = [
    {
      'username': '@nancymasak',
      'name': 'Nancy Joy',
      'image': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330',
      'isFollowing': true,
    },
    {
      'username': '@chefwakil',
      'name': 'Sheyla',
      'image': 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80',
      'isFollowing': true,
    },
    {
      'username': '@ricecook',
      'name': 'Erin Mandela',
      'image': 'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
      'isFollowing': true,
    },
    {
      'username': '@clairine',
      'name': 'Claire Akinyi',
      'image': 'https://images.unsplash.com/photo-1531123897727-8f129e1688ce',
      'isFollowing': true,
    },
    {
      'username': '@yathycookguy',
      'name': 'Yathy',
      'image': 'https://images.unsplash.com/photo-1544005313-94ddf0286df2',
      'isFollowing': true,
      'highlighted': true,
    },
    {
      'username': '@karikou',
      'name': 'Kari Reid',
      'image': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d',
      'isFollowing': true,
    },
    {
      'username': '@asifavegan',
      'name': 'Asfa Sabaabi',
      'image': 'https://images.unsplash.com/photo-1499952127939-9bbf5af6c51c',
      'isFollowing': true,
    },
    {
      'username': '@tastymorocco',
      'name': 'Moga Eristing Atoy',
      'image': 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d',
      'isFollowing': true,
    },
    {
      'username': '@spicyfantasy',
      'name': 'Spicy Fantasy',
      'image': 'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
      'isFollowing': true,
    },
  ];

  @override
  void initState() {
    super.initState();
    // Find the highlighted index
    for (int i = 0; i < followers.length; i++) {
      if (followers[i]['highlighted'] == true) {
        _highlightedIndex = i;
        break;
      }
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildSearchBar(),
          Expanded(
            child: _buildFollowersList(),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Color(0xFF2A9D8F)),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '@hafsahcoonik',
            style: TextStyle(
              color: Color(0xFF2A9D8F),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  // Navigate to following page
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const FollowingPage()),
                  );
                },
                child: const Text(
                  '120 Following',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFF2A9D8F),
                      width: 2.0,
                    ),
                  ),
                ),
                padding: const EdgeInsets.only(bottom: 4),
                child: const Text(
                  '250 Followers',
                  style: TextStyle(
                    color: Color(0xFF2A9D8F),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFAFDED9),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        controller: _searchController,
        decoration: const InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }

  Widget _buildFollowersList() {
    return ListView.builder(
      itemCount: followers.length,
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemBuilder: (context, index) {
        final user = followers[index];
        return _buildFollowerItem(user, index);
      },
    );
  }

  Widget _buildFollowerItem(Map<String, dynamic> user, int index) {
    final bool isHighlighted = index == _highlightedIndex;
    
    return Container(
      decoration: BoxDecoration(
        color: isHighlighted ? const Color(0xFF9C27B0).withOpacity(0.2) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(user['image']),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user['username'],
                  style: TextStyle(
                    color: isHighlighted ? const Color(0xFF9C27B0) : const Color(0xFF2A9D8F),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  user['name'],
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: isHighlighted ? const Color(0xFF9C27B0) : const Color(0xFF2A9D8F),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Following',
              style: TextStyle(
                color: isHighlighted ? const Color(0xFF9C27B0) : const Color(0xFF2A9D8F),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: isHighlighted ? const Color(0xFF9C27B0).withOpacity(0.2) : const Color(0xFFAFDED9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Delete',
              style: TextStyle(
                color: isHighlighted ? const Color(0xFF9C27B0) : const Color(0xFF2A9D8F),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
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
class FollowingPage extends StatelessWidget {
  const FollowingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}