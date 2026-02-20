import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'parse_error_logger_compat.dart';
import '../response/login_response.dart';

part 'login_service.g.dart';

const String baseUrl =
    "https://api.mockfly.dev/mocks/fa9ee373-2c95-4fe6-9bb9-e18e4bf541ec";

@RestApi(baseUrl: baseUrl)
abstract class LoginService {
  factory LoginService(Dio dio, {String baseUrl}) = _LoginService;

  @POST("/customers/login")
  Future<HttpResponse<LoginResponse>> login(
      @Field("email") String email, @Field("password") String password);
}
