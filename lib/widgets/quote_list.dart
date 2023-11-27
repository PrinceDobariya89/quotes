import 'package:flutter/material.dart';
import 'package:quotes/constant/routes.dart';

class QuoteList extends StatelessWidget {
  const QuoteList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
      return Card(
        margin: const EdgeInsets.only(bottom: 20),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, editScreen,arguments: index);
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                  child: Text('data'*200,maxLines: 4,style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 20))),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('data',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                    Row(
                      children: [Icon(Icons.copy),SizedBox(width: 10,),Icon(Icons.share_outlined)],),
                  ],
                ),
              )
            ],
          ),),
        ),);
    },);
  }
}
