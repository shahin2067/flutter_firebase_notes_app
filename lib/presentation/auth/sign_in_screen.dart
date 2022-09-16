import 'package:flutter/material.dart';
import 'package:flutter_firebase_note_app/application/auth/auth_provider.dart';
import 'package:flutter_firebase_note_app/application/auth/auth_state.dart';
import 'package:flutter_firebase_note_app/presentation/screens/home_screen.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInScreen extends HookConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    ref.listen<AuthState>(authProvider, (previous, next) {
      if (previous?.loading != next.loading && !next.loading) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    });

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 100),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                filled: true,
                fillColor: const Color(0xFFF6F6F6),
                hintText: 'Email',
                border: OutlineInputBorder(
                  //borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock_outline),
                filled: true,
                fillColor: const Color(0xFFF6F6F6),
                hintText: 'Password',
                border: OutlineInputBorder(
                  //borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ref.read(authProvider.notifier).signIn(
                      email: emailController.text,
                      password: passwordController.text);
                },
                style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(24.0)))),
                child: const Text('Sign In'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
