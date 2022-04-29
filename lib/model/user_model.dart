class UserModel {
  String? uid;
  String? email;
  String? name;

  UserModel({this.uid, this.email, this.name});

  factory UserModel.fromMap(map) {
    return UserModel(uid: map['uid'], name: map['name'], email: map['email']);
  }

  Map<String, dynamic> toMap() {
    return {' uid': uid, 'email': email, 'name': name};
  }
}
