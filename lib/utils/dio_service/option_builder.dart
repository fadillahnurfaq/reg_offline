import 'package:dio/dio.dart';

class OptionsBuilder extends Options {
  String? baseUrl;

  OptionsBuilder({
    this.baseUrl,
    super.method,
    super.sendTimeout,
    super.receiveTimeout,
    super.extra,
    super.headers,
    super.responseType,
    super.contentType,
    super.validateStatus,
    super.receiveDataWhenStatusError,
    super.followRedirects,
    super.maxRedirects,
    super.requestEncoder,
    super.responseDecoder,
    super.listFormat,
   });

  factory OptionsBuilder.multipartData({String? baseUrl}) {
    return OptionsBuilder().withMultipartData(baseUrl: baseUrl);
  }

  factory OptionsBuilder.withBaseUrl(String? baseUrl) {
    return OptionsBuilder().withBaseUrl(baseUrl);
  }

  OptionsBuilder withMultipartData({String? baseUrl}) {
    method = "multipart/form-data";
    if(baseUrl != null) {
      this.baseUrl = baseUrl;
    }
    return this;
  }

  OptionsBuilder withBaseUrl(String? baseUrl) {
    this.baseUrl = baseUrl;
    return this;
  }
}