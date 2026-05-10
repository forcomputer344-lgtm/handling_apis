import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handling_apis/business_logic/cubit/result_state.dart';
import 'package:handling_apis/core/error/api_result.dart';
import 'package:handling_apis/core/networking/network_exceptions.dart';
import 'package:handling_apis/data/model/user.dart';
import 'package:handling_apis/data/repository/user_repo.dart';


// class MyCubit extends Cubit<ResultState<User>>{
// we changed the type for emitGetUserDetails and emitCreateNewUser

class MyCubit extends Cubit<ResultState<dynamic>>{
// emitDeleteUser


// class MyCubit extends Cubit<ResultState<List<User>>> {

  final UserRepo userRepo;
  MyCubit(this.userRepo) : super(const Idle());

  void emitGetAllUsers() async {
    var result = await userRepo.getAllUsers();

    result.when(
      success: (List<User> allUsers) {
        emit(ResultState.success(allUsers));
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(ResultState.error(networkExceptions));
      },
    );
  }

  // void emitGetUserDetails(int userId) async {
  //   var result = await userRepo.getUserById(userId);
  //   result.when(
  //     success: (User userData) {
  //       emit(ResultState.success(userData));
  //     },
  //     failure: (NetworkExceptions networkExceptions) {
  //       emit(ResultState.error(networkExceptions));
  //     },
  //   );
  // }

  // void emitCreateNewUser(User newUser) async {
  //   var result = await userRepo.createNewUser(newUser);

  //   result.when(
  //     success: (User userData) {
  //       emit(ResultState.success(userData));
  //     },
  //     failure: (NetworkExceptions networkExceptions) {
  //       emit(ResultState.error(networkExceptions));
  //     },
  //   );
  // }

  void emitDeleteUser(int deleteUser) async {
    print("===========================Works here emitDeleteUser");
    var result = await userRepo.deleteUser(deleteUser);

    result.when(
      success: (dynamic userData) {
        emit(ResultState.success(userData));
        print("================Works here emitDeleteUser when");
      },
      failure: (NetworkExceptions networkExceptions) {
        emit(ResultState.error(networkExceptions));
      },
    );
  }
}
