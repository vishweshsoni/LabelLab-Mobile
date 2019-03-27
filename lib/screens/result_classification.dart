import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:label_lab/models/animals_desc.dart';
import 'package:path/path.dart';
import 'package:progress_hud/progress_hud.dart';

class Result extends StatefulWidget {
  final File image;
  Result(this.image);
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {

  var isLoading = false;
  var count = 0;
  //  void _setState() {
  //    setState(() {
  //      count = 1;
  //    });
  //  }
  Future<Animal_Desc> _getHeightWidth(File image) async {

    Dio dio = new Dio();
    FormData formData = new FormData();
    formData.add("animalimage",
        UploadFileInfo(image, basename(image.path.split("/").last)));
    final response = await dio.post(
        'https://radiant-harbor-82820.herokuapp.com/animal/upload',
        data: formData);
    var re = jsonDecode(response.toString());
    return Animal_Desc.fromJson(re);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new FileImage(widget.image),
              fit: BoxFit.cover,
            ),

          ),
          child: Stack(
            children: <Widget>[
                FutureBuilder<Animal_Desc>(
                    future: _getHeightWidth(widget.image),
                    builder: (context,snapshot){
                        if(snapshot.connectionState==ConnectionState.done){
                                if(snapshot.hasError){
                                  return Row(
                                    children: <Widget>[
                                      Align(
                                        alignment: FractionalOffset.bottomCenter,
                                        child:Container(
                                          margin: EdgeInsets.only(left: 20.0,bottom: 20.0 ),
                                          padding: EdgeInsets.only(top: 10.0),
                                          height:60.0,
                                          width: 70.0,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5.0),
                                              border: Border.all(color: Colors.white),
                                              color: Colors.white70

                                          ),
                                          child: Column(
                                            children: <Widget>[
                                              Text('NULL',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:20.0
                                                ),
                                              ),
                                              SizedBox(
                                                height: 2.0,
                                              ),
                                              Text('Height',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:12.0
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),

                                      ),
                                      Align(
                                        alignment: FractionalOffset.bottomCenter,
                                        child:Container(
                                          margin: EdgeInsets.only(left: 20.0,bottom: 20.0 ),
                                          padding: EdgeInsets.only(top: 10.0),
                                          height:60.0,
                                          width: 70.0,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5.0),
                                              border: Border.all(color: Colors.white),
                                              color: Colors.white70

                                          ),
                                          child: Column(
                                            children: <Widget>[
                                              Text('NULL',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:20.0
                                                ),
                                              ),
                                              SizedBox(
                                                height: 2.0,
                                              ),
                                              Text('Width',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:12.0
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),

                                      ),
                                    ],
                                  );
                                }
                                else{
                                    return Row(
                                        children: <Widget>[
                                            Align(
                                              alignment: FractionalOffset.bottomCenter,
                                                  child:Container(
                                                      margin: EdgeInsets.only(left: 20.0,bottom: 20.0 ),
                                                      padding: EdgeInsets.only(top: 10.0),
                                                      height:60.0,
                                                        width: 70.0,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(5.0),
                                                          border: Border.all(color: Colors.white),
                                                          color: Colors.white70

                                                        ),
                                                      child: Column(
                                                        children: <Widget>[
                                                            Text('${snapshot.data.height.toString()}',
                                                              textAlign: TextAlign.left,
                                                              style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize:20.0
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 2.0,
                                                            ),
                                                            Text('Height',
                                                              textAlign: TextAlign.left,
                                                              style: TextStyle(
                                                                  color: Colors.black,
                                                                  fontSize:12.0
                                                              ),
                                                            ),

                                                        ],
                                                      ),
                                                    ),

                                            ),
                                            Align(
                                              alignment: FractionalOffset.bottomCenter,
                                              child:Container(
                                                margin: EdgeInsets.only(left: 20.0,bottom: 20.0 ),
                                                padding: EdgeInsets.only(top: 10.0),
                                                height:60.0,
                                                width: 70.0,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5.0),
                                                    border: Border.all(color: Colors.white),
                                                    color: Colors.white70

                                                ),
                                                child: Column(
                                                  children: <Widget>[
                                                    Text('${snapshot.data.width.toString()}',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize:20.0
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 2.0,
                                                    ),
                                                    Text('Width',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize:12.0
                                                      ),
                                                    ),

                                                  ],
                                                ),
                                              ),

                                            ),
                                        ],
                                    );

                                }
                        }
                        return ProgressHUD(
                            containerColor: Colors.black87,
                            color: Colors.white70,
                            backgroundColor: Colors.grey,
                            borderRadius: 5.0,
                            text: 'Uploading....',

                        );
                    },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
