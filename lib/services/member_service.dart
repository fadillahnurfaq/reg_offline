import 'package:dartz/dartz.dart';
import 'package:register_offline/models/member/create_member_parameter.dart';
import '../models/api_exception.dart';
import '../utils/dio_service/http_service.dart';

class MemberService {
  final HttpService httpService;

  MemberService({required this.httpService});

  Future<Either<ApiException, void>> create({required final CreateMemberParameter parameter}) async{
    return httpService.request(request: parameter);
  }
}