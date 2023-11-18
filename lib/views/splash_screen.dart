import 'package:flutter/material.dart';
import 'package:innstantbook/constants/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    _splash();
  }

  _splash() async {
    await Future.delayed(const Duration(milliseconds: 1500),(){});
    Navigator.pushReplacementNamed(context, loginRoute);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight:Radius.circular(15),bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15) ),
          image: DecorationImage(
            image: AssetImage('assets/Images/logo.png'),
            fit: BoxFit.cover
          )
        ),
      ),
    );
  }
}