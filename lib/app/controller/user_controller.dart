import 'package:app1/app/models/api_response.dart';
import 'package:app1/app/models/user_model.dart';
import 'package:app1/app/service/user_service.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var userList = [].obs;

  getUser() async {
    ApiResponse response = await getUserDetails();
    List users = [];
    if (response.error == null) {
      users = response.data as List<dynamic>;
      for (var item in users) {
        userList.add(item);
      }
    }
  }

  @override
  void onInit() {
    getUser();
    super.onInit();
  }
}
