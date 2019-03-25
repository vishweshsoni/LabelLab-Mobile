  import 'dart:convert';
  import 'dart:io';
  import 'package:label_lab/models/animals_desc.dart';
import 'package:rounded_modal/rounded_modal.dart';
  import 'package:dio/dio.dart';
  import 'package:path/path.dart';

  import 'package:flutter/material.dart';

  
  class modal {
    int count=0;
  
    Future<Animal_Desc> _getHeightWidth(File image) async {
  
      Dio dio = new Dio();
      FormData formData = new FormData();
      formData.add("animalimage",
          UploadFileInfo(image, basename(image.path.split("/").last)));
      final response = await dio.post(
          'https://radiant-harbor-82820.herokuapp.com/animal/upload',
          data: formData);
      var re = jsonDecode(response.toString());
      print('called');
      return Animal_Desc.fromJson(re);
  
  
    }
  
    mainBottomSheet(BuildContext context, File image) {
  
      showRoundedModalBottomSheet(
          context: context,
          radius: 10.0,
          builder: (BuildContext context) {
            return Container(
                height: 200.0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(30.0),
                    topRight: const Radius.circular(30.0),
                  ),
                  color: Colors.white.withOpacity(0.7),
                ),
                child: Column(
  
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FutureBuilder<Animal_Desc>(
                      future: _getHeightWidth(image),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                          if (snapshot.hasError) {
                            return Container(
  
                              child: Material(
                                color: Colors.deepPurpleAccent,
                                child:
                                    Text('Something went wroong ${snapshot.error}'),
                              ),
                            );
                          } else {
                            return Container(
                              child: SafeArea(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Height",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'RobotoMono',
                                            fontStyle: FontStyle.normal,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Text(
                                          '${snapshot.data.height.toString()}',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'RobotoMono',
                                            fontStyle: FontStyle.normal,
                                            fontSize: 20.0,
                                          ),
                                        ),
  
  
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Width",
                                          style: TextStyle(
                                            fontFamily: 'RobotoMono',
                                            color: Colors.black,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Text(
                                          '${snapshot.data.width.toString()}',
                                          style: TextStyle(
                                            color: Colors.black,
                                              fontFamily: 'RobotoMono',
                                            fontStyle: FontStyle.normal,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                        }
                        return  CircularProgressIndicator(
                            backgroundColor: Colors.blue,
                          valueColor: new AlwaysStoppedAnimation<Color>(Colors.black87),
  
                        );
                      },
  
                    ),
                  ],
                ),
              ),
            );
          });
    }
  }
