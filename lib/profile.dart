import 'package:flutter/material.dart';

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
