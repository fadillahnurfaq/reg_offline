import 'package:register_offline/utils/dio_service/dio_service_request.dart';

class GetUserParameter with DioServiceRequest {
  @override
  DioMethod get dioMethod => DioMethod.GET;

  @override
  String get path => "/profile";
}