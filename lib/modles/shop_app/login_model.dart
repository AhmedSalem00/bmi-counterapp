class ShopLoginModel {
  late bool status;
  late String message;
  late UserData data;


  ShopLoginModel.fromJson(Map<String, dynamic> json)
  {
    status = json['status'];
    message = json['message'];
    data = (json['data']!=null? UserData.fromJson(json['data']):null)!;
  }
}

  class UserData {
  late int id;
  late String name;
  late String email;
  late String phone;
  late String image;
  late int point;
  late int credit;
  late String token;

  // UserData({
  //   required this.id,
  //   required this.name,
  //   required this.email,
  //   required this.phone,
  //   required this.image,
  //   required this.point,
  //   required this.credit,
  //   required this.token,
  //
  // });

  UserData.fromJson(Map<String,dynamic> json)
  {
  id = json['id'];
  email = json['email'];
  phone = json['phone'];
  image = json['image'];
  point = json['point'];
  credit = json['credit'];
  token = json['token'];

  }
  }

