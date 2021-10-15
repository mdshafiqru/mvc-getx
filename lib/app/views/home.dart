// ignore_for_file: prefer_const_constructors

import 'package:app1/app/controller/home_controller.dart';
import 'package:app1/app/data/constant/app_string.dart';
import 'package:app1/app/views/details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.HOME),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                'You have clicked this many times',
                style: TextStyle(fontSize: 20),
              ),
              Obx(
                () => Text(
                  '${homeController.counter.value}',
                  style: const TextStyle(fontSize: 40),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.to(DetailsPage());
                },
                child: Text('Go to details page'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => homeController.incretent(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
