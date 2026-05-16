import 'package:flutter/material.dart';
import 'package:ddschool/core/theme.dart';
import 'package:ddschool/core/constants.dart';

class FeedPostCard extends StatelessWidget {
  final Map<String, dynamic> post;
  final UserRole userRole;
  final VoidCallback? onDelete;
  final VoidCallback? onPin;

  const FeedPostCard({
    super.key,
    required this.post,
    required this.userRole,
    this.onDelete,
    this.onPin,
  });

  @override
  Widget build(BuildContext context) {
    final bool isPinned = post['isPinned'] ?? false;
    final String category = post['category'] ?? PostCategory.announcement;

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Pinned Ribbon
          if (isPinned)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
              decoration: const BoxDecoration(
                color: AppColors.accent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
              ),
              child: Row(
                children: [
                  const Icon(Icons.push_pin_rounded, size: 14, color: AppColors.textPrimary),
                  const SizedBox(width: 8),
                  Text(
                    'PINNED ANNOUNCEMENT',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary.withValues(alpha: 0.8),
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header: Poster Info
                Row(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundImage: NetworkImage(post['posterAvatar']),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 8,
                            runSpacing: 4,
                            children: [
                              Text(
                                post['posterName'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              _buildRoleBadge(post['posterRole']),
                            ],
                          ),
                          Text(
                            post['date'],
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.textSecondary.withValues(alpha: 0.7),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (userRole == UserRole.admin || userRole == UserRole.principal)
                      _buildActionMenu(),
                  ],
                ),

                const SizedBox(height: 16),

                // Category Tag
                _buildCategoryTag(category),

                const SizedBox(height: 12),

                // Title
                Text(
                  post['title'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                    letterSpacing: -0.5,
                  ),
                ),

                const SizedBox(height: 8),

                // Description
                Text(
                  post['description'],
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),

          // Media Section
          if (post['images'] != null && post['images'].isNotEmpty)
            _buildMediaSection(post['images']),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildRoleBadge(String role) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        role.toUpperCase(),
        style: const TextStyle(
          fontSize: 8,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ),
    );
  }

  Widget _buildCategoryTag(String category) {
    Color tagColor;
    switch (category) {
      case PostCategory.homework: tagColor = Colors.orange; break;
      case PostCategory.event: tagColor = Colors.blue; break;
      case PostCategory.exam: tagColor = Colors.redAccent; break;
      case PostCategory.holiday: tagColor = Colors.purple; break;
      case PostCategory.achievement: tagColor = Colors.amber; break;
      default: tagColor = AppColors.primary;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: tagColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        category,
        style: TextStyle(
          color: tagColor,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildMediaSection(List<String> images) {
    if (images.length == 1) {
      return Container(
        height: 250,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(images[0], fit: BoxFit.cover),
        ),
      );
    } else {
      return SizedBox(
        height: 250,
        child: PageView.builder(
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(images[index], fit: BoxFit.cover),
              ),
            );
          },
        ),
      );
    }
  }

  Widget _buildActionMenu() {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert_rounded, color: AppColors.textSecondary),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onSelected: (value) {
        if (value == 'delete' && onDelete != null) onDelete!();
        if (value == 'pin' && onPin != null) onPin!();
      },
      itemBuilder: (context) => [
        if (userRole == UserRole.principal || userRole == UserRole.admin)
          const PopupMenuItem(
            value: 'pin',
            child: Row(
              children: [
                Icon(Icons.push_pin_outlined, size: 20),
                SizedBox(width: 8),
                Text('Pin Post'),
              ],
            ),
          ),
        const PopupMenuItem(
          value: 'delete',
          child: Row(
            children: [
              Icon(Icons.delete_outline_rounded, size: 20, color: Colors.redAccent),
              SizedBox(width: 8),
              Text('Delete', style: TextStyle(color: Colors.redAccent)),
            ],
          ),
        ),
      ],
    );
  }
}
