import 'package:dartz/dartz.dart';
import 'package:register_offline/models/member/create_member_parameter.dart';
import 'package:register_offline/models/member/member_model.dart';
import '../models/api_exception.dart';
import '../models/member/get_member_parameter.dart';
import '../utils/dio_service/http_service.dart';

class MemberService {
  final HttpService httpService;

  MemberService({required this.httpService});

  Future<Either<ApiException, void>> create({required final CreateMemberParameter parameter}) async{
    return httpService.request(request: parameter);
  }

  Future<Either<ApiException, List<MemberModel>>> getList({required final GetMemberParameter parameter}) async{
    return httpService.request(request: parameter, fromResponseList: MemberModel().fromResponseList);
  }
}