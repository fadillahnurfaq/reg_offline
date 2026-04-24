import 'package:register_offline/utils/dio_service/dio_service_request.dart';

class RegisterParameter with DioServiceRequest {
  final String email;
  final String password;
  final String fullName;
  final String phone;

  RegisterParameter({
    this.email = "",
    this.password = "",
    this.fullName = "",
    this.phone = "",
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "full_name": fullName,
      "phone": phone,
    };
  }
  
  @override
  DioMethod get dioMethod => DioMethod.POST;
  
  @override
  String get path => "/register";
}