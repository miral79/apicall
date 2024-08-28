import 'package:bloc_api_call/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Location extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserController controller = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Example'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.data.isEmpty) {
          return Center(child: Text('No data available'));
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Data: ${controller.data}'),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    controller.fetchData();
                  },
                  child: Text('Fetch Data'),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
