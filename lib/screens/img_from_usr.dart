import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:label_lab/modal.dart';
import 'package:label_lab/models/animals_desc.dart';
import 'package:label_lab/screens/result_classification.dart';
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





  modal modal_1 = new modal();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: SafeArea(
                child: Align(
                  alignment: FractionalOffset.center,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.black,
                          blurRadius: 12.0,
                        ),
                      ],
                      image: DecorationImage(
                          image: FileImage(widget.image), fit: BoxFit.cover),
                    ),
                    height: 450.0,
                    width: 350.0,
                    margin:
                        EdgeInsets.only(left: 40.0, right: 40.0, bottom: 20.0),
                  ),
                ),
              ),
            ),
            Container(
              alignment: FractionalOffset.topLeft,
              margin: EdgeInsets.only(top: 30.0,left:1.0,right:300.0),
              child: MaterialButton(
                child: Icon(
                  Icons.arrow_back,
                  size: 30.0,
                  color: Colors.black45,
                ),
                onPressed:() => Navigator.pop(context, false),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:33.0),
              alignment: FractionalOffset.topCenter,
              child:Text(
                'LabelLab',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight:  FontWeight.bold,
                  fontFamily: 'Timesroman',
                ),
              ),
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 80.0, bottom: 20.0),
                    height: 50.0,
                    width: 190.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF191925),
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                    child: MaterialButton(
                      child: Center(
                        child: Text(
                          'Classify',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Ewert",
                            fontSize: 17.0,
                          ),
                        ),

                      ),
                      onPressed: ()=>{Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Result(widget.image)))}
                    ),
//                  icon:Icon(
//                    Icons.arrow_back,
//                    color:Colors.white,
//                    size: 30.0,
//                  ),
//                  onPressed: ()=>Navigator.pop(context,false),
                  ),
//                  Container(
//                    margin: EdgeInsets.only(
//                      left: 20.0,
//                      bottom: 20.0,
//                    ),
//                    height: 50.0,
//                    width: 50.0,
//                    decoration: BoxDecoration(
//                      color: Colors.transparent,
//                      borderRadius: BorderRadius.circular(11.0),
//                      border: Border.all(
//                        color: Color(0xFF191925),
//                      ),
//                    ),
//                    child: MaterialButton(child: Icon(Icons.chevron_right,size: 22.0,),onPressed:()=>{Navigator.of(context).push(
//                        MaterialPageRoute(builder: (context) => ImageClassifyScreen(widget.image)))} ),
//                  ),
                ],
              ),
            ),
//            Align(
//                alignment: FractionalOffset.bottomCenter,
//
//                  child: Container(
//
//                    height: 50.0,
//                    margin: EdgeInsets.only(bottom: 2.0),
//                    child: Material(
//
//                        color:Colors.black,
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.end,
//                          children: <Widget>[
//
//                           IconButton(
//                             icon: new Icon(Icons.keyboard_arrow_up),
//                             color: Colors.white,
//                             iconSize: 45.0,
//                             onPressed: () => modal_1.mainBottomSheet(context,widget.image),
//                           ),
//
//                              ],
//                        ),
//
//                  ),
//              ),
//            )
//          FutureBuilder<Animal_Desc>(
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
//                          containerColo   r: Colors.black87,
//                          color: Colors.white10,
//                          backgroundColor: Colors.grey,
//                          borderRadius: 5.0,
//                          text: 'Loading...',
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
