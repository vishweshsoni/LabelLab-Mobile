//Animal Description is for future purpose

class Animal_Desc {
  int height;
  int width;

  Animal_Desc({this.height,this.width});

  factory Animal_Desc.fromJson(Map<String,dynamic> json){
    return Animal_Desc(
        height : json["height"],
        width : json["width"]
      );

  }
}
