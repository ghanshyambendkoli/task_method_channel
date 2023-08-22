class UserProfileModel {
  String? name;
  String? imageUrl;
  String? email;
  String? dob;
  String? location;
  
  UserProfileModel({this.name, this.imageUrl,this.email,this.dob,this.location});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    name = json["name"]['first'] +" "+json["name"]['last'];
    imageUrl = json['picture']["medium"];
    email = json['email'];
    dob =json['dob']['date'];
    location= json['location']['street']['name']+", "+json['location']['city']+", "+ json['location']['state']+", "+ json['location']['country'];
  }

}