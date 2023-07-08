final String tableName = 'persons';

class PersonFields {
  static final String int = '_id';
  static final String fullName = 'name';
  static final String e_mail = 'email';
  static final String phoneNum = 'phoneNum';
  static final String isNum = 'isNum';
  static final String address = 'address';
}

class Person {
  final int? id;
  final String fullName;
  final int idNum;
  final int phoneNum;
  final String e_mail;
  final String address;
  final String usrName;
  final String password;
  final String gender;

  Person(this.id, this.fullName, this.idNum, this.phoneNum, this.e_mail,
      this.address, this.usrName, this.password, this.gender);
}
