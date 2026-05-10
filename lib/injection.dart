import 'package:get_it/get_it.dart';
import 'package:handling_apis/business_logic/cubit/result_cubit.dart';
import 'package:handling_apis/data/repository/user_repo.dart';
import 'package:handling_apis/data/web_services/web_services.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<WebServices>(
    () => WebServices(createAndSetupDio()),
  );
  getIt.registerLazySingleton<UserRepo>(() => UserRepo(webServices: getIt()));
  getIt.registerLazySingleton<MyCubit>(() => MyCubit(getIt()));
}
