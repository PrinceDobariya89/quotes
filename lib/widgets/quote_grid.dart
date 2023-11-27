import 'package:flutter/material.dart';

class QuoteGrid extends StatelessWidget {
  const QuoteGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 2), itemBuilder: (context, index) {
      return Card();
    },);
  }
}
