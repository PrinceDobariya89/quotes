import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes/constant/routes.dart';
import 'package:quotes/provider/quote_provider.dart';

class QuoteList extends StatelessWidget {
  const QuoteList({super.key});

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
        return ListView.builder(
        itemCount: quote?.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: const EdgeInsets.only(bottom: 10),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, editScreen, arguments: quote?[index]);
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.all(10),
                        child: Text('${quote?[index]['quote']}',
                            maxLines: 4,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16))),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('- ${quote?[index]['author']}',
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          const Row(
                            children: [
                              Icon(Icons.copy),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.share_outlined)
                            ],
                          ),
                        ],
                      ),
                    )
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