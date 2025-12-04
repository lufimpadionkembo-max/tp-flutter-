import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'login.dart';
import '../constants/app_colors.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // 1. Firebase charge l'état de l'utilisateur
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
          );
        }

        // 2. Gérer les erreurs
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text(
                'Erreur: ${snapshot.error}',
                style: const TextStyle(color: AppColors.error),
              ),
            ),
          );
        }

        // 3. Utilisateur connecté
        if (snapshot.hasData && snapshot.data != null) {
          return const HomePage();
        }

        // 4. Utilisateur non connecté
        return const LoginPage();
      },
    );
  }
}
