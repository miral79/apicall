import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bloc_api_call/controller/user_controller.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(title: Text('LinkedIn Search')),
      body: Obx(() {
        if (userController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (userController.searchResult.isEmpty) {
          return Center(child: Text('No results found'));
        } else {
          return ListView.builder(
            itemCount: userController.searchResult.length,
            itemBuilder: (context, index) {
              // final entry = userController.searchResult.entries.toList()[index];
              final item = userController.searchResult['data']['items'][index];

              final fullName = item['fullName'];
              final summary = item['summary'];
              final headline = item['headline'];
              final location = item['location'];
              final username = item['username'];
              final image = item["profileURL"];
              print("entry  == $item");
              // Text(summary.isNotEmpty ? summary : 'No summary available'),
              return Card(
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            child: Image(
                                height: 100,
                                image: NetworkImage(image.isNotEmpty
                                    ? image
                                    : Icon(Icons.person))),
                          ),
                          Text(username),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(headline),
                    SizedBox(height: 10),
                    Text(summary.isNotEmpty ? summary : 'No summary available'),
                  ],
                ),
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          userController.searchPeople(
            'https://www.linkedin.com/search/results/people/?currentCompany=%5B%221035%22%5D&geoUrn=%5B%22103644278%22%5D&keywords=max&origin=FACETED_SEARCH&sid=%3AB5',
          );
        },
        child: Icon(Icons.search),
      ),
    );
  }
}
