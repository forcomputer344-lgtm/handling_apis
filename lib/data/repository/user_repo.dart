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
}
