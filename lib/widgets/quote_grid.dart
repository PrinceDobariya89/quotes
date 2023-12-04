import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes/constant/routes.dart';
import 'package:quotes/provider/quote_provider.dart';

class QuoteGrid extends StatelessWidget {
  const QuoteGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<QuoteProvider>(context, listen: false);
    return FutureBuilder(
      future: data.quotes,
      builder: (context, snapshot) {
        if(!snapshot.hasData){
          return const Center(child: CircularProgressIndicator(),);
        } 
        List<Map<String,dynamic>>? quote = snapshot.data?.toList();
        return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: quote?.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2 / 3),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () =>
                Navigator.pushNamed(context, editScreen, arguments: quote?[index]),
            child: Card(
              elevation: 5,
              shadowColor: Colors.grey,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('${quote?[index]['quote']}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        )),
                    Text('- ${quote?[index]['author']}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ))
                  ],
                ),
              ),
            ),
          );
        },
      );
      },
    );
  }
}
