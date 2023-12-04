import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes/constant/routes.dart';
import 'package:quotes/helper/api_helper.dart';
import 'package:quotes/model/quote.dart';
import 'package:quotes/provider/quote_provider.dart';
import 'package:quotes/provider/theme_provider.dart';
import 'package:quotes/screens/edit_screen.dart';
import 'package:quotes/screens/home_screen.dart';
import 'package:quotes/screens/splash_screen.dart';
import 'package:quotes/utils/database.dart';
import 'package:quotes/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSharedPrefrences();
  List<Quote> quotes = await ApiHelper.apiHelper.fetchQuotes();
  await insertQuotes(quotes);
  await fetchData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ThemeProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => QuoteProvider(),
          ),
        ],
        child: Consumer<ThemeProvider>(
          builder: (context,value,widget) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Quotes',
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              themeMode: value.themeMode,
              initialRoute: splashScreen,
              routes: {
                splashScreen: (context) => const SplashScreen(),
                homeScreen: (context) => const HomeScreen(),
                editScreen: (context) => const EditScreen(),
              },
            );
          }
        ));
  }
}
