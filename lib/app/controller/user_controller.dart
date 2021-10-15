import 'package:app1/app/service/user_service.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var userList = [].obs;

  getUsers() async {
    var response = await getUserList();

    for (var item in response) {
      userList.add(item);
    }
  }

  @override
  void onInit() {
    getUsers();
    super.onInit();
  }
}
