import 'package:flutter/material.dart';
import 'package:flutter_firebase_note_app/application/auth/auth_provider.dart';
import 'package:flutter_firebase_note_app/application/auth/auth_state.dart';
import 'package:flutter_firebase_note_app/domain/auth/user_data_model.dart';
import 'package:flutter_firebase_note_app/presentation/auth/sign_in_screen.dart';
import 'package:flutter_firebase_note_app/presentation/auth/sign_up_screen.dart';
import 'package:flutter_firebase_note_app/presentation/screens/home_screen.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    useEffect(() {
      Future.delayed(const Duration(milliseconds: 100), () {
        ref.read(authProvider.notifier).tryLogin();
      });

      return null;
    }, []);
    ref.listen<AuthState>(authProvider, (previous, next) {
      if (previous != next && next.loading == false) {
        if (next.userData != UserData.init()) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SignUpScreen()));
        }
      }
    });
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
