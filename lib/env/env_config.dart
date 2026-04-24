class EnvConfig {
  EnvConfig._();
  
  static final _envConfig = EnvConfig._();
  
  static EnvConfig get instance => _envConfig;
  String get baseUrl => "https://api-test.partaiperindo.com";
  String get api => "$baseUrl/api/v1";
}