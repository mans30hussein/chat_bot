import 'package:chat_bot/feature/chat/data/gemenai_chat_repo/gemenai_chat%20repo_impl.dart';
import 'package:chat_bot/feature/chat/data/gemini_chat_service/gemini_chat_service.dart';
import 'package:chat_bot/feature/chat/domain/chat_repo/chat_repo.dart';
import 'package:chat_bot/feature/chat/presentation/manager/chat_message_cubit.dart';
import 'package:get_it/get_it.dart';

import '../network/api_client.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  /// Dio
  final apiClient = await ApiClient.create();

  getIt.registerLazySingleton(() => apiClient);

  /// Chat Api Service
  getIt.registerLazySingleton<ChatApiService>(() => ChatApiService(getIt()));
  
  getIt.registerLazySingleton<ChatRepo>(
    () => GemenaiChatRepoImpl(chatApiService: getIt<ChatApiService>()),
  );

  /// Chat Cubit
  getIt.registerFactory<SendMessageCubit>(() => SendMessageCubit(chatRepo: getIt<ChatRepo>()));
}
