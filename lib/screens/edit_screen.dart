import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes/provider/quote_provider.dart';
import 'package:quotes/utils/utils.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Share quotes'),
        actions: [
          Consumer<QuoteProvider>(
            builder: (context, value, child) => IconButton(
                onPressed: () {
                  value.refresh();
                },
                icon: const Icon(Icons.restart_alt)),
          ),
          // IconButton(onPressed: (){
          //   showDialog(context: context, builder: (context) => const DoneDialog());
          // }, icon: const Icon(Icons.done_rounded))
          Consumer<QuoteProvider>(
            builder: (context, value, child) => IconButton(
                onPressed: () {
                  value.shareImage();
                }, icon: const Icon(Icons.ios_share_rounded)),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                clipBehavior: Clip.antiAlias,
                elevation: 10,
                child:
                    Consumer<QuoteProvider>(builder: (context, value, child) {
                  return RepaintBoundary(
                    key: value.repaintBoundary,
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      height: 400,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: value.chooseBgColor,
                        image: value.chooseImage != null
                            ? DecorationImage(
                                image: NetworkImage(value.chooseImage!),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: Text(
                        args['quote'],
                        style: TextStyle(
                          fontSize: 24,
                          color: value.chooseColor,
                          fontFamily: value.chooseFontFamily,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }),
              ),
            ),
            Expanded(
              flex: 1,
              child: Card(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Consumer<QuoteProvider>(
                          builder: (context, value, child) {
                            switch (value.selectedEditIndex) {
                              case 0:
                                return _buildColorContainer();
                              case 1:
                                return _buildBgColorContainer();
                              case 2:
                                return _buildFontContainer();
                              case 3:
                                return _buildImageContainer();
                              default:
                                return _buildColorContainer();
                            }
                          },
                        )),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(
                            editList.length,
                            (index) => Consumer<QuoteProvider>(
                                    builder: (context, value, child) {
                                  bool select =
                                      value.selectedEditIndex == index;
                                  return InkWell(
                                    onTap: () {
                                      value.changeEditIndex(index);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(10),
                                      padding: const EdgeInsets.all(9),
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black54,
                                                blurRadius: select ? 6 : 3)
                                          ],
                                          color: select
                                              ? Colors.grey
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color: select
                                                  ? Colors.white
                                                  : Colors.grey,
                                              width: select ? 2 : 1)),
                                      child: Icon(
                                        editList[index],
                                        size: select ? 35 : 30,
                                        color: select
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  );
                                }))),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildColorContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        Colors.accents.length,
        (index) => Consumer<QuoteProvider>(
          builder: (context, value, child) => InkWell(
            onTap: () => value.changeColor(Colors.accents[index]),
            child: Container(
              height: 70,
              width: 70,
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.accents[index],
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey)),
            ),
          ),
        ),
      ),
    );
  }

  _buildBgColorContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        Colors.accents.length,
        (index) => Consumer<QuoteProvider>(
          builder: (context, value, child) => InkWell(
            onTap: () => value.changeBgColor(Colors.accents[index]),
            child: Container(
              height: 70,
              width: 70,
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.accents[index],
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey)),
            ),
          ),
        ),
      ),
    );
  }

  _buildFontContainer() {
    List<String> fontLists = [
      'Nova Square',
      'Dancing Script',
      'Dhurjati',
      'Bebas Neue',
      'Oswald',
      'Pacifico',
      'Playfair Display',
      'Roboto'
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        fontLists.length,
        (index) => Consumer<QuoteProvider>(
          builder: (context, value, child) => InkWell(
            onTap: () => value.changeFont(fontLists[index]),
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey)),
              child: Text(
                fontLists[index],
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: fontLists[index]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildImageContainer() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
            imageList.length,
            (index) => Consumer<QuoteProvider>(
                  builder: (context, value, child) => InkWell(
                    onTap: () => value.changeBgImage(index),
                    child: Container(
                      height: 70,
                      width: 70,
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(imageList[index]),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: value.selectedBgImage == index
                                  ? Colors.purple
                                  : Colors.grey,
                              width: value.selectedBgImage == index ? 2 : 1)),
                    ),
                  ),
                )));
  }
}
