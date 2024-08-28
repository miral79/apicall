import 'package:bloc_api_call/fechdata/apiService.dart';
import 'package:bloc_api_call/fechdata/apicall_1.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
  var searchResult = {}.obs;
  var location = {}.obs;
  var data = {}.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchData();
    print("miral controller is call");
    super.onInit();
  }

  void searchPeople(String url) async {
    try {
      isLoading(true);
      var result = await ApiService().searchPeopleByUrl(url);
      if (result != null) {
        searchResult.value = result;
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }

  void fetchData() async {
    try {
      isLoading(true);
      var result = await Apicall().ApifetchData();
      print("result ::  $result ");
      if (result != null) {
        data.value = result;
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
    // isLoading.value = true;
    // data.value = await Apicall().ApifetchData();
    // isLoading.value = false;
  }
}
