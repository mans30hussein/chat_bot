import 'package:chat_bot/core/service_locator/service_locator.dart';
import 'package:chat_bot/core/utils/bloc_observer.dart';
import 'package:chat_bot/feature/splash/presentation/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//  await setupServiceLocator();
//  Bloc.observer = AppBlocObserver();
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),

      home: const SplashScreen(

      ),
    );
  }
}

