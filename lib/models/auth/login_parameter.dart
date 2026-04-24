import 'package:register_offline/utils/dio_service/dio_service_request.dart';

class LoginParameter with DioServiceRequest {
  final String email;
  final String password;

  LoginParameter({
    this.email = "",
    this.password = "",
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }
  
  @override
  DioMethod get dioMethod => DioMethod.POST;
  
  @override
  String get path => "/login";
}