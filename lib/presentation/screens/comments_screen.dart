import 'package:flutter/material.dart';

import '../widgets/comments/comment_item.dart';
import '../widgets/comments/comment_with_replies.dart';
import '../widgets/comments/post_footer.dart';
import '../widgets/comments/post_header.dart';
import '../widgets/comments/post_images.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  final Map<int, bool> _showAllReplies = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Комментарии',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: const [
          Icon(Icons.notifications, color: Colors.black),
          SizedBox(width: 16),
          Icon(Icons.door_front_door, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PostHeader(),
              const SizedBox(height: 10),
              const PostImages(),
              const SizedBox(height: 10),
              const PostFooter(),
              const Divider(),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const CommentItem(
                    id: 0,
                    name: 'Иван Петров',
                    text: 'Вау! Это потрясающе!',
                  ),
                  const CommentItem(
                    id: 1,
                    name: 'Анна Смирнова',
                    text: 'Поздравляю! Какой у тебя результат?',
                  ),
                  CommentWithReplies(
                    id: 2,
                    name: 'Елена Белова',
                    text: 'Отлично! Как ты готовилась?',
                    showAllReplies: _showAllReplies,
                    onShowAllPressed: () {
                      setState(() {
                        _showAllReplies[2] = true;
                      });
                    },
                    replies: const [
                      CommentItem(
                        id: 3,
                        name: 'Анна Асоль',
                        text: 'Спасибо! Я использовала онлайн-курсы.',
                      ),
                      CommentItem(
                        id: 4,
                        name: 'Михаил Козлов',
                        text: 'Можешь поделиться ресурсами?',
                      ),
                      CommentItem(
                        id: 5,
                        name: 'Светлана Иванова',
                        text: 'Мне тоже нужны эти материалы!',
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Напишите комментарий...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send, color: Colors.blueAccent),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
