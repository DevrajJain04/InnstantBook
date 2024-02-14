// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:innstantbook/utilities/navbar.dart';
import 'package:innstantbook/views/login_view.dart';
import 'package:innstantbook/constants/routes.dart';
import 'package:innstantbook/views/explore.dart';
import 'package:innstantbook/views/payment_wall.dart';
import 'package:innstantbook/views/profile_page.dart';
import 'package:innstantbook/views/register_view.dart';
import 'package:innstantbook/views/search_page.dart';
import 'package:innstantbook/views/splash_screen.dart';
// import 'package:innstantbook/views/splash_screen.dart';
import 'package:innstantbook/views/verifyemail_view.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // AwesomeNotifications().initialize(null, [
  //   NotificationChannel(
  //     channelKey: 'key1',
  //     channelName: 'InnstantBook',
  //     channelDescription: 'Booking Notification',
  //     defaultColor: Colors.purple[200],
  //   playSound: true)
  // ]);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const HomePage(),
      routes: {
        homePage: (context) => const HomePage(),
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        mainRoute: (context) => const ExplorePage(),
        verifyEmailRoute: (context) => const VerifyEmailView(),
        profilePage: (context) => ProfilePageView(),
        navbar: (context) => const NavBar(),
        booking: (context) => const PaymentWall(),
        searchpage: (context) => const SearchPage(),
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
                  return const NavBar();
                } else {
                  return const VerifyEmailView();
                }
              } else {
                return const LoginView();
              }
            default:
              return const SplashScreen();
          }
        });
  }
}
