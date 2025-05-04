import 'package:flutter/material.dart';
import 'comment_item.dart';

class CommentWithReplies extends StatelessWidget {
  final int id;
  final String name;
  final String text;
  final List<Widget> replies;
  final Map<int, bool> showAllReplies;
  final VoidCallback onShowAllPressed;

  const CommentWithReplies({
    super.key,
    required this.id,
    required this.name,
    required this.text,
    required this.replies,
    required this.showAllReplies,
    required this.onShowAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    bool showAll = showAllReplies[id] ?? false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommentItem(id: id, name: name, text: text),
        if (replies.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Column(
              children: [
                replies.first,
                if (replies.length > 1)
                  if (showAll)
                    Column(children: replies.skip(1).toList())
                  else
                    TextButton(
                      onPressed: onShowAllPressed,
                      child: const Text(
                        "Показать больше",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
              ],
            ),
          ),
      ],
    );
  }
}
