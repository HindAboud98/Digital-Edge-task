class User{
  User({this.id, this.name, this.phone, this.email, this.countryCode});
  String? id;
  String? name;
  String? phone;
  String? email;
  String? countryCode;

  factory User.fromJson(Map<String,dynamic> data){
    return User(
      id: data["id"],
      name: data["name"],
      email: data["email"],
      phone: data["phone"],
      countryCode: data["country_code"],
    );
  }

  Map<String,dynamic> toJson(){
    return {
      "name" : name,
      "email" : email,
      "phone" : phone,
      "country_code": countryCode,
    };
  }

}