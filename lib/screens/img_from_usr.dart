import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:label_lab/modal.dart';
import 'package:label_lab/models/animals_desc.dart';
import "package:label_lab/screens/result_classification.dart";
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
                      borderRadius: BorderRadius.circular(9.0),
                      boxShadow: [
                        new BoxShadow(
                          color: Color(0xFF7C57F8),
                          blurRadius: 2.0,
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
                  color: Color(0xFF7C57F8),
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
                  color: Color(0xFF7C57F8),
                  fontSize: 30,
                  fontWeight:  FontWeight.bold,
                  fontFamily: 'Timesroman',
                ),
              ),
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                   margin: EdgeInsets.only(bottom: 25.0),
                    height: 50.0,
                    width: 190.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF7C57F8),
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
                      onPressed: (){Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Result(widget.image)));
                      }
                    ),
//                  icon:Icon(
//                    Icons.arrow_back,
//                    color:Colors.white,
//                    size: 30.0,
//                  ),
//                  onPressed: ()=>Navigator.pop(context,false),
                  ),

                ],
              ),
            ),
//
          ],
        ),
      ),
    );
  }
}
