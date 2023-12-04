import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<IconData> editList = [
  Icons.color_lens_outlined,
  Icons.format_color_fill_outlined,
  Icons.abc_outlined,
  Icons.image_outlined
];

List<String> fontList = [
  'Nova Square',
  'lato',
  'areal',
  'times in roman',
  'gujrati',
  'english',
  'hindi'
];

List<String> imageList = [
  'https://cdn.pixabay.com/photo/2020/05/04/10/21/background-5128585_1280.jpg',
  'https://cdn.pixabay.com/photo/2015/12/03/08/50/paper-1074131_1280.jpg',
  'https://cdn.pixabay.com/photo/2018/08/14/13/23/ocean-3605547_1280.jpg',
  'https://cdn.pixabay.com/photo/2016/06/02/02/33/triangles-1430105_1280.png',
  'https://cdn.pixabay.com/photo/2015/12/01/15/43/black-1072366_1280.jpg',
  'https://cdn.pixabay.com/photo/2017/03/25/17/55/colorful-2174045_1280.png',
  'https://cdn.pixabay.com/photo/2016/04/15/04/02/water-1330252_1280.jpg',
  'https://cdn.pixabay.com/photo/2017/11/04/21/09/textile-2918844_1280.jpg',
  'https://cdn.pixabay.com/photo/2017/02/16/19/47/bokeh-2072271_1280.jpg',
  'https://cdn.pixabay.com/photo/2017/08/10/02/05/tiles-shapes-2617112_1280.jpg'
];

late SharedPreferences _pref;

Future<SharedPreferences> initSharedPrefrences() async {
  _pref = await SharedPreferences.getInstance();
  return _pref;
}

bool prefGetBool(String key){
  return _pref.getBool(key)??false;
}

prefSetBool(String key,bool value){
  _pref.setBool(key, value);
}

class DoneDialog extends StatelessWidget {
  const DoneDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Confirm?',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Text('Are your sure you want to save all changes!',style: TextStyle(fontSize: 16),),
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: ()=>Navigator.pop(context),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey)
                      ),
                      child: const Text('Cancel')),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text('Save')),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
