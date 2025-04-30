import 'package:flutter/material.dart';

class FollowingPage extends StatefulWidget {
  const FollowingPage({Key? key}) : super(key: key);

  @override
  State<FollowingPage> createState() => _FollowingPageState();
}

class _FollowingPageState extends State<FollowingPage> {
  // Sample data for following users
  final List<Map<String, dynamic>> following = [
    {
      'username': '@chef_manuel',
      'name': 'Manuel Cordeiro',
      'image': 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e',
      'isFollowing': true,
    },
    {
      'username': '@chef_maria',
      'name': 'Maria Petrigan',
      'image': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330',
      'isFollowing': true,
    },
    {
      'username': '@pastryqueen',
      'name': 'Alina Gingher',
      'image': 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80',
      'isFollowing': true,
    },
    {
      'username': '@healthycooking',
      'name': 'Sophia',
      'image': 'https://images.unsplash.com/photo-1544005313-94ddf0286df2',
      'isFollowing': true,
    },
    {
      'username': '@asianfood',
      'name': 'Liam Nakamura',
      'image': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d',
      'isFollowing': true,
    },
    {
      'username': '@italianpasta',
      'name': 'Sofia Giardino',
      'image': 'https://images.unsplash.com/photo-1499952127939-9bbf5af6c51c',
      'isFollowing': true,
    },
    {
      'username': '@spicyworld',
      'name': 'Jamal Masri',
      'image': 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d',
      'isFollowing': true,
    },
    {
      'username': '@frenchcuisine',
      'name': 'Pierre',
      'image': 'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
      'isFollowing': true,
    },
    {
      'username': '@dessertime',
      'name': 'Emma',
      'image': 'https://images.unsplash.com/photo-1531123897727-8f129e1688ce',
      'isFollowing': true,
    },
  ];

  String? selectedUser;
  bool showOptionsModal = false;
  bool showNotificationsModal = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          _buildFollowingList(),
          if (showOptionsModal) _buildOptionsModal(),
          if (showNotificationsModal) _buildNotificationsModal(),
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
        icon: Icon(Icons.arrow_back, color: Color(0xFF2A9D8F)),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '@hafsahcoonik',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Text(
                '120 Following',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                height: 4,
                width: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  shape: BoxShape.circle,
                ),
              ),
              Text(
                '250 Followers',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFollowingList() {
    return ListView(
      padding: EdgeInsets.only(top: 16),
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Color(0xFF9C27B0).withOpacity(0.2),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              Icon(
                Icons.people,
                color: Color(0xFF9C27B0),
              ),
              SizedBox(width: 8),
              Text(
                'Following',
                style: TextStyle(
                  color: Color(0xFF9C27B0),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        ...following.map((user) => _buildFollowingItem(user)).toList(),
        SizedBox(height: 80), // Extra space at the bottom
      ],
    );
  }

  Widget _buildFollowingItem(Map<String, dynamic> user) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(user['image']),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user['username'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  user['name'],
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                user['isFollowing'] = !user['isFollowing'];
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: user['isFollowing'] ? Color(0xFFAFDED9) : Colors.grey[200],
              foregroundColor: user['isFollowing'] ? Color(0xFF2A9D8F) : Colors.grey[800],
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              minimumSize: Size(100, 36),
            ),
            child: Text(
              user['isFollowing'] ? 'Following' : 'Follow',
              style: TextStyle(fontSize: 12),
            ),
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.grey),
            onPressed: () {
              setState(() {
                selectedUser = user['username'];
                showOptionsModal = true;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOptionsModal() {
    return GestureDetector(
      onTap: () {
        setState(() {
          showOptionsModal = false;
        });
      },
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: Container(
            margin: EdgeInsets.all(32),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                        following.firstWhere((f) => f['username'] == selectedUser)['image'],
                      ),
                    ),
                    SizedBox(width: 12),
                    Text(
                      selectedUser ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                _buildOptionItem(
                  'Manage notifications',
                  () {
                    setState(() {
                      showOptionsModal = false;
                      showNotificationsModal = true;
                    });
                  },
                ),
                _buildOptionItem(
                  'Mute notifications',
                  () {
                    setState(() {
                      showOptionsModal = false;
                    });
                  },
                ),
                _buildOptionItem(
                  'Block Account',
                  () {
                    setState(() {
                      showOptionsModal = false;
                    });
                  },
                ),
                _buildOptionItem(
                  'Report',
                  () {
                    setState(() {
                      showOptionsModal = false;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationsModal() {
    return GestureDetector(
      onTap: () {
        setState(() {
          showNotificationsModal = false;
        });
      },
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: Container(
            margin: EdgeInsets.all(32),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                        following.firstWhere((f) => f['username'] == selectedUser)['image'],
                      ),
                    ),
                    SizedBox(width: 12),
                    Text(
                      selectedUser ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Manage notifications',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 16),
                _buildSwitchItem('Notifications', true),
                _buildSwitchItem('Block Account', false),
                _buildSwitchItem('Report', false),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOptionItem(String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Text(
          title,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildSwitchItem(String title, bool initialValue) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
          Switch(
            value: initialValue,
            onChanged: (value) {},
            activeColor: Color(0xFF2A9D8F),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Color(0xFF2A9D8F),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.home_outlined, color: Colors.white),
          Icon(Icons.chat_bubble_outline, color: Colors.white),
          Icon(Icons.search, color: Colors.white),
          Icon(Icons.person, color: Colors.white),
        ],
      ),
    );
  }
}