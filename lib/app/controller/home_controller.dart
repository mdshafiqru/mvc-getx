import 'dart:async';

import 'package:get/get.dart';

class HomeController extends GetxController {
  var counter = 0.obs;

  var count = 60.obs;

  incretent() {
    counter++;
  }

  @override
  void onInit() {
    const oneSec = Duration(seconds: 1);
    if (count.value != 0) {
      Timer.periodic(oneSec, (Timer t) => count--);
    }

    super.onInit();
  }
}
