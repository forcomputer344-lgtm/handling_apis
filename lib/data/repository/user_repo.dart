import 'package:handling_apis/data/model/user.dart';
import 'package:handling_apis/data/web_services/web_services.dart';

class UserRepo {
  final WebServices webServices;

  UserRepo({required this.webServices});

  Future<List<User>> getAllUsers() async {
    var response = await webServices.getAllUsers();
    return response;
  }

  Future<User> getUserById(int id) async {
    var response = await webServices.getUserById(id);
    return response;
  }

  Future<User> createNewUser(User newuser) async {
    var response = await webServices.createNewUser(
      newuser,
      // "	874bd5a37888d879cb0c70f4d9ed0b9ddb5b07bf253d93ab02d40a6240840790",
      "Bearer demo-token",
      "application/json",
    );
    return response;
  }

  Future<dynamic> deleteUser(int id) async {
    return await webServices.deleteUser(id, "Bearer demo-token");
  }
}
