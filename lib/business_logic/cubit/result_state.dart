// import 'package:handling_apis/data/model/user.dart';

// abstract class UserState {}

// class UserInitialState extends UserState {}

// class GetAllUsers extends UserState {
//   // final UserRepo userRepo;
//   final List<User> allUsersLists;

//   GetAllUsers({required this.allUsersLists});
// }

// class GetUser extends UserState {
//   final User user;

//   GetUser({required this.user});
// }

// class PostNewUser extends UserState {
//   final User newUser;

//   PostNewUser({required this.newUser});
// }

// class DeleteUser extends UserState {
//   final dynamic deleteUser;

//   DeleteUser({required this.deleteUser});
// }

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:handling_apis/core/networking/network_exceptions.dart';

part 'result_state.freezed.dart';

@freezed
class ResultState<T> with _$ResultState<T> {
  const factory ResultState.idle() = Idle<T>;

  const factory ResultState.loading() = Loading<T>;

  const factory ResultState.success(T data) = Success<T>;

  const factory ResultState.error(NetworkExceptions networkExceptions) =
      Error<T>;
}
