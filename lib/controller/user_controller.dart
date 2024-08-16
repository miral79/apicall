import 'package:bloc_api_call/fechdata/apiService.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var users = <User>[].obs;
  var isLoading = true.obs;
  var hasMore = true.obs;
  var currenatpage = 1;
  final ApiService apiService = ApiService();

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    try {
      isLoading(true);
      var fetchedUsers = await apiService.fetchUsers();
      users.assignAll(fetchedUsers);
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
