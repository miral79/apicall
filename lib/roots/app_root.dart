import 'package:bloc_api_call/binding.dart';
import 'package:bloc_api_call/screen/homepage.dart';
import 'package:bloc_api_call/screen/location.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const home = '/home';
  static const location = '/location';

  static List<GetPage> routes = [
    GetPage(name: home, page: () => HomePage(), binding: apicall()),
    GetPage(name: location, page: () => Location(), binding: apicall()),

    // GetPage(name: details, page: page)
  ];
}
