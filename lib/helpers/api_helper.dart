import 'dart:async';
import 'package:digital_edge_task/services/user_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import '../models/api_response.dart';

abstract class ApiHelper {
  static const String HOST = "testapi.alifouad91.com";
  static const String SCHEME = "http";

  static Future<ApiResponse> apiRequest(
      {String? path,
      Map<String, dynamic>? query,
      bool hasToken = true,
      String method = "POST",
      }) async {
    UserService service = g.Get.find();
    try {
      Dio dio = Dio(
        BaseOptions(
          method: method,
          baseUrl: "$SCHEME://$HOST",
          headers: {
            "Accept": "application/json",
            if (hasToken) "Authorization": "Bearer ${service.token}",
          },
        ),
      );
      if (path != null) {
        path = "/api/$path";
      }
      late Response response;
      if (method == "DELETE") {
        response = await dio.delete(path!,
            data: (query != null ? FormData.fromMap(query) : null));
      } else {
        response = await dio.request(path ?? "",
            data: method != "GET"
                ? (query != null ? FormData.fromMap(query) : null)
                : query);
      }
      if (response.statusCode == 200  || response.statusCode == 201  && response.data["success"] == true) {
        return ApiResponse(
          data: response.data["data"],
          message: response.data["message"],
        );
      }
      return ApiResponse(
        data: response.data["data"],
        message: response.data["message"],
        success: false,
      );
    }
    on DioException catch (e) {
      return ApiResponse(
        success: false,
        message: e.response?.data["message"] ?? e.message,
      );
    }

    on TimeoutException {
      return ApiResponse(
        success: false,
        message: "please check your connection!!",
      );
    } catch (e) {
      return ApiResponse(
        success: false,
        message: e.toString(),
      );
    }
  }
}
