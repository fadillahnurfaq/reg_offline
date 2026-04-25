import 'package:register_offline/utils/dio_service/dio_service_response.dart';

class UserModel with DioServiceResponse<UserModel> {
  final String id;
  final String fullName;
  final String email;

  const UserModel({
    this.id = "",
    this.fullName = "",
    this.email = "",
  });

  @override
  UserModel fromResponseMap(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? "",
      fullName: json['full_name'] ?? "",
      email: json['email'] ?? "",
    );
  }
}