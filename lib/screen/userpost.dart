import 'package:bloc_api_call/fechdata/apiService.dart';
import 'package:flutter/material.dart';

class UserPostsScreen extends StatelessWidget {
  final int userId;
  final List<User> posts;

  UserPostsScreen({required this.userId, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Posts for User $userId'),
        ),
        body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return Card(
              elevation: 20,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: ListTile(
                title: Text(
                  post.title,
                  // maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(post.body),
              ),
            );
          },
        ));
  }
}
