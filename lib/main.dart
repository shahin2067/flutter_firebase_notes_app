import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_note_app/firebase_options.dart';
import 'package:flutter_firebase_note_app/presentation/auth/sign_in_screen.dart';
import 'package:flutter_firebase_note_app/presentation/auth/sign_up_screen.dart';
import 'package:flutter_firebase_note_app/presentation/screens/home_screen.dart';
import 'package:flutter_firebase_note_app/presentation/splash_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
