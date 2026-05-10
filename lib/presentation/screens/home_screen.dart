import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handling_apis/business_logic/cubit/result_cubit.dart';

import 'package:handling_apis/business_logic/cubit/result_state.dart';
import 'package:handling_apis/core/networking/network_exceptions.dart';
import 'package:handling_apis/data/model/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> usersList = [];
  User user = User();
  dynamic deleteUser = 0;

  @override
  void initState() {
    super.initState();

    // BlocProvider.of<MyCubit>(context).emitCreateNewUser(
    //   User(
    //     id: 771,
    //     name: "Yossef Ahmed",
    //     email: "yossef_ahmed@stoltenberg.test",
    //     gender: "male",
    //     status: "active",
    //   ),
    // );

    BlocProvider.of<MyCubit>(context).emitDeleteUser(1005);
    // BlocProvider.of<MyCubit>(context).emitGetUserDetails(0);
    BlocProvider.of<MyCubit>(context).emitGetAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // frezzed
            // BlocBuilder<MyCubit, ResultState<List<User>>>(
            //   builder: (context, ResultState<List<User>> state) {
            //     return state.when(
            //       idle: () {
            //         return const Center(child: CircularProgressIndicator());
            //       },
            //       loading: () {
            //         return const Center(child: CircularProgressIndicator());
            //       },
            //       success: (List<User> userData) {
            //         return Column(
            //           children: [
            //             Text(
            //               "Get All Users",
            //               style: TextStyle(fontSize: 18, color: Colors.black),
            //             ),
            //             ListView.builder(
            //               shrinkWrap: true,
            //               padding: const EdgeInsets.all(8),
            //               itemCount: userData.length,
            //               itemBuilder: (BuildContext context, int index) {
            //                 return Container(
            //                   height: 50,
            //                   color: Colors.amber,
            //                   child: Center(
            //                     child: Text(userData[index].name.toString()),
            //                   ),
            //                 );
            //               },
            //             ),
            //           ],
            //         );
            //       },
            //       error: (NetworkExceptions error) {
            //         return Center(
            //           child: Text(
            //             NetworkExceptions.getErrorMessage(error),
            //             style: TextStyle(color: Colors.red, fontSize: 18),
            //           ),
            //         );
            //       },
            //     );
            //   },
            // ),

            // BlocBuilder<MyCubit, ResultState<User>>(
            //   builder: (context, ResultState<User> state) {
            //     return state.when(
            //       idle: () {
            //         return const Center(child: CircularProgressIndicator());
            //       },
            //       loading: () {
            //         return const Center(child: CircularProgressIndicator());
            //       },
            //       success: (User userData) {
            //         return Container(
            //           height: 50,
            //           color: Colors.red,
            //           child: Center(
            //             child: Text(
            //               userData.email.toString(),
            //               style: const TextStyle(color: Colors.white),
            //             ),
            //           ),
            //         );
            //       },
            //       error: (NetworkExceptions error) {
            //         return Center(
            //           child: Text(
            //             NetworkExceptions.getErrorMessage(error),
            //             style: TextStyle(color: Colors.red, fontSize: 18),
            //           ),
            //         );
            //       },
            //     );
            //   },
            // ),

            BlocBuilder<MyCubit, ResultState<dynamic>>(
              builder: (context, ResultState<dynamic> state) {
                return state.when(
                  idle: () {
                    return const Center(child: CircularProgressIndicator());
                  },
                  loading: () {
                    return const Center(child: CircularProgressIndicator());
                  },
                  success: (dynamic userData) {
                    print(state);
                    print(userData);
                    return Container(
                      height: 50,
                      color: Colors.red,
                      child: Center(
                        child: Text(
                          userData.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                  error: (NetworkExceptions error) {
                    return Center(
                      child: Text(
                        NetworkExceptions.getErrorMessage(error),
                        style: TextStyle(color: Colors.red, fontSize: 18),
                      ),
                    );
                  },
                );
              },
            ),
            // BlocBuilder<MyCubit, ResultState<User>>(
            //   builder: (context, ResultState<User> state) {
            //     return state.when(
            //       idle: () {
            //         return const Center(child: CircularProgressIndicator());
            //       },
            //       loading: () {
            //         return const Center(child: CircularProgressIndicator());
            //       },
            //       success: (User userData) {
            //         return Column(
            //           children: [
            //             Text(
            //               "Get User",
            //               style: TextStyle(fontSize: 18, color: Colors.black),
            //             ),
            //             SizedBox(height: 20),

            //             Container(
            //               height: 50,
            //               color: Colors.amber,
            //               child: Center(child: Text(userData.name.toString())),
            //             ),
            //           ],
            //         );
            //       },
            //       error: (NetworkExceptions error) {
            //         return Center(
            //           child: Text(
            //             NetworkExceptions.getErrorMessage(error),
            //             style: TextStyle(color: Colors.red, fontSize: 18),
            //           ),
            //         );
            //       },
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
