import 'package:chat_bot/config/app_config.dart';
import 'package:chat_bot/core/service_locator/service_locator.dart';
import 'package:chat_bot/core/utils/bloc_observer.dart';
import 'package:chat_bot/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void runChatApp({ required AppConfig appConfig}) async{
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerLazySingleton(() => appConfig);
 await setupServiceLocator(); 
 Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}