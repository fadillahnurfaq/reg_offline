import 'package:register_offline/utils/dio_service/dio_service_response.dart';

class LoginResponseModel with DioServiceResponse<LoginResponseModel> {
  final String token;

  const LoginResponseModel({
    this.token = "",
  });

  @override
  LoginResponseModel fromResponseMap(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json["token"] ?? "",
    );
  }
}