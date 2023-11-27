import 'package:flutter/material.dart';
import 'package:quotes/constant/routes.dart';

class QuoteGrid extends StatelessWidget {
  const QuoteGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 2 / 3),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => Navigator.pushNamed(context, editScreen,arguments: index),
          child: Card(
            elevation: 5,
            shadowColor: Colors.grey,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('data'*10,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,)),const Text('-auther',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,))],),
            ),
          ),
        );
      },
    );
  }
}
