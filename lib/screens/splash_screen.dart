import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes/constant/routes.dart';
import 'package:quotes/helper/api_helper.dart';
import 'package:quotes/model/quote.dart';
import 'package:quotes/provider/quote_provider.dart';
import 'package:quotes/utils/database.dart';
import 'package:quotes/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;
  @override
  void initState() {
    super.initState();
    isFirst();
  }

  void isFirst() async{
    bool isFirst = prefGetBool('first');
    if (isFirst) {
      Future.delayed(const Duration(seconds: 3)).then((value) {
        Navigator.pushReplacementNamed(context, homeScreen);
      });
    } else {
      Future.delayed(const Duration(seconds: 3)).then((value) async {
        for (int i = 0; i < 10; i++) {
          List<Quote> quotes = await ApiHelper.apiHelper.fetchQuotes();
          insertQuotes(quotes);
        }
        await fetchData().then((value) {
          prefSetBool('first', true);
          Navigator.pushReplacementNamed(context, homeScreen);
        });
      });
    }
    Provider.of<QuoteProvider>(context,listen: false).quotes = await fetchData();
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Image(image: AssetImage('assets/img/splash.png')),
            Spacer(),
            Text('Made by Prince Dobariya'),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
