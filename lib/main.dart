import 'package:flutter/material.dart';

import 'package:studbud/chats.dart';
import 'package:studbud/home.dart';
import 'package:studbud/profile.dart';
import 'package:studbud/settings.dart';

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
