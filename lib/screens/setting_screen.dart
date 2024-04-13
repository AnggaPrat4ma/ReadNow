// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:my_app/components/asset_image_widget.dart';



class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}


class _SettingScreenState extends State<SettingScreen> {
  int _count = 0;
  final String imageUrl = 'https://picsum.photos/250?image=9';

  void _increment() {
    setState(() {
      _count++;
    });
  }

  void _decrement() {
    if (_count > 0) {
      setState(() {
        _count--;
      });
    }
  }

  // void _perkalian() {
  //   setState(() {
  //     _count = _count*2;
  //   });
  // }

  // _ganjilgenap(){
  //   return _count % 2 == 0 ? 'genap' : 'ganjil';
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: AssetImageWidget(
            imagePath: 'assets/images/icon_flutter.png',
            width: 300,
            height: 300,
            fit: BoxFit.cover,
          ),
        ),
        const Divider(),
        const SizedBox(height: 10,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(padding: const EdgeInsets.only(left: 10), child: Text('Flutter adalah sebuah framework open-source'),)
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                IconButton( onPressed: _increment, icon: const Icon(Icons.thumb_up)),
                IconButton( onPressed: _decrement, icon: const Icon(Icons.thumb_down)),
                Text('$_count Likes')
              ],
            )
          ],
        ),
      ],
    );
  }
}
    
  // return new Container(
  //   child: new Center(
  //     child: new Column(
  //       children: <Widget>[
  //         new Image.asset('assets/images/icon_flutter.png', width: 100, height: 100,),
    //       ],
    //     ),
    //   ),
    // );
    // return Container(
    //   child: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    //         const AssetImageWidget(imagePath: 'assets/images/icon_flutter.png', 
    //         width: 200, 
    //         height: 200,
    //         fit: BoxFit.cover,),
    //         Text('data'),
    //         Row(mainAxisAlignment: MainAxisAlignment.start,children: [
    //           Text('data'),
    //           IconButton(onPressed: _increment, icon: const Icon(Icons.thumb_up)),
    //           IconButton(onPressed: _decrement, icon: const Icon(Icons.thumb_down)),
    //           Text('$_count Likes')
    //         ],)],
    //     ),
    //   )
      // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      //   Image.asset('assets/images/icon_flutter.png',width: 100, height: 100,)
      // ]),
      // child:
      // Row (mainAxisAlignment: MainAxisAlignment.start, children: [
      //   IconButton(onPressed: _increment, icon: const Icon(Icons.thumb_up)),
      //   IconButton(onPressed: _decrement, icon: const Icon(Icons.thumb_down)),
      //   Text('$_count Likes')
      //   // IconButton(onPressed: _perkalian, icon: Icon(Icons.accessibility_sharp)),
      //   // Text(_ganjilgenap())
      // ]),
    //);
  

