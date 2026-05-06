import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:handling_apis/business_logic/cubit/user_cubit.dart';
import 'package:handling_apis/injection.dart';
import 'package:handling_apis/presentation/screens/home_screen.dart';

void main() {
  GetIt.instance.debugEventsEnabled = true;
  initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider<UserCubit>(
        create: (BuildContext context) => getIt<UserCubit>(),
        child: HomeScreen(),
      ),
    );
  }
}
