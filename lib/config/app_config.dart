enum AppEnvironment {dev, staging, prod}
class AppConfig {
  final AppEnvironment environment;
  final String apiBaseUrl;

  AppConfig({required this.environment, required this.apiBaseUrl});
  
}