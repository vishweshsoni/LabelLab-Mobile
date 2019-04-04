import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:label_lab/screens/img_from_usr.dart';
class NewHomePage extends StatefulWidget {
  @override
  _NewHomePageState createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          floatingActionButton: Container(
              height: 80.0,
              width: 80.0,
              child: GestureDetector(
                onTap: ()=>{_showImagePicker(context,ImageSource.camera),},
                child: FittedBox(
                        child: Image(
                          image: AssetImage("images/Camera.png"),
                        ),
                ),
              ),

          ),
        body: SafeArea(

          child: Stack(
              children: <Widget>[
                Container(
                  color: Colors.white70,
                  height: MediaQuery.of(context).size.height/6,
                ),
                Container(
                  alignment: FractionalOffset.topCenter,
                  margin: EdgeInsets.only(left: 25.0,top:25.0),
                  width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        shape: BoxShape.rectangle
                    ),
                    child: Image(
                        image: AssetImage("images/Logo.png"),
                        fit: BoxFit.fill,
                    ),
                ),

                Container(
                  alignment: FractionalOffset.topCenter,
                  margin: EdgeInsets.only(left: 120.0,top:35.0),
                  width: 140.0,
                  height: 140.0,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      shape: BoxShape.rectangle
                  ),

                  child: Image(
                    image: AssetImage("images/LabelLab.png"),
                    fit: BoxFit.fill,
                  ),
                ),

                Container(
                  alignment: FractionalOffset.topRight,
                  margin: EdgeInsets.only(top:28.0,right: 20.0),
                  child: IconButton(
                    onPressed: ()=> _showImagePicker(context,ImageSource.gallery),
                    icon: Icon(Icons.add,size: 35,color: Color(0xFF7C57F8),
                   ),
                  ),
                ),
              ],
          ),
        ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar:  BottomAppBar(
              elevation: 0,
              color: Colors.white70,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  height: 56.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Container(
                            height: 30.0,
                            width: 40.0,
                            decoration: BoxDecoration(

                              image: DecorationImage(image: AssetImage("images/Circle.png"),fit: BoxFit.contain),
                            ),
                            child: MaterialButton(
                                height: 40.0,
                                minWidth: 40.0,
                                onPressed: ()=>{}

                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Container(
                            height: 30.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("images/UserLogo.png"),fit: BoxFit.contain
                              ),
                            ),
                            child: MaterialButton(
                                height: 20.0,
                                minWidth: 20.0,
                                onPressed: null

                            ),
                          ),
                        ),

                    ],
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