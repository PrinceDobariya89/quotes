import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes/provider/quote_provider.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Make your quotes'),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.restart_alt))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Card(
              elevation: 10,
              child: Consumer<QuoteProvider>(
                  builder: (context, value, child) {
                return Container(
                  height: 400,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: value.chooseBgColor,
                    image: DecorationImage(
                      image: NetworkImage(value.chooseImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Text(
                    'data ' * 20,
                    style: TextStyle(
                      fontSize: 24,
                      color: value.chooseColor,
                      fontFamily: value.chooseFontFamily,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              }),
            ),
            const SizedBox(height: 30),
            const Text(
              "Change Font Color",
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 12),
            Card(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: Colors.primaries.map(
                        (e) {
                      return Consumer<QuoteProvider>(
                        builder: (context, value, child){
                          return InkWell(
                            onTap: () {
                                value.changeColor(e);
                            },
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: e,
                              ),
                            ),
                          );
                        }
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Change Background Color",
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 12),
            Card(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: Colors.accents.map(
                        (e) {
                      return Consumer<QuoteProvider>(
                          builder: (context, value, child){
                            return InkWell(
                              onTap: () {
                                value.changeBgColor(e);
                              },
                              child: Container(
                                margin: const EdgeInsets.all(5),
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: e,
                                ),
                              ),
                            );
                          }
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Change Font Family",
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 12),
            const Card(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                // child: Row(
                //   mainAxisSize: MainAxisSize.max,
                //   children: family.map(
                //         (e) {
                //       return InkWell(
                //         onTap: () {
                //             chooseFontFamily = e;
                //         },
                //         child: Card(
                //           child: Container(
                //             margin: const EdgeInsets.all(5),
                //             height: 80,
                //             width: 80,
                //             alignment: Alignment.center,
                //             decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(20),
                //             ),
                //             child: Text(
                //               "Aa",
                //               style: TextStyle(fontFamily: e, fontSize: 26),
                //             ),
                //           ),
                //         ),
                //       );
                //     },
                //   ).toList(),
                // ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Change Background Image",
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 12),
            // Card(
            //   child: SingleChildScrollView(
            //     scrollDirection: Axis.horizontal,
            //     child: Row(
            //       mainAxisSize: MainAxisSize.max,
            //       children: bgImage.map(
            //             (e) {
            //           return InkWell(
            //             onTap: () {
            //                 chooseImage = e;
            //             },
            //             child: Card(
            //               child: Container(
            //                 margin: const EdgeInsets.all(5),
            //                 height: 80,
            //                 width: 80,
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(20),
            //                   image: DecorationImage(
            //                     image: NetworkImage(e),
            //                     fit: BoxFit.cover,
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           );
            //         },
            //       ).toList(),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.ios_share_outlined),
      ),
    );
  }
}
