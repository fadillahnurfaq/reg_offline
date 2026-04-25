import 'package:dartz/dartz.dart';
import 'package:register_offline/models/auth/get_user_parameter.dart';
import 'package:register_offline/models/auth/user_model.dart';
import '../models/api_exception.dart';
import '../models/auth/login_parameter.dart';
import '../models/auth/login_response_model.dart';
import '../models/auth/register_parameter.dart';
import '../utils/dio_service/http_service.dart';

class AuthService {
  final HttpService httpService;

  AuthService({required this.httpService});

  Future<Either<ApiException, LoginResponseModel>> login({required final LoginParameter parameter}) async{
    return httpService.request(request: parameter, fromResponseMap: const LoginResponseModel().fromResponseMap);
  }

  Future<Either<ApiException, dynamic>> register({required final RegisterParameter parameter}) async{
    return httpService.request(request: parameter);
  }

  Future<Either<ApiException, UserModel>> getUser({required final GetUserParameter parameter}) async{
    return httpService.request(request: parameter, fromResponseMap: const UserModel().fromResponseMap);
  }
}