import 'package:bloc_api_call/binding.dart';
import 'package:bloc_api_call/screen/homepage.dart';
import 'package:bloc_api_call/screen/userpost.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const home = '/home';
  static const userpost = '/userpost';

  static List<GetPage> routes = [
    GetPage(name: home, page: () => HomePage(), binding: apicall()),
    GetPage(
      name: userpost,
      page: () => UserPostsScreen(
        userId: Get.arguments['userId'] ??
            0, // Default to 0 if no argument is provided
        posts: Get.arguments['posts'] ??
            [], // Default to empty list if no argument is provided
      ),
    )
    // GetPage(name: details, page: page)
  ];
}

class Getpage {}
