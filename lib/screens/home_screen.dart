import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes/provider/quote_provider.dart';
import 'package:quotes/provider/theme_provider.dart';
import 'package:quotes/widgets/quote_grid.dart';
import 'package:quotes/widgets/quote_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context, listen: false);
    Widget buildHomeScreen() {
      return Consumer<ThemeProvider>(
        builder: (context, value, child) =>
            value.isList ? const QuoteList() : const QuoteGrid(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quotes'),
        actions: [
          IconButton(
              onPressed: () => provider.changeView(),
              icon: const Icon(Icons.grid_view)),
          Consumer<ThemeProvider>(
            builder: (context, value, child) => IconButton(
                onPressed: () {
                  value.chanegTheme();
                }, icon: const Icon(Icons.dark_mode_outlined)),
          )
        ],
      ),
      body: buildHomeScreen(),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
            activeIcon: Icon(Icons.home_rounded),
            icon: Icon(Icons.home_outlined),
            label: 'Home'),
        BottomNavigationBarItem(
            activeIcon: Icon(Icons.favorite_outlined),
            icon: Icon(Icons.favorite_border_outlined),
            label: 'Favourite')
      ]),
    );
  }
}
