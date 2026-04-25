import 'package:register_offline/utils/dio_service/dio_service_request.dart';

class GetMemberParameter with DioServiceRequest {
  @override
  DioMethod get dioMethod => DioMethod.GET;

  @override
  String get path => "/member";
}