import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:label_lab/modal.dart';
import 'package:label_lab/models/animals_desc.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:path/path.dart';
import 'package:progress_hud/progress_hud.dart';


class ImageClassifyScreen extends StatefulWidget {
  final File image;



  ImageClassifyScreen(this.image);

  @override
  _ImageClassifyScreenState createState() => _ImageClassifyScreenState();
}

class _ImageClassifyScreenState extends State<ImageClassifyScreen> {
  var isLoading = false;
  var count = 0;



  void _setState() {
    setState(() {
      count = 1;
    });
  }

  Future<Animal_Desc> _getHeightWidth(File image) async {
    setState(() {
      count=1;
      isLoading=false;
    });
    Dio dio = new Dio();
    FormData formData = new FormData();
    formData.add("animalimage",
        UploadFileInfo(image, basename(image.path
            .split("/")
            .last)));
    final response = await dio.post(
        'https://radiant-harbor-82820.herokuapp.com/animal/upload',
        data: formData);
    var re = jsonDecode(response.toString());
    return Animal_Desc.fromJson(re);
  }
  modal modal_1 =new modal();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Material(
        child: Stack(
          children: <Widget>[

            Container(
                  height: 700.0,
                  child:PhotoView(

                      imageProvider:FileImage(widget.image),
                  ) ,
            ),
            Align(
              alignment: FractionalOffset.topLeft,
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                child:IconButton(
                  icon:Icon(
                    Icons.arrow_back,
                    color:Colors.white,
                    size: 30.0,
                  ),
                  onPressed: ()=>Navigator.pop(context,false),
                ),
              ),
            ),
            Align(
                alignment: FractionalOffset.bottomCenter,

                  child: Container(

                    height: 50.0,
                    margin: EdgeInsets.only(bottom: 2.0),
                    child: Material(

                        color:Colors.black,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[

                           IconButton(
                             icon: new Icon(Icons.keyboard_arrow_up),
                             color: Colors.white,
                             iconSize: 45.0,
                             onPressed: () => modal_1.mainBottomSheet(context,widget.image),
                           ),

                              ],
                        ),

                  ),
              ),
            )
//            FutureBuilder<Animal_Desc>(
//                future: _getHeightWidth(widget.image),
//              builder: (context, snapshot) {
//
//                  if(snapshot.connectionState==ConnectionState.done && this.count==1){
//
//                      if (snapshot.hasError) {
//                        return Container(
//                          height: 250.0,
//                          width: 400.0,
//
//                          margin: EdgeInsets.only(top: 500.0, left: 50.0),
//                          child: Material(
//                            color: Colors.deepPurpleAccent,
//                            child: Text(
//                                'Something went wroong ${snapshot.error}'),
//                          ),
//                        );
//                      } else {
//                        return Container(
//
//                          height: 250.0,
//                          width: 400.0,
//                          margin: EdgeInsets.only(top: 500.0, left: 50.0,bottom: 10.0,right:50.0),
//                          decoration: BoxDecoration(
//                            borderRadius: BorderRadius.circular(45.0),
//
//                          ),
//                          child: SafeArea(
//                            child: Material(
//                              color: Colors.deepPurpleAccent,
//                              child: Center(
//                                child: Column(
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  children: <Widget>[
//                                    Row(
//                                      mainAxisAlignment: MainAxisAlignment.center,
//                                      children: <Widget>[
//                                        Text("Height",style: TextStyle(
//                                          color: Colors.black,
//                                          fontStyle: FontStyle.normal,
//                                          fontSize: 20.0,
//                                        ),
//                                        ),
//                                        SizedBox(width:30,),
//                                        Text('${snapshot.data.height.toString()}',
//                                          style: TextStyle(
//                                            color: Colors.black,
//                                            fontStyle: FontStyle.normal,
//                                            fontSize: 20.0,
//                                          ),
//                                        ),
//
//                                      ],
//                                    ),
//                                    SizedBox(height:10,),
//                                    Row(
//                                      mainAxisAlignment: MainAxisAlignment.center,
//                                      children: <Widget>[
//                                        Text("Width",style: TextStyle(
//                                          color: Colors.black,
//                                          fontStyle: FontStyle.normal,
//                                          fontSize: 20.0,
//                                        ),
//                                        ),
//                                        SizedBox(width:30,),
//                                        Text('${snapshot.data.width.toString()}',
//                                          style: TextStyle(
//                                            color: Colors.black,
//                                            fontStyle: FontStyle.normal,
//                                            fontSize: 20.0,
//                                          ),
//                                        ),
//
//                                      ],
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
////                          child: Text("Response text" +
////                              snapshot.data.height.toString()),
//                        );
//                      }
//
//
//                  }
//
//                      return ProgressHUD(
//                          containerColor: Colors.black87,
//                          color: Colors.white10,
//                          backgroundColor: Colors.grey,
//                        borderRadius: 5.0,
//                        text: 'Loading...',
//
//                      );
//              },
//            ),
          ],
        ),
      ),
    );
  }
}
