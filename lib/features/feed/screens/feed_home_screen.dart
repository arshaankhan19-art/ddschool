import 'package:flutter/material.dart';
import 'package:ddschool/core/theme.dart';
import 'package:ddschool/core/constants.dart';
import 'package:ddschool/features/feed/widgets/feed_post_card.dart';
import 'package:ddschool/features/feed/screens/create_post_screen.dart';

class FeedHomeScreen extends StatefulWidget {
  const FeedHomeScreen({super.key});

  @override
  State<FeedHomeScreen> createState() => _FeedHomeScreenState();
}

class _FeedHomeScreenState extends State<FeedHomeScreen> {
  late List<Map<String, dynamic>> _posts;

  @override
  void initState() {
    super.initState();
    _posts = List.from(MockData.feedPosts);
  }

  void _handleDeletePost(int index) {
    setState(() {
      _posts.removeAt(index);
    });
  }

  void _handlePinPost(int index) {
    setState(() {
      final post = _posts.removeAt(index);
      post['isPinned'] = !(post['isPinned'] ?? false);
      if (post['isPinned']) {
        _posts.insert(0, post);
      } else {
        _posts.add(post); // Just for demo, usually it would stay near top or original position
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final role = MockData.currentUserRole;
    final bool canPost = role == UserRole.teacher || 
                         role == UserRole.principal || 
                         role == UserRole.admin;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.school_rounded, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 12),
            const Text(
              'DD School',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded, size: 26),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: _posts.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 24, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Latest Updates',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    'Stay connected with your school timeline',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            );
          }
          final post = _posts[index - 1];
          return FeedPostCard(
            post: post,
            userRole: role,
            onDelete: () => _handleDeletePost(index - 1),
            onPin: () => _handlePinPost(index - 1),
          );
        },
      ),
      floatingActionButton: canPost
          ? FloatingActionButton.extended(
              onPressed: () async {
                final newPost = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CreatePostScreen()),
                );
                if (newPost != null) {
                  setState(() {
                    _posts.insert(0, newPost);
                  });
                }
              },
              backgroundColor: AppColors.primary,
              icon: const Icon(Icons.add_rounded, color: Colors.white),
              label: const Text(
                'Create Post',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            )
          : null,
    );
  }
}
