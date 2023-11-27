import 'package:flutter/material.dart';
import 'package:quotes/constant/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value){

      // api logic here

      Navigator.pushReplacementNamed(context, homeScreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Text('Loading'),
            Spacer(),
            Text('made with Prince Dobariya'),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
