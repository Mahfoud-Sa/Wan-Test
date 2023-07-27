class UserModel {
  int? id;
  String? name;
  String? password;
  String? fullName;
  int? idNumCard;
  String? email;
  int? phoneNum;
  String? address;
  int? gender;
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
    idNumCard = int.parse(json['idNumCard']);
    email = json['email'];
    phoneNum = int.parse(json['phoneNum']);
    address = json['address'];
    gender = json['gender'] == 'Male' ? 1 : 0;
    image = json['image'];
    //image = json['idNumCard'];
  }
  Map<String, dynamic> toJson(UserModel user) => {
        //'id': user.id!,
        'name': user.name!,
        'password': user.password!,
        'fullName': user.fullName!,
        'idNumCard': user.idNumCard,
        'email': user.email!,
        'phoneNum': user.phoneNum!,
        'address': user.address!,
        'gender': user.gender!,
        'image': user.image!,
      };
}
