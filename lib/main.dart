import 'package:chat_bot/feature/splash/presentation/splash_view.dart';
import 'package:flutter/material.dart';

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

