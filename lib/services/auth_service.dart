import 'package:dartz/dartz.dart';
import '../models/api_exception.dart';
import '../models/auth/register_parameter.dart';
import '../utils/dio_service/http_service.dart';

class AuthService {
  final HttpService httpService;

  AuthService({required this.httpService});


  Future<Either<ApiException, dynamic>> register({required final RegisterParameter parameter}) async{
    return httpService.request(request: parameter);
  }
}