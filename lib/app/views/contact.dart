// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app1/app/controller/user_controller.dart';
import 'package:app1/app/data/constant/app_string.dart';
import 'package:app1/app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactList extends StatelessWidget {
  ContactList({Key? key}) : super(key: key);

  final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Contact list'),
        ),
        body: SafeArea(
          child: Center(
            child: Obx(
              () => userController.userList.isNotEmpty
                  ? ListView.builder(
                      itemCount: userController.userList.length,
                      itemBuilder: (BuildContext context, int index) {
                        User user = userController.userList[index];
                        return Card(
                          child: Row(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue,
                                    image: DecorationImage(
                                        image: NetworkImage('${user.image}'),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${user.firstName} ${user.lastName}',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  SizedBox(height: 2),
                                  Text('${user.id}'),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          ),
        ));
  }
}
