import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handling_apis/business_logic/cubit/user_state.dart';
import 'package:handling_apis/data/model/user.dart';
import 'package:handling_apis/data/repository/user_repo.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepo userRepo;
  UserCubit({required this.userRepo}) : super(UserInitialState());

  void emaitAllUsers() {
    userRepo.getAllUsers().then((userList) {
      emit(GetAllUsers(allUsersLists: userList));
    });
  }

  void emaitUser(int id) {
    userRepo.getUserById(id).then((user) {
      emit(GetUser(user: user));
    });
  }

  void emitCreateNewUser(User newuser) {
    userRepo.createNewUser(newuser).then((newuser) {
      emit(PostNewUser(newUser: newuser));
    });
  }

  void emitDeleteUser(dynamic deleteUser) {
    userRepo.deleteUser(deleteUser).then((deleteUser) {
      emit(DeleteUser(deleteUser: deleteUser));
    });
  }
}
