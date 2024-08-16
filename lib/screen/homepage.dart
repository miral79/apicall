import 'package:bloc_api_call/controller/user_controller.dart';
import 'package:bloc_api_call/fechdata/apiService.dart';
import 'package:bloc_api_call/screen/userpost.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Obx(() {
        if (userController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (userController.users.isEmpty) {
          return Center(child: Text('No users found'));
        } else {
          final groupedUsers = <int, List<User>>{};
          for (var user in userController.users) {
            if (!groupedUsers.containsKey(user.userid)) {
              groupedUsers[user.userid] = [];
            }
            groupedUsers[user.userid]!.add(user);
          }
          return ListView(
            children: groupedUsers.entries.map((entry) {
              final userId = entry.key;
              final users = entry.value;
              return ListTile(
                title: Text('User Id $userId'),
                subtitle: Text('${users.length} posts'),
                onTap: () {
                  Get.to(
                    () => UserPostsScreen(userId: userId, posts: users),
                  );
                },
              );
            }).toList(),
          );
        }
      }),
    );
  }
}
