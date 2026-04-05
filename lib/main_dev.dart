import 'package:chat_bot/config/app_config.dart';
import 'package:chat_bot/core/network/api_constant.dart';
import 'package:chat_bot/run_chat_app.dart';

void main(){
  AppConfig appConfig = AppConfig(apiBaseUrl: ApiConstants.baseUrl , environment: AppEnvironment.dev);
  runChatApp(appConfig: appConfig);
}
// 2:30 hours