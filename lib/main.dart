import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    ChatsScreen(),
    ProfileScreen(),
    SettingsScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _addStory() {
    // Логика добавления истории
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Добавить историю'),
          content: Text('Здесь будет логика добавления истории.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Закрыть'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Лента',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: Icon(Icons.menu, color: Colors.black),
        actions: [
          Icon(Icons.notifications, color: Colors.black),
          SizedBox(width: 16),
          Icon(Icons.message, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.black),
              onPressed: () => _onTabTapped(0),
            ),
            IconButton(
              icon: Icon(Icons.chat, color: Colors.black),
              onPressed: () => _onTabTapped(1),
            ),
            SizedBox(width: 40), // Пространство для плавающей кнопки
            IconButton(
              icon: Icon(Icons.person, color: Colors.black),
              onPressed: () => _onTabTapped(2),
            ),
            IconButton(
              icon: Icon(Icons.settings, color: Colors.black),
              onPressed: () => _onTabTapped(3),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addStory,
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.black,
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildStoryAvatar(String name, IconData? icon, {String? imageUrl}) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.black,
                child: imageUrl != null
                    ? CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(imageUrl),
                      )
                    : Icon(icon, size: 28, color: Colors.white),
              ),
              SizedBox(height: 5),
              Text(name),
            ],
          ),
        ));
  }

  Widget _buildImagePost(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(imageUrl, fit: BoxFit.cover),
    );
  }
}

// Экран главной страницы
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _buildImagePost(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(imageUrl, fit: BoxFit.cover),
    );
  }

  Widget _buildStoryAvatar(String name, IconData? icon, {String? imageUrl}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.black,
            child: imageUrl != null
                ? CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(imageUrl),
                  )
                : Icon(icon, size: 28, color: Colors.white),
          ),
          Text(name),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 10),
        Container(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildStoryAvatar('Add Story', Icons.add),
              _buildStoryAvatar('Anna Asol', null,
                  imageUrl: 'https://via.placeholder.com/50'),
              _buildStoryAvatar('Anna Asol', null,
                  imageUrl: 'https://via.placeholder.com/50'),
              _buildStoryAvatar('Anna Asol', null,
                  imageUrl: 'https://via.placeholder.com/50'),
              _buildStoryAvatar('Anna Asol', null,
                  imageUrl: 'https://via.placeholder.com/50'),
            ],
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/50'),
                    radius: 25,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Anna Asol',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Just Now',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "I want to show my TOEFL result. What do you think about it?",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildImagePost('https://via.placeholder.com/150'),
                  _buildImagePost('https://via.placeholder.com/150'),
                  _buildImagePost('https://via.placeholder.com/150'),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.favorite, color: Colors.black),
                      SizedBox(width: 5),
                      Text("3.2K"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.comment, color: Colors.black),
                      SizedBox(width: 5),
                      Text("333"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Экран чатов
class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildChatItem(
            avatarUrl: 'https://via.placeholder.com/50',
            name: 'Anna Asol',
            lastMessage: 'Hi! How are you?',
            time: '10:30 AM',
            isUnread: true,
          ),
          Divider(),
          _buildChatItem(
            avatarUrl: 'https://via.placeholder.com/50',
            name: 'John Doe',
            lastMessage: 'Let\'s meet tomorrow.',
            time: '9:15 AM',
            isUnread: false,
          ),
          Divider(),
          _buildChatItem(
            avatarUrl: 'https://via.placeholder.com/50',
            name: 'Sophia Smith',
            lastMessage: 'Check this out!',
            time: 'Yesterday',
            isUnread: false,
          ),
          Divider(),
          _buildChatItem(
            avatarUrl: 'https://via.placeholder.com/50',
            name: 'Michael Brown',
            lastMessage: 'Thanks for the update.',
            time: 'Yesterday',
            isUnread: false,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Добавить действие для создания нового чата
        },
        child: Icon(Icons.edit, color: Colors.white),
        backgroundColor: Colors.black,
      ),
    );
  }

  Widget _buildChatItem({
    required String avatarUrl,
    required String name,
    required String lastMessage,
    required String time,
    required bool isUnread,
  }) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(avatarUrl),
      ),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: isUnread ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      subtitle: Text(
        lastMessage,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: isUnread ? Colors.black : Colors.grey,
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            style: TextStyle(
              color: isUnread ? Colors.black : Colors.grey,
              fontSize: 12,
            ),
          ),
          if (isUnread)
            Container(
              margin: EdgeInsets.only(top: 4),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
      onTap: () {
        // Действие при нажатии на чат
      },
    );
  }
}

// Экран профиля
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage:
                        NetworkImage('https://via.placeholder.com/150'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Anna Asol',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Vilnius, Lithuania',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildProfileDetail('Age', '25'),
                      _buildProfileDetail('Gender', 'Female'),
                    ],
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Interests:',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 8),
                  _buildInterestChips([
                    'Math',
                    'Programming',
                    'Technology',
                    'Music',
                    'Fitness'
                  ]),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  _buildPost(
                      'Anna Asol',
                      'Just Now',
                      'I want to show my TOEFL result. What do you think about it?',
                      [
                        'https://via.placeholder.com/150',
                        'https://via.placeholder.com/150',
                        'https://via.placeholder.com/150',
                      ],
                      '3.2K',
                      '333'),
                  Divider(),
                  _buildPost(
                      'Anna Asol',
                      '1 hour ago',
                      'Here is a photo from my last trip to the mountains! It was an amazing experience.',
                      [
                        'https://via.placeholder.com/150',
                        'https://via.placeholder.com/150',
                      ],
                      '1.8K',
                      '120'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileDetail(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildInterestChips(List<String> interests) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: interests
          .map(
            (interest) => Chip(
              label: Text(interest),
              backgroundColor: Colors.black,
              labelStyle: TextStyle(color: Colors.white),
            ),
          )
          .toList(),
    );
  }

  Widget _buildPost(String username, String timeAgo, String content,
      List<String> images, String likes, String comments) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/50'),
              radius: 25,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  timeAgo,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          content,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 10),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: images
              .map(
                (imageUrl) => ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(imageUrl, fit: BoxFit.cover),
                ),
              )
              .toList(),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.favorite, color: Colors.black),
                SizedBox(width: 5),
                Text(likes),
              ],
            ),
            Row(
              children: [
                Icon(Icons.comment, color: Colors.black),
                SizedBox(width: 5),
                Text(comments),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

// Экран настроек
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildSettingsItem(
            context,
            icon: Icons.notifications,
            title: 'Notifications',
            onTap: () {
              // Переход к экрану настроек уведомлений
            },
          ),
          _buildSettingsItem(
            context,
            icon: Icons.color_lens,
            title: 'App Theme',
            onTap: () {
              // Переход к экрану настроек темы приложения
            },
          ),
          _buildSettingsItem(
            context,
            icon: Icons.language,
            title: 'App Language',
            onTap: () {
              // Переход к экрану настроек языка приложения
            },
          ),
          _buildSettingsItem(
            context,
            icon: Icons.lock,
            title: 'Access Settings',
            onTap: () {
              // Переход к экрану настроек доступа
            },
          ),
          _buildSettingsItem(
            context,
            icon: Icons.delete,
            title: 'Delete Account',
            onTap: () {
              // Подтверждение удаления аккаунта
            },
          ),
          _buildSettingsItem(
            context,
            icon: Icons.info,
            title: 'About App',
            onTap: () {
              // Переход к экрану "О приложении"
            },
          ),
          _buildSettingsItem(
            context,
            icon: Icons.support,
            title: 'Support',
            onTap: () {
              // Переход к экрану поддержки
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}
