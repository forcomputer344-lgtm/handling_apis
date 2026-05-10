import 'package:handling_apis/core/error/api_result.dart';
import 'package:handling_apis/core/networking/network_exceptions.dart';
import 'package:handling_apis/data/model/user.dart';
import 'package:handling_apis/data/web_services/web_services.dart';

class UserRepo {
  final WebServices webServices;

  UserRepo({required this.webServices});

  Future<ApiResult<List<User>>> getAllUsers() async {
    try {
      var response = await webServices.getAllUsers();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<User>> getUserById(int id) async {
    try {
      var response = await webServices.getUserById(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<User>> createNewUser(User newUser) async {
    try {
      var response = await webServices.createNewUser(
        newUser,
        'Bearer demo-token',
        "application/json",
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<dynamic>> deleteUser(int id) async {
    try {
      final response = await webServices.deleteUser(id, "Bearer demo-token");

      print("STATUS CODE: ${response.response.statusCode}");

      // return ApiResult.success("Delete it successfully");
      return ApiResult.success(response);
    } catch (error) {
      print("ERROR: $error");

      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
