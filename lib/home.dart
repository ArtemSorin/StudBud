import 'package:flutter/material.dart';

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
