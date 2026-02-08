import 'package:chat_bot/feature/chat/data/gemenai_chat_service/gemenai_chat_service.dart';
import 'package:chat_bot/feature/chat/presentation/manager/chat_message_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import '../network/api_service.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  /// Dio
  getIt.registerLazySingleton<Dio>(
    () => ApiService.createDio(),
  );

  /// Chat Api Service
  getIt.registerLazySingleton<ChatApiService>(
    () => ChatApiService(getIt<Dio>()),
  );

  /// Chat Cubit
  getIt.registerFactory<ChatCubit>(
    () => ChatCubit(apiService: getIt<ChatApiService>()),
  );
}
