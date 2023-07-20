class UserModel {
  int? id;
  String? name;
  String? password;
  String? fullName;
  int? idNumCard;
  String? email;
  int? phoneNum;
  String? address;
  bool? gender;
  String? image;
  UserModel(
      {this.id,
      this.name,
      this.password,
      this.fullName,
      this.email,
      this.phoneNum,
      this.address,
      this.gender,
      this.image,
      this.idNumCard});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    name = json['name'];
    password = json['password'];
    fullName = json['fullName'];
    idNumCard = json['idNumCard'];
    email = json['email'];
    phoneNum = int.parse(json['phoneNum']);
    address = json['address'];
    gender = json['gender'] == '1' ? true : false;
    image = json['image'];
  }
  Map<String, dynamic> toJson(UserModel user) => {
        'id': user.id!,
        'name': user.name!,
        'password': user.name!,
        'fullName': user.name!,
        'idNumCard': idNumCard,
        'email': user.name!,
        'phoneNum': user.name!,
        'address': user.name!,
        'gender': user.name!,
        'image': user.name!,
      };
}
