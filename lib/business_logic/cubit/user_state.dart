import 'package:handling_apis/data/model/user.dart';

abstract class UserState {}

class UserInitialState extends UserState {}

class GetAllUsers extends UserState {
  // final UserRepo userRepo;
  final List<User> allUsersLists;

  GetAllUsers({required this.allUsersLists});
}

class GetUser extends UserState {
  // final UserRepo userRepo;
  final User user;

  GetUser({required this.user});
}
