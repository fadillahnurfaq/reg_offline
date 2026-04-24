import '../utils/model_parser.dart';

class ResponseModel<T> {
  final String status;
  final int? code;
  final String message;
  final T data;

  ResponseModel({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  

  factory ResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic data) fromJsonT,
  ) {
    dynamic getValue(List<String> keys) {
      for (final key in keys) {
        if (json.containsKey(key)) return json[key];
      }
      return null;
    }
    final statusRaw = getValue(['status', 'Status']) ?? '';
    final dataRaw = getValue(['data', 'Data', 'datas', 'Datas']);
    final codeRaw = getValue(['code', 'Statuscode', 'StatusCode', 'statuscode', 'status_code']);
    final messageRaw = getValue(['message', 'Message', 'error']) ?? "";
    final status = statusRaw is String ? statusRaw : (ModelParser.boolFromJson(statusRaw) ?? false).toString();

    return ResponseModel<T>(
      status: status,
      code: ModelParser.intFromJson(codeRaw),
      message: messageRaw,
      data: fromJsonT(dataRaw),
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJsonT) => {
        'status': status,
        'code': code,
        'message': message,
        'data': toJsonT(data),
      };
}