import 'package:handling_apis/data/model/user.dart';

abstract class UserState {}

class UserInitialState extends UserState {}

class GetAllUsers extends UserState {
  // final UserRepo userRepo;
  final List<User> allUsersLists;

  GetAllUsers({required this.allUsersLists});
}

class GetUser extends UserState {
  final User user;

  GetUser({required this.user});
}

class PostNewUser extends UserState {
  final User newUser;

  PostNewUser({required this.newUser});
}

class DeleteUser extends UserState {
  final dynamic deleteUser;

  DeleteUser({required this.deleteUser});
}
