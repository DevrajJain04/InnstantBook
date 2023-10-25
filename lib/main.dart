import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:innstantbook/views/login_view.dart';
import 'package:innstantbook/constants/routes.dart';
import 'package:innstantbook/views/hotels_view.dart';
import 'package:innstantbook/views/profile_page.dart';
import 'package:innstantbook/views/register_view.dart';
import 'package:innstantbook/views/verifyemail_view.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 22, 9, 206)),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        homePage: (context) => const HomePage(),
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        mainRoute: (context) => const HotelView(),
        verifyEmailRoute: (context) => const VerifyEmailView(),
        profilePage: (context) => ProfilePageView(),
        navbar:(context) => const NavBar()
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = FirebaseAuth.instance.currentUser;
              if (user != null) {
                if (user.emailVerified) {
                  return const HotelView();
                } else {
                  return const VerifyEmailView();
                }
              } else {
                return const LoginView();
              }
            default:
              return const SizedBox(
                  height: 1, width: 1, child: CircularProgressIndicator());
          }
        });
  }
}