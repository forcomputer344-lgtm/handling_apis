import 'package:dio/dio.dart';
import 'package:handling_apis/data/model/user.dart';
import 'package:retrofit/retrofit.dart';

part 'web_services.g.dart';

// @RestApi(baseUrl: 'https://gorest.co.in/public/v2/') // we changed it cuz didnt work on Post & Delete
@RestApi(baseUrl: 'https://gorest.in/public/v2/')
abstract class WebServices {
  factory WebServices(Dio dio, {String? baseUrl}) = _WebServices;

  @GET('/users')
  Future<List<User>> getAllUsers();

  @GET('/users/{id}')
  Future<User> getUserById(@Path("id") int id);
  // @Path when it eptmies will use the parameter, so make sure the parameter name must be like it wrote by backend

  @POST("users")
  Future<User> createNewUser(
    @Body() User newuser,
    @Header('Authorization') String token,
    @Header('Content-Type') String contentType,
  );

  @DELETE('/users/{id}')
  Future<dynamic> deleteUser(
    @Path() int id,
    @Header('Authorization') String token,
  );
}

Dio createAndSetupDio() {
  Dio dio = Dio();

  dio
    ..options.connectTimeout = Duration(seconds: 20)
    ..options.receiveTimeout = Duration(seconds: 20);

  dio.interceptors.add(
    LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: false,
      responseHeader: false,
      request: true,
      requestBody: true,
    ),
  );

  return dio;
}
