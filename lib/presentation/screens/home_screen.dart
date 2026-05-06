import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handling_apis/business_logic/cubit/user_cubit.dart';

import 'package:handling_apis/business_logic/cubit/user_state.dart';
import 'package:handling_apis/data/model/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> usersList = [];
  User user = User();

  @override
  void initState() {
    super.initState();
    // BlocProvider.of<UserCubit>(context).emaitAllUsers();
    BlocProvider.of<UserCubit>(context).emaitUser(8459541);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                if (state is GetAllUsers) {
                  usersList = (state).allUsersLists;
                  return Column(
                    children: [
                      Text(
                        "Get All Users",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(8),
                        itemCount: usersList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 50,
                            color: Colors.amber,
                            child: Center(
                              child: Text(usersList[index].name.toString()),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                } else if (state is GetUser) {
                  user = (state).user;
                  return Column(
                    children: [
                      Container(
                        child: Text(
                          "Get User",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                      SizedBox(height: 20),

                      Container(
                        height: 50,
                        color: Colors.amber,
                        child: Center(child: Text(user.name.toString())),
                      ),
                    ],
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
