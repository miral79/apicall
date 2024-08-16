import 'package:bloc_api_call/fechdata/apiService.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var users = <User>[].obs;
  var isLoading = true.obs;
  var hasMore = true.obs;
  var currentPage = 1;
  final ApiService apiService = ApiService();

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  Future<void> fetchUsers() async {
    if (isLoading.value || !hasMore.value) return;

    isLoading(true);
    try {
      var fetchedUsers = await apiService.fetchUsers(page: currentPage);
      if (fetchedUsers.isEmpty) {
        hasMore(false); // No more data to fetch
      } else {
        users.addAll(fetchedUsers);
        currentPage++;
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
