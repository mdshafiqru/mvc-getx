import 'package:app1/app/controller/user_controller.dart';
import 'package:app1/app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactPage extends StatelessWidget {
  ContactPage({Key? key}) : super(key: key);
  final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Obx(
            () => userController.userList.isNotEmpty
                ? ListView.builder(
                    itemCount: userController.userList.length,
                    itemBuilder: (BuildContext context, int index) {
                      User userData = userController.userList[index];
                      return Card(
                        child: ListTile(
                          leading: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage('${userData.picture}'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          title: Text(
                              '${userData.firstName} ${userData.lastName}'),
                          subtitle: Text('${userData.id}'),
                        ),
                      );
                    },
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ),
      ),
    );
  }
}
