import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:label_lab/screens/img_from_usr.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home : SafeArea(
        left: true,
        right: true,
        top: false,
        bottom: false,
        child: Material(
          child: Container(
            margin: EdgeInsets.only(top:35.0,left: 25.0),
            child: Stack(
              children: <Widget>[

                Row(
                  children: <Widget>[
                    Text(
                      'Albums',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight:  FontWeight.bold,
                        fontFamily: 'Timesroman',
                      ),
                    ),
                    SizedBox(
                      width: 130,
                    ),
                    IconButton(

                      icon: Icon(Icons.camera_alt),
                      color: Colors.grey,
                      iconSize: 30,
                      onPressed: ()=> _showImagePicker(context,ImageSource.camera),
                    ),
                    IconButton(
                      icon: new Icon(Icons.add),
                      color: Colors.grey,
                      iconSize: 35,
                      onPressed: ()=> _showImagePicker(context,ImageSource.gallery),

                    ),


                  ],
                ),
              ],
            ),
          ),

        ),
      ),
    );
  }
}

void _showImagePicker(BuildContext context,ImageSource source){
  ImagePicker.pickImage(source: source).then((image) {
    if (image != null)
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ImageClassifyScreen(image)));
  }).catchError((err) => print(err));

}