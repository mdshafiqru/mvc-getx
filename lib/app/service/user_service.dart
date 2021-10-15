import 'dart:convert';

import 'package:app1/app/data/constant/api_string.dart';
import 'package:app1/app/data/constant/app_string.dart';
import 'package:app1/app/models/api_response.dart';
import 'package:app1/app/models/user_model.dart';
import 'package:http/http.dart' as http;

Future<ApiResponse> getUserDetails() async {
  ApiResponse apiResponse = ApiResponse();

  try {
    var url = Uri.parse(ApiString.USER_API);

    var header = {
      "app-id": "611e7827a584d453446ae574",
    };

    final response = await http.get(url, headers: header);
    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body)['data']
            .map((p) => User.fromJson(p))
            .toList();
        apiResponse.data as List<dynamic>;
        break;

      case 403:
        apiResponse.error = AppString.FORBIDDEN;
        break;

      default:
        apiResponse.error = AppString.SOMETING_WENT_WORNG;
        break;
    }
  } catch (e) {
    // apiResponse.error = AppString.SERVER_ERROR;
  }

  return apiResponse;
}
