class UserModel {
  String? email;
  String? fullName;
  String? phone;
  String? uid;
  String? imageUrl;

  UserModel({
    this.email,
    this.fullName,
    this.phone,
    this.uid,
    this.imageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      fullName: json['fullName'],
      phone: json['phone'],
      uid: json['uid'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'fullName': fullName,
      'phone': phone,
      'imageUrl': imageUrl,
    };
  }
}
